

//博客列表
$(function () {
    var w;
    $(".text-center .card-title h5").mouseenter(function () {
        if($(this).next().is(":visible")) return;
        w = $(this).innerWidth();
        // alert($(this).parent().parent().css("padding-bottom"));

        $(this).next().css("width",1);
        $(this).next().show(400);
        $(this).next().animate({width:'+='+w},400);
        $(this).parent().parent().animate({paddingBottom:'20px'},400);
        $(this).css("color",'#000');
    });
    $(".text-center .card-title h5").mouseleave(function () {
        $(this).css("color",'gray');
        $(this).next().hide(400);
        $(this).next().animate({width:'0'},400);
        $(this).parent().parent().animate({paddingBottom:'10px'},400);
    });

});
