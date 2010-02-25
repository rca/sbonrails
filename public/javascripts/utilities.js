jQuery.fn.extract_id = function() {
    return $(this).attr('id').match(/[0-9].*/)[0];
}

