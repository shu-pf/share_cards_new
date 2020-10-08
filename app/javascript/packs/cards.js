// プレビューを表示
var input_file = document.getElementById("card_img");
input_file.onchange = function (){
  if(!(input_file.value)) return;
  if(!(window.URL)) return;
  var file_list = input_file.files;
  if(!file_list) return;

  var file = file_list[0];
  if(!file) return;

  var blob_url = window.URL.createObjectURL(file);

  var background_preview = document.getElementById("background-preview");
  background_preview.src = blob_url;
};

var design_type = document.getElementById("design_type");
design_type.onchange = function (){
  var background_preview = document.getElementById("background-preview");
  switch (design_type.selectedIndex) {
    case 0:
      if(!(input_file.value)){
        background_preview.src = '/sample.png';
      }
      if(!(window.URL)) break;
      var file_list = input_file.files;
      if(!file_list) break;
      var file = file_list[0];
      if(!file) break;
      var blob_url = window.URL.createObjectURL(file);
      var background_preview = document.getElementById("background-preview");
      background_preview.src = blob_url;
      break;
    case 1:
      background_preview.src = '/samplecard1.png';
      break;
    default:
      console.log(design_type.selectedIndex);
  }
};

var format = document.getElementById("format");
format.onchange = function (){
  var background_preview = document.getElementById("background-preview");
  var message = document.getElementById("message");
  console.log(format.selectedIndex);
  switch (format.selectedIndex) {
    case 0:
      background_preview.className = '';
      message.className = 'd-none';
      break;
    case 1:
      background_preview.className = 'd-none';
      message.className = 'text-center my-5';
      break;
  }
};