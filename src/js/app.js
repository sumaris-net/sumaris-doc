(function( root, factory ) {
  if( typeof exports === 'object' ) {
    // Node. Does not work with strict CommonJS.
    module.exports = factory();
  } else {
    // Browser globals.
    root.App = factory();
  }
}( this, function() {

  'use strict';

  var App;
  var menu, notes,
    seminarConfig = {}, seminarParticipants, popoverCounter = 0;

  function initialize(opts) {
    chainByCallback([
      $(document).ready,
      loadExternalFiles,
      (done) => initReveal(opts, done),
      onRevealReady,
      initSeminar,
      (done) => initSession(opts, done),
      () => console.info('[app] App is ready!')
    ]);
  }

  function chainByCallback(jobs) {
    let result;
    for (let i=jobs.length-1; i>=0; i--) {
      const job = jobs[i];
      const callback = result || undefined;
      if (callback) {
        result = () => job(callback);
      }
      else {
        result = job
      }
    }
    return result();
  }

  function loadExternalFiles(callback) {
    console.debug('[app] Loading external sources files');
    var sections = $("section[data-src$='.html']");
    if (sections.length === 0) {
      callback();
      return;
    }

    var loadedSections = 0;
    var checkIfLoaded = () => {
      loadedSections++;
      if (loadedSections === sections.length) {
        callback();
      }
    }
    sections.each((i, section) => {
      var source = section.getAttribute('data-src');
      $(section).load(source, () => checkIfLoaded());
    });
  }


  function initReveal(opts, callback) {

    console.debug('[app] Initialize Reveal...');

    // Full list of configuration options available here:
    // https://github.com/hakimel/reveal.js#configuration
    Reveal.initialize({
      // The "normal" size of the presentation, aspect ratio will
      // be preserved when the presentation is scaled to fit different
      // resolutions. Can be specified using percentage units.
      width: 960,
      height: 700,

      // Factor of the display size that should remain empty around
      // the content
      margin: 0.04,

      // Bounds for smallest/largest possible scale to apply to content
      minScale: 0.2,
      maxScale: 2.0,

      controls: true,
      progress: true,
      history: true,
      center: true,
      mouseWheel: true,
      slideNumber: true,
      keyboard: true,
      fragments: true,
      controlsBackArrows: 'faded',
      pdfMaxPagesPerSlide: 1,
      hideInactiveCursor: true,
      touch: true,

      ...opts,

      customcontrols: {
        controls: [
          {
            id: 'toggle-chalkboard',
            icon: '<i class="fa fa-pen-square"></i>',
            title: 'Toggle chalkboard (B)',
            action: 'RevealChalkboard.toggleChalkboard();'
          },
          {
            id: 'toggle-notes-canvas',
            icon: '<i class="fa fa-pen"></i>',
            title: 'Toggle notes canvas (C)',
            action: 'RevealChalkboard.toggleNotesCanvas();'
          },
          {
            id: 'clear-chalkboard',
            icon: '<i class="fa fa-eraser"></i>',
            title: 'Clear chalkboard (Suppr)',
            action: 'RevealChalkboard.clear();'
          },
          {
            id: 'questions',
            icon: '<i class="fa fa-comments"></i>',
            title: 'Afficher les questions/réponses (Q)',
            action: 'RevealQnA.toggleQnA();'
          }
        ]
      },
      chart: {
        defaults: {
          color: 'lightgray', // color of labels
          scale: {
            beginAtZero: true,
            ticks: { stepSize: 1 },
            grid: { color: "lightgray" } , // color of grid lines
          },
        },
        line: { borderColor: [ "rgba(20,220,220,.8)" , "rgba(220,120,120,.8)", "rgba(20,120,220,.8)" ] },
        bar: { backgroundColor: [ "rgba(20,220,220,.8)" , "rgba(220,120,120,.8)", "rgba(20,120,220,.8)" ]},
        pie: { backgroundColor: [ ["rgba(0,0,0,.8)" , "rgba(220,20,20,.8)", "rgba(20,220,20,.8)", "rgba(220,220,20,.8)", "rgba(20,20,220,.8)"] ]},
        radar: {
          borderColor: [ "rgba(20,220,220,.8)" , "rgba(220,120,120,.8)", "rgba(20,120,220,.8)" ]

        },
        polarArea: { borderColor: [ "rgba(20,220,220,.8)" , "rgba(220,120,120,.8)", "rgba(20,120,220,.8)" ]},
      },
      katex: { // Formula
        local: '',
        delimiters: [
          {left: '$$', right: '$$', display: true},
          {left: '$', right: '$', display: false},
          {left: '\\(', right: '\\)', display: false},
          {left: '\\[', right: '\\]', display: true}
        ],
        ignoredTags: ['script', 'noscript', 'style', 'textarea', 'pre']
      },
      menu: { // Menu works best with font-awesome installed: sudo apt-get install fonts-font-awesome
        transitions: false,
        markers: true,
        hideMissingTitles: true,
        themes: false,
        autoOpen: false,
        custom: [
          { title: 'Aide', icon: '<i class="fa fa-question-circle"></i>',
            content: '<ul class="slide-menu-items">' +
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="RevealMenu.toggle();Reveal.toggleHelp();" href="#">Raccourcis clavier (?)</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.showNotes()" href="#">Ouvrir la vue présentateur (S)</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.showControls()" href="#">Afficher les contrôles</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.showQrCode()" href="#">Afficher le QRCode de la présentation</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.showChalkboard()" href="#">Afficher le tableau (B)</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.writeToSlide()" href="#">Ecrire sur les diapos (C)</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.clearChalkboard()" href="#">Nettoyer le tableau (Suppr)</a>'+
              '<a class="slide-menu-item" style="text-decoration: none;" data-transition="none" onclick="App.showSeminarJoinForm()" href="#">Rejoindre la conférence</a>'+
              '</ul>'
          },
          { title: 'Conférence', icon: '<i class="fa fa-rss"></i>', src: 'seminar-help.html' },
          { title: 'A propos', icon: '<i class="fa fa-info"></i>', src: 'about.html' }
        ]
      },
      chalkboard: { // font-awesome.min.css must be available
        storage: "chalkboard-sumaris-doc",
        colorButtons: 5
      },
      markdown: {
        smartypants: true
      },
      seminar: {
        server: 'https://lvnr.fr', // Seminar server
        url: 'https://lvnr.fr/oser-la-mission',
        room: 'oser-la-mission', // Room name
        hash: '$2a$05$q.9OUEI5hSRGtY/BVXPJM.zn.9q95uqQ7GYb68riUx/8a4JVb83s6',
        autoJoin: true,
        logger: function(event) {
          if (event === 'Room not found' && seminarConfig.password && !seminarConfig.starting) {
            showSeminarHostForm();
          }
          console.debug( '[seminar] ' + event );
        }
      },
      audio: {
        prefix: 'data/',
        suffix: '.mp3',
        textToSpeechURL: null,
        defaultNotes: false,
        defaultText: false,
        advance: 0,
        autoplay: false,
        defaultDuration: 0,
        defaultAudios: false,	// try to play audios with names such as audio/1.2.webm
        defaultPlaybackRate: 1.0, // speed of audio
        playerOpacity: 0.7,	// opacity value of audio player if unfocused
        playerStyle: 'position: fixed; bottom: calc(25vh); left: 25%; width: 50%; height:75px; z-index: 33;', // style used for container of audio controls
        startAtFragment: false, // when moving to a slide, start at the current fragment or at the start of the slide
      },
      plugins: [
        RevealMarkdown,
        RevealMenu,
        RevealNotes,
        RevealHighlight,
        RevealChart,
        RevealMath.KaTeX,
        RevealChalkboard,
        RevealCustomControls,
        RevealFullscreen,
        RevealSeminar,
        RevealPoll,
        RevealQnA,
        RevealQRCode,
        RevealAudioSlideshow
      ]
    });

    Reveal.on( 'ready', callback);
  }

  function onRevealReady(callback){
    const plugins = Reveal.getPlugins();
    menu = plugins.menu;
    notes = plugins.notes;

    // Add header/footer
    var header = $('#header').html();
    if (header) {
      if (window.location.search.match( /print-pdf/gi ) ) {
        Reveal.addEventListener( 'ready', function( event ) {
          $('.slide-background').append(header);
          callback();
        });
      }
      else {
        $('div.reveal').append(header);
        callback();
      }
    }
    else {
      callback();
    }
  }

  function closeMenu() {
    if (menu.isOpen()) menu.toggle();
  }

  function openMenu() {
    if (!menu.isOpen()) menu.toggle();
  }

  function showNotes() {
    menu.toggle();
    notes.open();
    hideControls();
  }

  function showQrCode(modal) {
    closeMenu();

    console.debug('[app] Show QR Code');
    if (!modal) {
      $(document).ready(function() {
        // Init popup
        $("#qrcode-container").dialog({
          autoOpen: false,
          height: "auto",
          width: 400,
          buttons: {
            "Fermer": function() {
              $("#qrcode-container").dialog('close');
            }
          }
        });

        // Open the popup
        $("#qrcode-container").dialog('open');
      });
    }
  }

  function hideQrCodes() {
    console.debug('[app] Hide QR Codes');
    const isOpen = $("#qrcode-container").dialog('isOpen');
    if (isOpen) {
      $("#qrcode-container").dialog('close');
    }
  }

  function showControls() {
    closeMenu();

    console.debug('[app] Show controls');

    Reveal.configure({
      controls:true,
      menu: {
        openButton: true
      },
      keyboard: true,
      mouseWheel: true,
      touch: true
    });

    const elements = document.getElementsByClassName('slide-menu-button');
    if (elements && elements[0]) elements[0].classList.remove('hidden');

    const customcontrolsDiv = document.getElementById('customcontrols');
    if (customcontrolsDiv) {
      let elements = customcontrolsDiv.getElementsByTagName('li');
      for (let i=0; i<elements.length; i++) {
        if (elements[i].id === 'questions' && !RevealSeminar.connected()) {
          elements[i].classList.add('hidden');
        }
        else {
          elements[i].classList.remove('hidden'); // Remove hidden class, has not need
        }
      }
      customcontrolsDiv.classList.remove('hidden');
    }
  }

  function hideControls(config) {
    closeMenu();

    // Hide all controls (e.g. not connected to a seminar)
    if (!RevealSeminar.connected() || RevealSeminar.hosting()) {
      console.debug('[app] Hide all controls');

      Reveal.configure(Object.assign({
        controls:false,
        menu: {
          openButton: false
        },
        keyboard: true,
        mouseWheel: true,
        touch: true
      }, config || {}));

      // Hide the menu button
      const menuButton = document.getElementsByClassName('slide-menu-button');
      if (menuButton && menuButton[0]) menuButton[0].classList.add('hidden');

      // Hide all custom controls
      const customcontrolsDiv = document.getElementById('customcontrols');
      if (customcontrolsDiv) customcontrolsDiv.classList.add('hidden');
      let elements = customcontrolsDiv.getElementsByTagName('li');
      for (let i=0; i<elements.length; i++) {
        elements[i].classList.remove('hidden'); // Remove hidden class, has not need
      }
    }

    // Connected to seminar (as participant): keep menu and questions controls
    else {
      console.debug('[app] Hide controls (but keep menu and questions)');

      Reveal.configure(Object.assign({
        controls:false,
        menu: {
          openButton: true // leave menu button accessible
        },
        keyboard: false,
        mouseWheel: false,
        touch: false
      }, config || {}));

      // Hide the menu button
      const menuButton = document.getElementsByClassName('slide-menu-button');
      if (menuButton && menuButton[0]) menuButton[0].classList.remove('hidden');

      // Hide some custom controls (not all)
      const customcontrolsDiv = document.getElementById('customcontrols');
      if (customcontrolsDiv) {
        customcontrolsDiv.classList.remove('hidden');

        const elements = customcontrolsDiv.getElementsByTagName('li');
        for (let i=0; i < elements.length; i++) {
          if (elements[i].id === 'questions') {
            elements[i].classList.remove('hidden');
          }
          else {
            elements[i].classList.add('hidden');
          }
        }
      }
    }

  }

  function showChalkboard() {
    //RevealChalkboard.resetAll();
    RevealChalkboard.toggleChalkboard();
    return false;
  }

  function clearChalkboard() {
    RevealChalkboard.clear();
  }

  function writeToSlide() {
    RevealChalkboard.toggleNotesCanvas();
  }

  /* -- Session -- */

  function initSession(opts, callback) {
    AppSession.initialize(opts);

    callback();
  }

  /* -- Seminar -- */

  function initSeminar(callback) {
    restoreSeminarConfig();

    if (seminarConfig.password) {
      startSeminar();
    }
    else if (seminarConfig.username) {
      joinSeminar();
    }

    document.addEventListener('seminar', function(event) {
      // User not connected to a seminar: show all controls
      if (!RevealSeminar.connected()) {
        showControls();
      }

      // User is connected to a seminar
      else {
        // If not hosting: hide some controls (should keep menu and questions)
        // and disable keyboard and mouse wheel
        if (!RevealSeminar.hosting()) {
          hideControls();
        }
        // User is hosting: show all controls
        else {
          showControls();
        }

        // User has no username
        if (event.user && !event.user.username) {
          // Try to open the room (or join) as host, using saved username/password
          if (seminarConfig.username && seminarConfig.password) {
            RevealSeminar.open_or_join_room(seminarConfig.password, seminarConfig.username);
          }
          // Try to join using saved username
          else if (seminarConfig.username) {
            RevealSeminar.join_room(seminarConfig.username);
          }
          // Open the join modal, to ask user to choose a username
          else {
            showSeminarJoinForm();
          }
        }
      }
    });

    document.addEventListener('participants', function(event) {
      if (event && event.content) {
        seminarParticipants = (event.content.participants || []);
        console.info('[app] Seminar participants=', seminarParticipants);
      }
    });

    document.addEventListener('welcome', function(event) {
      if (event && event.content) {
        const user = event.content.user;
        console.log('[app] Seminar welcome ', user);
        if (RevealSeminar.hosting()) {
          showWelcomePopover(user);
        }
      }
    })

    callback();
  }

  function restoreSeminarConfig() {
    var configStr = localStorage.getItem('seminarConfig');
    if (configStr) {
      console.debug('[app] Restoring seminar password from local storage...');
      try {
        var config = JSON.parse(configStr);
        Object.assign(seminarConfig, config);
      }
      catch(err) {
        console.error('[app] Cannot restore seminar config:', err);
        return;
      }

      // Restore username
      var usernameInput = document.getElementById('seminar-username');
      if (usernameInput) usernameInput.value = seminarConfig.username || null;

      //var passwordInput = document.getElementById('seminar-password');
      //if (passwordInput) passwordInput.value = seminarConfig.password || null;
    }
  }

  function saveSeminarConfig(config) {
    if (config && (config.password || config.username)) {
      Object.assign(seminarConfig, config);
      console.debug('[app] Saving seminar config to local storage...');
      localStorage.setItem('seminarConfig', JSON.stringify(config));
    }
    else {
      console.debug('[app] Resetting seminar config...');
      localStorage.removeItem('seminarConfig');
      seminarConfig.username = null;
      seminarConfig.password = null;
    }
  }

  function joinSeminar(e) {
    console.log('[app] Joining seminar room...');
    closeMenu();
    if (e) e.preventDefault();
    const usernameInput = document.getElementById('seminar-username');
    const username = usernameInput ? usernameInput.value : seminarConfig.username;
    if (RevealSeminar.connected()) {
      RevealSeminar.join_room(username);
    }

    // Save for the next time (e.g. when refreshing the page)
    if (seminarConfig.username !== username) {
      saveSeminarConfig({username: username});
    }

    // Close dialog
    closeDialog();
  }

  function showSeminarJoinForm() {
    openDialog("seminar.html #seminar-join-form", {
      title: "Rejoindre la conférence",
      buttons: {
        'Rejoindre': joinSeminar,
        'Annuler': closeDialog
      },
      close: closeDialog
    });
  }

  function showSeminarHostForm() {
    openDialog("seminar.html #seminar-host-form", {
      title: "Authentification",
      buttons: {
        'Démarrer': startSeminar,
        'Annuler': closeDialog
      },
    });
  }

  function showSeminarParticipants() {
    let refreshInterval;
    const close = function() {
      if (refreshInterval) clearInterval(refreshInterval);
      closeDialog();
    }
    const refreshRows = function() {
      const $tbody = $("#seminar-participants table tbody");
      $tbody.empty();

      (seminarParticipants || []).forEach(function (participant) {
        const $row = $("<tr style=\"border-bottom: 1px dashed lightgray;\"></tr>");
        $row.append($("<td></td>").text(participant.name));
        $row.append($("<td></td>").text(participant.id));
        $tbody.append($row);
      });
    }
    openDialog("seminar.html #seminar-participants", {
      title: "Participants",
      height: 400,
      width: 550,
      buttons: {
        'Annuler': close
      },
      close: close
    }, function(modal) {
      refreshRows();
      refreshInterval = setInterval(refreshRows, 2000);
    });
  }

  function leaveSeminar(e) {
    console.log('[app] Leaving seminar room...');
    closeMenu();
    if (e) e.preventDefault();

    if (RevealSeminar.connected()) {
      RevealSeminar.leave_room();
    }
    else {
      RevealSeminar.disconnect();
    }

    saveSeminarConfig({username: null});

    closeDialog();
  }

  function startSeminar(e) {
    if (e) e.preventDefault();

    const usernameInput = document.getElementById('seminar-username');
    const username = usernameInput && usernameInput.value || seminarConfig.username ||  'admin';

    const passwordInput = document.getElementById('seminar-password');
    const password = passwordInput && passwordInput.value || seminarConfig.password;

    if (password) {
      console.log('[app] Starting seminar as ' + username);

      seminarConfig.starting = true;

      // Open or join the room
      if (RevealSeminar.connected()) {
        RevealSeminar.close_room(password);
      }
      RevealSeminar.open_or_join_room(password, username);

      // Save the new password
      saveSeminarConfig({password: password, username: username});

      closeMenu();

      // Close dialog
      closeDialog();

      setTimeout(function() {
        seminarConfig.starting = false;

        if (RevealSeminar.hosting()) {
          showSeminarParticipants();
        }
      }, 1000);
    }
    else {
      showError("Le mot de passe est obligatoire");
    }
  }

  function stopSeminar(e) {
    console.log('[app] Stopping seminar...');
    if (e) e.preventDefault();

    var passwordInput = document.getElementById('seminar-password');
    var password = passwordInput && passwordInput.value || seminarConfig.password;
    if (password) {
      RevealSeminar.close_room(password);

      saveSeminarConfig({password: null});
    }
    else {
      showError("Mot de passe obligatoire");
    }
  }

  function closeSeminar() {
    RevealSeminar.disconnect();
    closeDialog();
  }

  function showWelcomePopover(user) {
    // Définissez le contenu du popover et le style
    const username = user.name || 'inconnu';
    showPopover('Connexion de <b>' + username + '</b>', {
      'background-color': 'lightblue',
      'color': 'black'
    });
  }

  function showPopover(message, config) {
    $(document).ready(function() {
      var $popover = $('#popover-container');

      // Définissez le contenu du popover et le style
      $popover.html(message).css(Object.assign({
        'background-color': 'lightblue',
        'color': 'black',
        'padding': '10px',
        'border-radius': '5px',
        'text-align': 'center',
        'position': 'absolute',
        'top': '75px',
        'right': '32px',
        'display': 'none'
      }, config || {}));

      // Affichez le popover
      $popover.fadeIn(400).delay(3000).fadeOut(400);
    });
  }

  function openDialog(url, config, callback) {
    if (!url) throw new Error('Missing argument \'url\'');

    closeMenu();

    console.debug('[app] Opening modal at: ' + url, config);

    $(document).ready(function() {
      $("#popup-container").empty();
      $("#popup-container").load(url, function() {
        config = Object.assign({
          autoOpen: false,
          height: "auto",
          width: "auto",
        }, config || {});

        $("#popup-container #seminar-username").val(seminarConfig.username);
        $("#popup-container #seminar-password").val(seminarConfig.password);

        // Init popup
        $("#popup-container").dialog(config);

        // Open the popup
        $("#popup-container").dialog('open');

        // Callback
        if (typeof callback === 'function') {
          const instance = $("#popup-container").dialog('instance');
          callback(instance);
        }
      });
    });
  }

  function showError(err) {
    $(document).ready(function() {
      $("#popup-container").empty();
      $("#popup-error").text(err);

      // Init popup
      $("#popup-error").dialog({
        modal: true,
        buttons: {
          "OK": function() {
            $(this).dialog("close");
          }
        }
      });

      // Open the popup
      $("#popup-error").dialog("open");

    });
  }

  function closeDialog() {
    $(document).ready(function() {
      const instance = $("#popup-container").dialog("instance");
      if (instance) $("#popup-container").dialog("close");
    });
  }

  App = {
    initialize,
    showNotes,
    showControls,
    showChalkboard,
    clearChalkboard,
    writeToSlide,
    closeDialog,
    showError,
    showQrCode,
    // Seminar
    showSeminarJoinForm,
    showSeminarHostForm,
    joinSeminar,
    leaveSeminar,
    startSeminar,
    stopSeminar,
    showSeminarParticipants
  };

  return App;

}));
