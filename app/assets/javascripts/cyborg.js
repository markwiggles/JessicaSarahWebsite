// Cyborg
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree ../../../lib/assets/twitter/.
//= require_tree ../../../lib/assets/bootstrap-image-gallery/.
//= require_tree ../../../lib/assets/.


//= require cyborg/loader
//= require cyborg/bootswatch


var IMAGE_BG = '/assets/jess-lake.jpg';
var BG_OPACITY = '0.9';


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
    $('#page-content').css({opacity: 0.1});
    changeBGopacity(BG_OPACITY);

    ytplayer.playVideo();
}
function closeVideo() {
    $('.intro').hide();
    $('#play-button').show();
    $('#page-content').css({opacity: 1.0});

    changeBGopacity('0.0');

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
        videoId: 'r0LnnSU68Cs',
        origin: 'http://localhost:3000'
    });
}


function displayVideoImages() {

    var base_url = "https://www.googleapis.com/youtube/v3/playlistItems";
    var api_key = "AIzaSyC_-oKFFF-sN44qM0KLP4dSDjibFUWs1HQ";
    var playlistId = "PLHwVhpfylJ4uOd9GavrgH6pfbtj01TC19";
    var user = "JessWigglesworth";

    loader.appendToDiv('.video-page');


    $.ajax({
        type: 'GET',
        url: base_url,
        data: {
            part: 'snippet',
            playlistId: playlistId,
            key: api_key
        },
        success: function (result) {

            loader.hideImage();


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

//Call the ajax function to get the flickr photos, for the photoset, and display on the page
$('.music.video').ready(function () {
    displayVideoImages();
});
$('.photos.pics').ready(function () {
    var photoset = '72157639888541514';
    getFlickrPhotos(photoset);
});
$('.photos.art').ready(function () {
    var photoset = '72157639888569874';
    getFlickrPhotos(photoset);
});



function getFlickrPhotos(photoset) {
    'use strict';

    loader.appendToDiv('.photo-gallery');

    // Load images from flickr:
    $.ajax({

        type: 'POST',
        url: 'photos/get_json_photos',
        data: {photoset_id: photoset }

    }).done(function (result) {

        loader.hideImage();

        var parsedFile = $.parseJSON($.parseJSON(result));
        var photos = parsedFile.photoset.photo;

        var linksContainer = $('#links'),
            baseUrl;

        // Add the images as links with thumbnails to the page:
        $.each(photos, function (index, photo) {
            baseUrl = 'http://farm' + photo.farm + '.static.flickr.com/' +
                photo.server + '/' + photo.id + '_' + photo.secret;
            $('<a/>')
                .append($('<img>').prop('src', baseUrl + '_s.jpg'))
                .prop('href', baseUrl + '_c.jpg')
                //.prop('title', photo.title)
                .attr('data-gallery', '')
                .appendTo(linksContainer);
        });
    });
}

function appendShowLoader(div) {
    $(div).append($('<img>').attr('src', 'assets/loading.gif').addClass('loader'));
    $('.loader').show();
}

var loader = new function () {
    this.hideImage = function () {
        $('.loader').hide();
    };
    this.appendToDiv = function (div) {
        $(div).append($('<img>')
            .attr('src', 'assets/loading.gif').addClass('loader'));
        $('.loader').show();
    };
}


$('.music.tracks').ready(function () {

    (function () {
        var widgetIframe = document.getElementById('sc-widget'),
            widget = SC.Widget(widgetIframe);

        widget.bind(SC.Widget.Events.READY, function () {
            widget.bind(SC.Widget.Events.PLAY, function () {
                // get information about currently playing sound
                widget.getCurrentSound(function (currentSound) {
//                        $.each(currentSound, function(key,property){
//                            console.log(key + " : " + property);
//                        });
                    console.log(currentSound.title);
                });
            });

        });
    }());
});


$('.home.index').ready(function () {

    getTwitter();

    $('#show-latest-news').on('touchstart click', function (e) {
        e.preventDefault();
        changeBGopacity(BG_OPACITY);
        $('#page-content').css({opacity: 0.2});
        $('#latest-news').fadeIn('slow');
        $(this).hide();
    });
    $('#latest-news .close-x').on('touchstart click', function (e) {
        e.preventDefault();
        changeBGopacity('0.0');
        $('#page-content').css({opacity: 1.0});
        $('#latest-news').hide();
        $('#show-latest-news').show();
    });
});


$('.admin.news_update').ready(function () {

    var facebookPost = $('.fb-text-input').html();
    var decoded = $("<div/>").html(facebookPost).text();
    $('#facebook-post-monitor').html(decoded);

});

$('#blueimp-gallery')
    .on('open', function (event) {
        // Gallery open event handler
    })
    .on('opened', function (event) {
        // Gallery opened event handler
    })
    .on('slide', function (event, index, slide) {
        // Gallery slide event handler - get the current slide
        changeSlidesource($(slide).children().attr('src'));
    })
    .on('slideend', function (event, index, slide) {
        // Gallery slideend event handler
    })
    .on('slidecomplete', function (event, index, slide) {
        // Gallery slidecomplete event handler
    })
    .on('close', function (event) {
        // Gallery close event handler
    })
    .on('closed', function (event) {
        // Gallery closed event handler
    });

//Function to write the href of the current slide to the download button
function changeSlidesource(imageSrc) {
    var imageSrc = imageSrc.replace('_c.jpg', '_b.jpg')
    $('.download').attr('href', imageSrc);
}