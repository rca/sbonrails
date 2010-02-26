$(document).ready(function() {

     /* ------------------------
          FOR LIKING A PRESENTATION IDEA
    ---------------------------*/
    $('.like').click( function(e) {
       var obj = $(this);
       var id  = obj.extract_id();
       data = "like[presentation_id]=" + id;
       $.post('/likes/create',data, function(data) {
            if (data === "success") {
                var span =  obj.next('span.num-likes')
                var insert = parseInt( span.html() ) + 1;
                obj.addClass('already-liked');
                obj.removeClass('like');
                span.html(insert);
            }
        });

        return false;
    });


    //$('.already-liked').click( function(e) { return false; } );



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

    $('.special-labels textarea').each( function()  {
        var obj = $(this);
        var label = obj.prev('label');

        if ( obj.val().length > 0) { label.hide(); }
    });

    $('.special-labels textarea').focus(function () {
        $(this).prev('label').addClass('faded');
    });

    $('.special-labels textarea').blur(function () {
        $(this).prev('label').removeClass('faded');
    });

    $('.special-labels textarea').keyup(function (e) {
        var obj = $(this);
        var label = obj.prev('label');

        if      ( obj.val().length == 0 && !label.is(":visible") ) { label.show(); }
        else if ( obj.val().length > 0  && label.is (":visible") ) { label.hide(); }
    });



});

