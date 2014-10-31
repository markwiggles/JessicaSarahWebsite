$(function () {
    $('.datepicker').datepicker(
        { dateFormat: "yy-mm-dd",
            showOn: "button",
            buttonImage: "assets/calendar.gif",
            buttonImageOnly: true,
            buttonText: "Select date",
            inline: true}
    );

    $( "#accordion" ).accordion();



    $('#invoice_amount').change(function () {
        $('#sub-total').html('$' + $(this).val());
    });




});

function refreshList() {

    $('.form-view').empty();
    //update the list of current settings
    sendAjaxCall('account/settings/refresh_content', null);
}

