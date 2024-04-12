(function( root, factory ) {
  if( typeof exports === 'object' ) {
    // Node. Does not work with strict CommonJS.
    module.exports = factory();
  } else {
    // Browser globals.
    root.AppSession = factory();
  }
}( this, function() {

  'use strict';

  var AppSession;

  var cacheMaxAgeMs = {
    // Session duration = MAX all pages duration
    session: 2 * 24 * 60 * 60 * 1000, // 2 day

    // HOME page max age
    home: 30 * 60 * 1000, // 30 min

    // Max age any other HTML page
    default: 24 * 60 * 60 * 1000, // 1 day

    timestamp: 10 * 60 * 1000 // 10 min
  };

  function initialize(opts) {
    initSession();
  }

  function initSession() {
    console.info('[session] Init session');
    try {
      // Get the session id (= a time in MS)
      var sessionId = getSessionId() || 0;

      // Check if session expires
      var sessionAge = Math.abs(Date.now() - sessionId);
      if (sessionAge > cacheMaxAgeMs.session) {
        // Create a new session
        createNewSession();
        return; // end (page will be reloaded)
      }

      var isHomePage = window.location.pathname === '/';

      // Check path age
      var pathTime = getPathTime(window.location.pathname);
      var pathAge = Math.abs(Date.now() - pathTime);
      var pathMaxAge = isHomePage
        ? cacheMaxAgeMs.home
        : cacheMaxAgeMs.default;
      if (pathAge > pathMaxAge) {
        reloadPage();
        return; // end
      }

      // Home page: check if there is an update
      if (isHomePage) {
        console.debug('[session] Checking server updates...');
        getTimestamp({
          success: (timestamp) => {
            console.debug('[session] Server timestamp: ' + timestamp);
            if (timestamp > pathTime) {
              const deltaTimestampToPath = timestamp - pathTime;
              if (deltaTimestampToPath > cacheMaxAgeMs.timestamp) {
                // Force to invalidate the session
                console.info('[session] Server has updates: reload session...');
                createNewSession();
              }
            }
          },
          error: (err) => {
            console.error('[session] Cannot load server timestamp', err);
          }
        });
      }

      // Add sessionId to all links
      /*$("a").attr('href', function(i, href) {
        if (!href || href === '#') return; // Skip

        const isSameOrigin = href.startsWith(window.location.origin)
          || (!href.startsWith('http://') && !href.startsWith('https://') && !href.startsWith('@@'));
        if (!isSameOrigin) return href; // Skip

        console.debug('[session] Adding sessionId to href: ' + href);
        const hashIndex = href.indexOf('#');
        const hash = (hashIndex !== -1) ? href.substring(hashIndex) : '';
        href = (hashIndex !== -1) ? href.substring(0, hashIndex) : href;
        // TODO: manage hash ?
        return href
          + (href.indexOf('?') !== -1 ? "&sessionId=" + sessionId : "?sessionId=" + sessionId)
          + hash;
      });*/

    } catch(e) {
      console.error(e)
    }
  }


  function getSessionId() {
    // Read ID
    var sessionId = getStorage().getItem("sessionId");
    if (!sessionId) {
      var searchParams = getSearchParams();
      sessionId = searchParams['sessionId'];
    }
    if (sessionId) {
      console.debug('[app] Found a session ID = ' + sessionId);
    }
    return sessionId && parseInt(sessionId) || undefined;
  }

  function setSessionId(sessionId) {
    console.info('[app] New sessionId = ' + sessionId);

    var storage = getStorage();

    try {
      // Clean previous session storage
      cleanStorage(storage);

      // Store session to local storage
      storage.setItem("sessionId", sessionId);
    }
    catch (e) {
      console.error(e);
    }

    // Redirect to an URL with sessionId
    var searchParams = getSearchParams();
    searchParams.sessionId = sessionId;
    delete searchParams.time;
    var newUrl = window.location.origin
      + window.location.pathname
      + getSearchString(searchParams)
      + window.location.hash;


    console.debug('[app] Force reloading session: ' + newUrl);
    window.location.replace(newUrl);

  }

  function createNewSession(newSessionId) {
    // Generate a new session id (=now)
    const sessionId = newSessionId || Date.now();
    // Store it (will reload)
    setSessionId(sessionId);

    return sessionId;
  }

  function getPathTime(path) {
    // Read path time
    path = path || window.location.pathname;
    var storage = getStorage();
    var pathTime = storage.getItem(path);
    if (pathTime) return parseInt(pathTime);

    pathTime = Date.now();
    try {
      storage.setItem(path, pathTime.toString());
    }
    catch(e) {
      console.error(e);
    }
    return pathTime;
  }

  function reloadPage(path, sessionId) {
    path = path || window.location.pathname;
    var pathTime = Date.now();
    sessionId = sessionId = sessionId || getSessionId();
    var storage = getStorage();

    try {
      // Store path time into the storage
      storage.setItem(path, pathTime.toString());
    }
    catch (e) {
      console.error(e);
    }

    var searchParams = getSearchParams();
    searchParams.sessionId = sessionId; // Force a server reload, and browser cache reload
    searchParams.time = pathTime;

    // Compute the new path
    var newUrl = window.location.origin
      + path
      + getSearchString(searchParams)
      + window.location.hash;

    console.debug('[app] Force reloading page: ' + newUrl);

    // Reload, with a history replacement
    window.location.replace(newUrl);
  }

  function getSearchParams() {
    var paramMap = {};
    var queryString = window.location.search;
    if (queryString && queryString.startsWith('?')) {
      try {
        queryString = (queryString.substr && queryString.substr(1))
          || (queryString.substring && queryString.substring(1));
        var paramArray = queryString.split('&');
        for (var i= 0 ; i<paramArray.length; i++) {
          var paramSpec = paramArray[i];
          var parmParts = paramSpec.split('=');
          var paramName = parmParts[0];
          var paramValue = parmParts[1] || true;
          paramMap[paramName] = paramValue;
        }
      }
      catch (e) {
        console.error(e);
      }
    }
    return paramMap;
  }

  function getStorage() {
    return localStorage || sessionStorage;
  }

  function cleanStorage(storage) {
    storage = storage || getStorage();

    console.info('[app] Cleaning storage...')
    try {
      // Clean every key's value'
      while (storage.length) {
        const key = storage.key(0);
        storage.removeItem(key);
      }
    }
    catch (e) {
      console.error(e)
    }
  }

  function getSearchString(searchParams) {
    searchParams = searchParams || getSearchParams();
    return Object.keys(searchParams).reduce((res, key, index) => {
      var value = searchParams[key] || true;
      return res
        + (index > 0 ? '&' : '?')
        + key + '=' + value;
    }, '');
  }


  function getTimestamp(params) {
    $.ajax({
      cache: false,
      type: 'GET',
      url: '/timestamp.txt',
      dataType: 'text',
      success: function(data) {
        try {
          if (data && data.length >= 13) {
            const timestamp = data && parseInt(data);
            if (params.success) params.success(timestamp);
          }
          else {
            if (params.error) params.error("[session] Invalid timestamp found: " + data);
          }
        }
        catch(err) {
          console.error(err);
          if (params.error) params.error(err);
        }
      },
      error: function(err) {
        if (params.error) params.error(err);
      }
    })
  }

  AppSession = {
    initialize
  };

  return AppSession;

}));
