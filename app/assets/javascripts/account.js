$(function () {
    $('.datepicker').datepicker(
        { dateFormat: "yy-mm-dd",
            showOn: "button",
            buttonImage: "assets/calendar.gif",
            buttonImageOnly: true,
            buttonText: "Select date",
            inline: true}
    );





    initAccordion();


    $('#invoice_amount').change(function () {
        $('#sub-total').html('$' + $(this).val());
    });


});

function refreshList() {

    var $accordion = $("#accordion").accordion();
    var current = $accordion.accordion("option","active");

    console.log(current);

    $('.form-view').empty();
    //update the list of current settings
    sendAjaxCall('account/settings/refresh_content', current);



}

function  initAccordion() {

        var icons = {
            header: "ui-icon-circle-arrow-e",
            activeHeader: "ui-icon-circle-arrow-s" };

        $("#accordion").accordion({
            collapsible: true,
            active: false,
            icons: icons
        });


        $("#accordion").accordion({
            activate: function (event, ui) {
                $('.form-view').empty();
            }
        });

}