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