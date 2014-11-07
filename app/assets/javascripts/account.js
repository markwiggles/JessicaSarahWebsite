$(function () {

    initAccordion();
    initDatepicker();
    initCalculations();
    initSelections();
    initMailerBtn()

});


function initMailerBtn() {
    $('#send-btn').click(function() {
        send_mail($(this).attr('data_invoice'));
    });
}

function send_mail (invoiceNumber) {

    $.ajax({
        type: 'POST',
        url: 'mail_pdf',
        data: {invoice: invoiceNumber},
        success: function() {
            console.log(invoiceNumber +' sent');
        }
    });
}


function initSelections() {
    initSelection('#invoice_logo_id', 'invoices/refresh_image');
    initSelection('#invoice_bank_detail_id', 'invoices/refresh_bank_details');
    initSelection('#invoice_biller_id', 'invoices/refresh_biller');
    initSelection('#invoice_debtor_id', 'invoices/refresh_debtor');
    initSelection('#invoice_item_id', 'invoices/refresh_debtor');
    initSelection('#invoice_description_id', null);
    initSelection('#invoice_date', null);
    initSelection('#invoice_amount', null);
}

function initDatepicker() {

    $('.datepicker').datepicker(
        { dateFormat: "dd M yy",
            showOn: "both",
            buttonImage: "/assets/calendar.gif",
            buttonImageOnly: true,
            buttonText: "Select date",
            inline: true}
    );
}

function initCalculations(){
    $('#invoice_amount').change(function () {
        calculateTotals();
    });
    $('#invoice_gst').change(function () {
        calculateTotals();
    });
}

function calculateTotals() {
    var GSTvalue = (parseFloat($('#invoice_amount').val()) / 11).toFixed(2);
    var subTotal = (parseFloat($('#invoice_amount').val())).toFixed(2);

    if ($('#invoice_gst').is(':checked')) {
        $('#tax-calc').html(GSTvalue);
    } else {
        $('#tax-calc').html('na');
    }

    $('#sub-total').html(subTotal);
    $('#total-calc').html(subTotal);
}


function initSelection(elementId, ajaxUrl) {
    $(elementId).change(function () {
        var id = $(this).val();
        //send a call to refresh the logo div
        sendAjaxCall(ajaxUrl, id);
    });
}

function refreshList() {

    var $accordion = $("#accordion").accordion();
    var currentPanel = $accordion.accordion("option", "active");

    $('.form-view').empty();
    //update the list of current settings
    sendAjaxCall('settings/refresh_content', currentPanel);
}

function initAccordion(panel) {

    var active = typeof(panel) !== 'undefined' ? panel : false;

    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s" };

    $("#accordion").accordion({
        collapsible: true,
        active: active,
        icons: icons
    });

    //Clear any form when a panel is selected
    $("#accordion").accordion({
        activate: function (event, ui) {
            $('.form-view').empty();
        }
    });
}

function getFlickrImages(form_name, photoset, container, size, callback, image_id_field, original_secret_field) {

    console.log('calling function');


    //append an image representing a nil value
    $('<img>').attr('id', 'no_image').appendTo($(container));

    // Load images from flickr:
    $.ajax({
        type: 'POST',
        url: 'account/logos/get_json_photos',
        data: {photoset_id: photoset }

    }).done(function (result) {

        loader.hideImage();

        var parsedFile = $.parseJSON($.parseJSON(result));
        var photos = parsedFile.photoset.photo;

        console.log(photos)

        var baseUrl, imageId;

        // Add the images as links with thumbnails to the page:
        $.each(photos, function (index, photo) {

            baseUrl = 'http://farm' + photo.farm + '.static.flickr.com/' +
                photo.server + '/' + photo.id + '_' + photo.secret;


            //replace the forward slash '/' with '-' dash
            imageId = photo.farm + '.static.flickr.com-' +
                photo.server + '-' + photo.id + '_' + photo.secret;


            $('<img>')
                .prop('src', baseUrl + '_' + size + '.jpg')
                .addClass('image-link')
                .attr('id', imageId)
                .attr('alt', photo.originalsecret)
                .appendTo($(container));
        });
        //run the callback e.g. selectImage
        callback != null ? callback(form_name, container, image_id_field, original_secret_field) : '';
    });
}

function sendAjaxCall(path, id) {

    $.ajax({
        type: 'POST',
        url: path,
        dataType: 'script',
        data: {id: id},
        success: function () {
            console.log('ajax call to ' + path + ' with id: ' + id + ' was successful');//for testing
        }
    }); //end ajax
}

/*
 Show the current Image by changing the css (border - red)
 Initialise the images for selection event
 Change the css (border - red) on selection
 */
function selectImage(form_name, container, image_id_field, original_secret_field) {

    //show which pic is currently selected (if any)
    var currentPicId = $('#' + form_name + '_' + image_id_field).val();
    //make this jquery safe by replacing period with escaped backslashes
    currentPicId = currentPicId.replace(/\./g, '\\.');

    if (currentPicId !== 'undefined') {
        $('#' + currentPicId).css({borderColor: 'red'});
    } else {
        $('#no_image').css({borderColor: 'red'});
    }

    $(container + ' img').on('click touchstart', function () {

        // change all images back to default border
        $(container + ' img').css({borderColor: 'lightgrey'});

        //place a red border around the selected image
        $(this).css({borderColor: 'red'});

        //assign the value selected from the chosen field to the input text field boxes
        $('#' + form_name + '_' + image_id_field).val($(this).attr('id'));
        $('#' + form_name + '_' + original_secret_field).val($(this).attr('alt'));
    });
}
