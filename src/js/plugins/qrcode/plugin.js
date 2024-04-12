
window.RevealQRCode = window.RevealQRCode || {
  id: 'RevealQRCode',
  init: function (deck) {
    initQrCode(deck);
  }
};

const initQrCode = function(Reveal){
  //TODO include slide numbers
  var url = window.location.href;

  console.log('[qrcode] Initializing...');

  //FIXME better sizing
  var config = Reveal.getConfig();
  var size = Math.min(config.height, config.width) - 200;

  var containers = document.querySelectorAll("div.reveal-js-qrcode");
  containers.forEach(
    function(e){
      e.style.display = "flex";
      e.style.flexDirection = "column";
      e.style.alignItems = "center";
      var width = Math.min(e.width != null ? e.width : size, 350);
      var height = Math.min(e.height != null ? e.height : size, 350);
      new QRCode(e, {text:url, width:width, height:height});
      if(e.classList.contains("reveal-js-qrcode-display-link")){
        var p = document.createElement("p");
        var a = document.createElement("a");
        a.href = url;
        a.textContent = url;
        p.appendChild(a);
        e.appendChild(p);
      }
    });
};
