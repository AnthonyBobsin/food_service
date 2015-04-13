$(document).ready(function() {
    $('.rightnav').hover(function() {
        $(this).siblings('.botBord').addClass('botBordAnimation');
    }, function() {
        $(this).siblings('.botBord').removeClass('botBordAnimation');
    });
    $('.rightnav').focus(function() {
        $(this).siblings('.botBord').addClass('botBordAnimation');
    }, function() {
        $(this).siblings('.botBord').removeClass('botBordAnimation');
    });
});
