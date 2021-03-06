// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap/tooltip
//= require_tree .

var player;

 function onYouTubeIframeAPIReady() {
     var videos = document.getElementsByTagName('iframe'), // the iframes elements
         players = [], // an array where we stock each videos youtube instances class
         playingID = null; // stock the current playing video
     for (var i = 0; i < videos.length; i++) // for each iframes
     {
         var currentIframeID = videos[i].id; // we get the iframe ID
         players[currentIframeID] = new YT.Player(currentIframeID); // we stock in the array the instance
         // note, the key of each array element will be the iframe ID
         
         videos[i].onmouseover = function(e) { // assigning a callback for this event
             var currentHoveredElement = e.target;
             if (playingID) // if a video is currently played
             {
                 players[playingID].pauseVideo();
             }
             players[currentHoveredElement.id].playVideo();
             playingID = currentHoveredElement.id;
         };
     }
    
 }
 onYouTubeIframeAPIReady();

 $(document).ready(function () {

    $(".player").mb_YTPlayer();

});
