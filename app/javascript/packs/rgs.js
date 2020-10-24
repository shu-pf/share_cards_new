var camera = document.getElementById("camera");
camera.onclick = function (){
  const video = document.querySelector("video");
  video.className = "";

  let p = navigator.mediaDevices.getUserMedia({ audio: false, video: true });

  p.then(function(stream) {
    video.srcObject = stream;
    let canv = document.createElement("canvas");
    canv.height = video.height;
    canv.width = video.width;
    const context = canv.getContext("2d");

    var QRgeted = false;

    setInterval(() => {
      context.drawImage(video, 0, 0, video.width, video.height);
      const imageData = context.getImageData(0, 0, video.width, video.height);
      const code = jsQR(imageData.data, imageData.width, imageData.height);
      if (code && QRgeted == false) {
        console.log("Found QR code", code, code.data);
        window.location.href = code.data;
        QRgeted = true;
      }
    }, 500);
  });
};