// Cyborg
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree ../../../lib/assets/twitter/.
//= require_tree ../../../lib/assets/bootstrap-image-gallery/.
//= require_tree ../../../lib/assets/.
//= require jquery-ui
//= require account.js


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
    $('html').removeClass('bg-light').addClass('bg-dark');

    ytplayer.playVideo();
}
function closeVideo() {
    $('.intro').hide();
    $('#play-button').show();
    $('#page-content').css({opacity: 1.0});
    $('html').removeClass('bg-dark').addClass('bg-light');

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
        origin: 'http://localhost:3000'
    });
}


function displayVideoImages() {

    //show the ajax loading image
    loader.appendToDiv('.video-page');

    $.ajax({
        type: 'POST',
        url: 'music/get_video_thumbs',
        success: function (result) {

            loader.hideImage();

            var parsed = $.parseJSON($.parseJSON(result));
            var thumbs = parsed.items;
            var firstVideoId = thumbs[0].snippet.resourceId.videoId;

            $.each(thumbs, function (idx, value) {
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
        $('html').removeClass('bg-light').addClass('bg-dark');
        $('#page-content').css({opacity: 0.2});
        $('#latest-news').fadeIn('slow');
        $(this).hide();
    });
    $('#latest-news .close-x').on('touchstart click', function (e) {
        e.preventDefault();
        $('html').removeClass('bg-dark').addClass('bg-light');
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

//AUTO_RESIZE FACEBOOK POST

(function($) {

    jQuery.fn.autoResizeFbPost = function() {

        console.log('autoresize');

        var fixWidth = function($container, $clonedContainer, doParse) {

            // default parameter.
            doParse = typeof doParse == 'undefined' ? true : doParse;

            var updatedWidth = $container.width();

            // update all div.fb-post with correct width of container
            $clonedContainer
                .find('div.fb-post')
                .each(function() {
                    $(this).attr('data-width', updatedWidth);
                });

            // update page with adjusted markup
            $container.html( $clonedContainer.html() );

            // should we call FB.XFBML.parse? we don't want to do this at page load because it will happen automatically
            if (doParse && FB && FB.XFBML && FB.XFBML.parse)
                FB.XFBML.parse();
        };

        return this.each(function() {
            var $container = $(this),
                $clonedContainer = $container.clone();

            // make sure there is a .fb-post element before we do anything.
            if ( ! $container.find('div.fb-post').length) {
                return false;
            }

            // execute once (document.ready) and do not call FB.XFBML.parse()
            fixWidth($container, $clonedContainer, false);

            // on window resize, update and fix..
            $(window).on('resize', function() {

                // only trigger fixWidth once after window has not been resized for 1 second
                delayFireOnce(1000).done(function() {
                    fixWidth($container, $clonedContainer);
                });

            });

            // helper function
            var	delayTimer;
            var delayFireOnce = function(timeout) {
                var d = $.Deferred();
                clearTimeout(delayTimer);

                t = setTimeout(function() {
                    d.resolve();
                }, timeout);

                return d.promise();
            };

        });
    };

})(jQuery);

(function($) {
    $(document).ready(function() {
        $('#facebook_embed').autoResizeFbPost();
    });
})(jQuery);


function sendAjaxCall(path, id) {

    console.log('receiving ajax call');

    $.ajax({
        type: 'POST',
        url: path,
        dataType: 'script',
        data: {id: id},
        success: function () {
            console.log('ajax call to ' + path + ' was successful');//for testing
        }
    }); //end ajax
}