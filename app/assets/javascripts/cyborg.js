// Cyborg
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require_tree ../../../lib/assets/.


//= require cyborg/loader
//= require cyborg/bootswatch

var IMAGE_BG = '/assets/jess-lake.jpg';
var BG_OPACITY = '0.7'


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

    $('.intro').fadeIn('slow');
    $('#play-button').hide();
    $('#page-content').css({opacity: 0.25});
    changeBGopacity('0.7');

    ytplayer.playVideo();
}
function closeVideo() {
    $('.intro').hide();
    $('#play-button').show();
    $('#page-content').css({opacity: 1.0});

    changeBGopacity('0');

    ytplayer.stopVideo();
}

function changeBGopacity(opacity) {
    $('html').css({background: "linear-gradient(rgba(0,0,0," + opacity + "),rgba(0,0,0," + opacity + ")), url(" + IMAGE_BG + ")"})
        .css({backgroundRepeat: "no-repeat"})
        .css({backgroundPosition: "center center"})
        .css({backgroundAttachment: "fixed"})
        .css({backgroundSize: "cover"});
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
        videoId: 'r0LnnSU68Cs'
    });
}

displayVideoImages();

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
        success: function (result) {

            var firstVideoId = result.items[0].snippet.resourceId.videoId;

            $.each(result.items, function (idx, value) {

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
                minSlides: 3,
                maxSlides: 3,
                slideWidth: 130,
                slideMargin: 10,
                preLoadImages: 'all',
                onSliderLoad: function () {
                    $(".bxslider").css("visibility", "visible");
                }
            });
        }
    });
}


function loadVideo(videoID) {
    $("#bxplayer").attr("src", "http://www.youtube.com/embed/" + videoID + "?autoplay=0");
}
//jquery script to run specific pages as specified in ready
(function ($) {
    var ready = $.fn.ready;
    $.fn.ready = function (fn) {
        if (this.context === undefined) {
            // The $().ready(fn) case.
            ready(fn);
        } else if (this.selector) {
            ready($.proxy(function () {
                $(this.selector, this.context).each(fn);
            }, this));
        } else {
            ready($.proxy(function () {
                $(this).each(fn);
            }, this));
        }
    }
})(jQuery);

$('.photos.pics').ready(function () {

    $.ajax({
        type: 'POST',
        url: 'photos/get_json_photos',
        data: {photoset_id: "72157639888541514"},

        success: function (result) {

            var parsedFile= $.parseJSON($.parseJSON(result));

            var photos = parsedFile.photoset.photo;

            appendPhotos(photos);

        }
    }).done(function() {
//        var largePicId = item === "#pics-gallery" ? "#large-pics-item" : "#large-art-item"; //assigns correct item
//        picEnlarge(largePicId);
//        $(item + "-loader").hide();
    });
})



function appendPhotos(photos) {


    $.each(photos, function (count, photo) {//loop through the data and create the pics in the right div

        var column = count % 2 === 0 ? "#photo-col1" : "#photo-col1"; //which column (alternating)

        var src_url = "http://farm" + photo.farm + ".static.flickr.com/" +
            photo.server + "/" + photo.id + "_" + photo.secret + "_" + "q.jpg";

        $(column).append($("<li>")
            .append($("<img>")
                .attr("src", src_url)
                .attr("alt", photo.title)
                .addClass("photos")));
    });
}

