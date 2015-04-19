$(document).ready(function() {
    $('.nav_list').dropit();

    $('#sort').change(function() {
        window.location.replace(window.location.href + '&sort=' + $('#sort').val())
    });
});
