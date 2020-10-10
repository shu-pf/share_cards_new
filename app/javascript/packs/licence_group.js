console.log('読み込まれました');
var licence_group_submit = document.getElementById("licence_group_submit");
licence_group_submit.onclick = function (){
  var main = document.getElementById("main");
  main.className = 'd-none';
  var spinner = document.getElementById("spinner");
  spinner.className = 'text-center';
};