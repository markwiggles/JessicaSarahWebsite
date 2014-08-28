// Cyborg
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require_tree ../../../lib/assets/.


//= require cyborg/loader
//= require cyborg/bootswatch

var imageBg = '/assets/jess-lake.jpg';



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


function displayVideo() {

    $('.video-container').fadeIn('slow');
    $('#play-button').hide();
    $('#page-content').css({opacity: 0.25});
    $('html').css({background: "linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)), url(" + imageBg + ")"})
        .css({backgroundRepeat: "no-repeat"})
        .css({backgroundPosition: "center center"})
        .css({backgroundAttachment: "fixed"})
        .css({backgroundSize: "cover"});

    ytplayer.playVideo();
}
function closeVideo() {
    $('.video-container').hide();
    $('#play-button').show();
    $('#page-content').css({opacity: 1.0})
    $('html').css({background: "linear-gradient(rgba(0,0,0,0),rgba(0,0,0,0)), url(" + imageBg + ")"})
        .css({backgroundRepeat: "no-repeat"})
        .css({backgroundPosition: "center center"})
        .css({backgroundAttachment: "fixed"})
        .css({backgroundSize: "cover"});
    ytplayer.stopVideo();
}


//Create the youtube player
var ytplayer = null;

var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


function onYouTubeIframeAPIReady() {
    // it is important to return when window.ytplayer
    // is already created - because you will be missing
    // certain methods like getCurrentTime
    if (!window.YT || window.ytplayer) {
        return;
    }
    ytplayer = new YT.Player('ytplayer', {
        height: '315',
        width: '560',
        videoId: 'r0LnnSU68Cs',
        events: {
            'onReady': onPlayerReady
        }
    });
}
function onPlayerReady(evt) {
    evt.target.playVideo();
    setTimeout(stopVideo, 3000);
}
//function onPlayerStateChange(evt) {
//    if (evt.data == YT.PlayerState.PLAYING && !done) {
//        setTimeout(stopVideo, 6000);
//        done = true;
//    }
//}
function stopVideo() {
    console.log(ytplayer);
    ytplayer.stopVideo();
}

function displayVideoImages() {

    var base_url = "https://www.googleapis.com/youtube/v3/playlistItems";
    var api_key = "AIzaSyC_-oKFFF-sN44qM0KLP4dSDjibFUWs1HQ";
    var playlistId = "PLHwVhpfylJ4uOd9GavrgH6pfbtj01TC19";
    var user = "JessWigglesworth";

    $.ajax({
        type: 'GET',
        url: base_url,
        data: {
            part: 'snippet',
            playlistId: playlistId,
            key: api_key
        },
        success: function(result) {

            var firstVideoId = result.items[0].snippet.resourceId.videoId;

            $.each(result.items,function(idx,value){

                var video = value.snippet;
                var videoId = video.resourceId.videoId;
                var videoImg = video.thumbnails.default.url;
                $('.bxslider')
                    .append($("<li>").attr("id", videoId)
                        .append($("<a>").attr("onclick", "loadVideo('" + videoId + "');")
                            .append($("<img>").attr("src", videoImg).attr("alt", video.title)
                        )));
            });

            loadVideo(firstVideoId);

            $('.bxslider').bxSlider({
                minSlides: 2,
                maxSlides: 2,
                slideWidth: 150,
                slideMargin: 10,
                preLoadImages: 'all',
                onSliderLoad: function() {
                    $(".bxslider").css("visibility", "visible");
                }
            });
        }
    });

}

displayVideoImages();
