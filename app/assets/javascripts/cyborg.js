// Cyborg
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require cyborg/loader
//= require cyborg/bootswatch


function display_page_content(content) {
    $('#page-content').empty().html(content);
    $('#artist-name').hide();
}


$('#play-button').hover(function () {
    $(this).stop().animate({ width: 105, height: 105, opacity: 1.0 }, 'fast');
}, function () {
    $(this).stop().animate({ width: 100, height: 100, opacity: 0.7 }, 'fast');
});


//Add events for the play button to play the video and close
$('#play-button').on('touchstart click', function (e) {
    displayVideo();
});
$('#intro-close').on('touchstart click', function (e) {
    closeVideo();
});

closeVideo();

function displayVideo() {
    $('.video-container').fadeIn('slow');
    $('#play-button').hide();
    $('#page-content').css({opacity: 0.25});
    $('html').css({background: "linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)), url('http://farm3.static.flickr.com/2857/12707420595_d1bc23ca0b_b.jpg')"})
        .css({backgroundRepeat: "no-repeat"})
        .css({backgroundPosition: "center center"})
        .css({backgroundAttachment: "fixed"})
        .css({backgroundSize: "cover"});
    player.playVideo();
}
function closeVideo() {
    $('.video-container').hide();
    $('#play-button').show();
    $('#page-content').css({opacity: 1.0})
    $('html').css({background: "linear-gradient(rgba(0,0,0,0),rgba(0,0,0,0)), url('http://farm3.static.flickr.com/2857/12707420595_d1bc23ca0b_b.jpg')"})
        .css({backgroundRepeat: "no-repeat"})
        .css({backgroundPosition: "center center"})
        .css({backgroundAttachment: "fixed"})
        .css({backgroundSize: "cover"});

    player.stopVideo();
}


//Load player api asynchronously.
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
var done = false;
var player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('ytplayer', {
        height: '390',
        width: '640',
        videoId: 'r0LnnSU68Cs',
        events: {
            'onReady': onPlayerReady
            //'onStateChange': onPlayerStateChange
        }
    });
}
function onPlayerReady(evt) {
    evt.target.pauseVideo();
}

//function onPlayerStateChange(evt) {
//    if (evt.data == YT.PlayerState.PLAYING && !done) {
//        setTimeout(stopVideo, 6000);
//        done = true;
//    }
//}


//player.playVideo();


function stopVideo() {
    player.stopVideo();
}