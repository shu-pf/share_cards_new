var player_container = document.getElementById("player_container");
var player_title = document.getElementById("player_title");
var player_artist = document.getElementById("player_artist");

var audio = document.getElementById("audio");
var scrollbar = document.getElementById("scrollbar");
audio.addEventListener('timeupdate', (event) => {
  scrollbar.style.width = audio.currentTime/audio.duration * 100 +'%';
});

var play = document.getElementById("play");
var pause = document.getElementById("pause");

play.onclick = function (){
  audio.play();
  play.className = "d-none";
  pause.className = "now";
};

pause.onclick = function (){
  audio.pause();
  play.className = "now";
  pause.className = "d-none";
};

var scrollbar_glay = document.getElementById("scrollbar_glay");

scrollbar_glay.onclick = function (e){
  audio.currentTime = audio.duration * (e.offsetX/scrollbar_glay.clientWidth);
};

var scrollbar = document.getElementById("scrollbar");

scrollbar.onclick = function (e){
  audio.currentTime = audio.duration * (e.offsetX/scrollbar_glay.clientWidth);
};