// プレビューを表示
var input_file = document.getElementById("card_img_front");
input_file.onchange = function (){
  if(!(input_file.value)) return;
  if(!(window.URL)) return;
  var file_list = input_file.files;
  if(!file_list) return;

  var file = file_list[0];
  if(!file) return;

  var blob_url = window.URL.createObjectURL(file);
  console.log(blob_url);

  var background_preview = document.getElementById("background-preview");
  background_preview.src = blob_url;
};

// QRコードの位置調整
document.getElementById("button-up").onclick = function(e) {
  el = document.getElementById("qr");
  el.style.top = parseInt(el.style.top)-1 + "px";

  elqrposition_y = document.getElementById("qr-position-y");
  elqrposition_y.value = el.style.top;
  e.preventDefault();
};

document.getElementById("button-down").onclick = function(e) {
  el = document.getElementById("qr");
  el.style.top = parseInt(el.style.top)+1 + "px";

  elqrposition_y = document.getElementById("qr-position-y");
  elqrposition_y.value = el.style.top;
  e.preventDefault();
};

document.getElementById("button-left").onclick = function(e) {
  el = document.getElementById("qr");
  el.style.left = parseInt(el.style.left)-1 + "px";

  elqrposition_x = document.getElementById("qr-position-x");
  elqrposition_x.value = el.style.left;
  e.preventDefault();
};

document.getElementById("button-right").onclick = function(e) {
  el = document.getElementById("qr");
  el.style.left = parseInt(el.style.left)+1 + "px";

  elqrposition_x = document.getElementById("qr-position-x");
  elqrposition_x.value = el.style.left;
  e.preventDefault();
};

// 位置座標について：https://qiita.com/yukiB/items/cc533fbbf3bb8372a924
document.getElementById("card").onclick = function(e) {
  var target_rect = e.currentTarget.getBoundingClientRect();

  el = document.getElementById("qr");
  qrwidth = parseInt(el.style.width);
  qrheight = parseInt(el.style.height);

  el.style.top=e.clientY - target_rect.top - qrheight/2 + "px";
  el.style.left=e.clientX - target_rect.left - qrwidth/2 + "px";

  if(parseInt(el.style.top)<0){
    el.style.top = "0px"
  }
  if(parseInt(el.style.top)+qrheight>379){
    el.style.top = 379-qrheight+"px"
  }
  if(parseInt(el.style.left)<0){
    el.style.left = "0px"
  }
  if(parseInt(el.style.left)+qrwidth>627){
    el.style.left = 627-qrwidth+"px"
  }

  elqrposition_x = document.getElementById("qr-position-x");
  elqrposition_y = document.getElementById("qr-position-y");
  elqrposition_x.value = parseInt(el.style.left) * 2 + "px";
  elqrposition_y.value = parseInt(el.style.top) * 2 + "px";
};

// シリアルコードの位置調整
document.getElementById("button-up-back").onclick = function(e) {
  el = document.getElementById("serial_code");
  el.style.top = parseInt(el.style.top)-1 + "px";

  elqrposition_y = document.getElementById("serial_position_y");
  elqrposition_y.value = el.style.top;
  e.preventDefault();
};

document.getElementById("button-down-back").onclick = function(e) {
  el = document.getElementById("serial_code");
  el.style.top = parseInt(el.style.top)+1 + "px";

  elqrposition_y = document.getElementById("serial_position_y");
  elqrposition_y.value = el.style.top;
  e.preventDefault();
};

document.getElementById("button-left-back").onclick = function(e) {
  el = document.getElementById("serial_code");
  el.style.left = parseInt(el.style.left)-1 + "px";

  elqrposition_x = document.getElementById("serial_position_x");
  elqrposition_x.value = el.style.left;
  e.preventDefault();
};

document.getElementById("button-right-back").onclick = function(e) {
  el = document.getElementById("serial_code");
  el.style.left = parseInt(el.style.left)+1 + "px";

  elqrposition_x = document.getElementById("serial_position_x");
  elqrposition_x.value = el.style.left;
  e.preventDefault();
};

// プレビューを表示
var input_file = document.getElementById("card_img_back");
input_file.onchange = function (){
  if(!(input_file.value)) return;
  if(!(window.URL)) return;
  var file_list = input_file.files;
  if(!file_list) return;

  var file = file_list[0];
  if(!file) return;

  var blob_url = window.URL.createObjectURL(file);
  console.log(blob_url);

  var background_preview = document.getElementById("background_preview_back");
  background_preview.src = blob_url;
};

// 位置座標について：https://qiita.com/yukiB/items/cc533fbbf3bb8372a924
document.getElementById("card_back").onclick = function(e) {
  var target_rect = e.currentTarget.getBoundingClientRect();

  el = document.getElementById("serial_code");
  serialwidth = parseInt(el.style.width);
  serialheight = parseInt(el.style.height);

  el.style.top=e.clientY - target_rect.top - serialheight/2 + "px";
  el.style.left=e.clientX - target_rect.left - serialwidth/2 + "px";

  if(parseInt(el.style.top)<0){
    el.style.top = "0px"
  }
  if(parseInt(el.style.top)+serialheight>379){
    el.style.top = 379-serialheight+"px"
  }
  if(parseInt(el.style.left)<0){
    el.style.left = "0px"
  }
  if(parseInt(el.style.left)+serialwidth>627){
    el.style.left = 627-serialwidth+"px"
  }

  serial_position_x = document.getElementById("serial_position_x");
  serial_position_y = document.getElementById("serial_position_y");
  serial_position_x.value = parseInt(el.style.left) * 2 + "px";
  serial_position_y.value = parseInt(el.style.top) * 2 + "px";
};