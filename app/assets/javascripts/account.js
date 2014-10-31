

$(function() {
    $('.datepicker').datepicker(
        { dateFormat: "yy-mm-dd",
            showOn: "button",
            buttonImage: "assets/calendar.gif",
            buttonImageOnly: true,
            buttonText: "Select date"}

    );

    console.log('test');

    $('#invoice_amount').change(function() {

        console.log('change');

        $('#sub-total').html('$' + $(this).val());
    });


});