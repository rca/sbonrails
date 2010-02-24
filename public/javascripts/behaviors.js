$(document).ready(function() {

    /* ------------------------
    FADING FORM LABELS
       -----------------------*/
    $('.special-labels input').each( function()  {
        var obj = $(this);
        var label = obj.prev('label');

        if ( obj.val().length > 0) { label.hide(); }
    });

    $('.special-labels input').focus(function () {
        $(this).prev('label').addClass('faded');
    });

    $('.special-labels input').blur(function () {
        $(this).prev('label').removeClass('faded');
    });

    $('.special-labels input').keyup(function (e) {
        var obj = $(this);
        var label = obj.prev('label');

        if      ( obj.val().length == 0 && !label.is(":visible") ) { label.show(); }
        else if ( obj.val().length > 0  && label.is (":visible") ) { label.hide(); }
    });


});

