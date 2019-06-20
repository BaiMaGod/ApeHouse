var BGM = [
    ["许嵩,黄龄 - 惊鸿一面.flac","许嵩 - 幻听.flac","许嵩 - 庐州月.flac"],
    ["你的九儿 - 清明上河图 (cover：李玉刚).mp3","刘安琪 - 白山茶（Cover 陈雪凝）.flac"],
    ["薛之谦 - 方圆几里.flac","薛之谦 - 演员.flac"]
];
var cur,num=-1;

function initmusic(k,async){
    var data = "number="+k;
    $.ajax({
        url:"getMusic",
        data:data,
        async:async,
        dataType:"json",
        success:function (res) {
            if(k==3){
                BGM = res;
            }else{
                BGM[k] = res;
            }
            return true;
        },
        error:function () {
            return false;
        }
    });
}
initmusic(3,true);

//顶部
$(function () {
    $("#navbarSupportedContent ul li i").mouseenter(function () {
        $(this).next().show("slow");
    });
    $("#navbarSupportedContent ul li i").mouseleave(function () {
        $(this).next().hide("slow");
    });

    $(".btn-search").click(function () {
        $(".input-search").toggle("slow");
        // $(this).animate({transform:'rotate('+180+'deg)'},2000);
    });
    $(".btn-search").rotate({
        bind: {
            click: function(){
                $(this).rotate({
                    angle: 0,
                    animateTo: 360,
                    easing: $.easing.easeInOutExpo
                });
            }
        }
    });

    var top_card = $(".top-card > div");
    var dh1 = top_card.find(" h1");
    var dh5 = top_card.find(" h5")
    var dh4 = top_card.find(" h4")
    $(".top-card > div").mouseenter(function () {
        dh1.animate({color:'#F0E400'},1000);
        dh1.animate({color:'#54F000'},1000);
        dh1.animate({color:'#00F070'},1000);
        dh1.animate({color:'#F00054'},1000);
        dh1.animate({color:'#00D8F0'},1000);
        dh1.animate({color:'#54F000'},1000);
        dh1.animate({color:'#00FF73'},1000);
        dh1.animate({color:'#2400F0'},1000);
        dh1.animate({color:'#FF0000'},1000);

        dh5.animate({color:'#F00054'},1000);
        dh5.animate({color:'#2400F0'},1000);
        dh5.animate({color:'#F0E400'},1000);
        dh5.animate({color:'#00D8F0'},1000);
        dh5.animate({color:'#54F000'},1000);
        dh5.animate({color:'#2400F0'},1000);
        dh5.animate({color:'#00F070'},1000);
        dh5.animate({color:'#FF0000'},1000);

        dh4.animate({color:'#F07400'},1000);
        dh4.animate({color:'#2400F0'},1000);
        dh4.animate({color:'#1CF000'},1000);
        dh4.animate({color:'#787878'},1000);
        dh4.animate({color:'#3B37B9'},1000);
        dh4.animate({color:'#F0E400'},1000);
        dh4.animate({color:'#54F000'},1000);
        dh4.animate({color:'#FF0000'},1000);
    });
});

//音乐部分
$(function () {
    var musicImg = $('.music-img');
    musicImg.stop().rotate({animateTo:360000,duration: 20000000});

    musicImg.mouseenter(function(){
        // $(this).stopRotate();
        $(this).prev().fadeIn("slow");
    });
    musicImg.mouseleave(function(){
        // $(this).stop().rotate({animateTo:360000,duration: 20000000});
    });

    $(".zhezhao").mouseleave(function () {
        $(this).fadeOut("slow");
    });


    //定义setTimeout执行方法
    var time = null;

    var me;
    var zhezhaoi = $(".music-card .music .zhezhao i");
    var bgm = document.getElementById("bgm");
    // var bgm = window.parent.frames[0].document.getElementById("bgm");
    zhezhaoi.click(function () {
        // 取消上次延时未执行的方法
        clearTimeout(time);

        me = $(this);
        //执行延时
        time = setTimeout(function(){
            me.animate(
                {
                    fontSize:'+='+50,
                    left:'-='+20,
                    top:'-='+25,
                    opacity:'-='+0.7
                },600,function(){
                    // $(this).hide();
                });
            setTimeout(function () {
                if(me.hasClass("fa-play-circle-o")) {
                    playbgm(me);
                    me.removeClass("fa-play-circle-o");
                    me.addClass("fa-pause-circle-o");

                    // me.show();
                    me.animate(
                        {
                            fontSize:'-='+50,
                            left:'+='+20,
                            top:'+='+25,
                            opacity:'+='+0.5
                        },600);
                }else{
                    bgm.pause();
                    me.removeClass("fa-pause-circle-o");
                    me.addClass("fa-play-circle-o");

                    me.animate(
                        {
                            fontSize:'-='+50,
                            left:'+='+20,
                            top:'+='+25,
                            opacity:'+='+0.5
                        },600);
                }
            },600);
        },300);
    });


    //在播放状态下，双击暂停键播放下一首
    zhezhaoi.dblclick(function () {
        // 取消上次延时未执行的方法
        clearTimeout(time);

        if( $(this).hasClass("fa-play-circle-o") ) return;
        nextMusic();
    });

    function playbgm(music){
        // console.log(music);
        initplay();
        if(music.hasClass("play1")){
            if(num == 0){
                bgm.play();
                return;
            }
            num=0;
        }else if(music.hasClass("play2")){
            if(num == 1){
                bgm.play();
                return;
            }
            num = 1;
        }else if(music.hasClass("play3")){
            if(num == 2){
                bgm.play();
                return;
            }
            num = 2;
        }
        cur = getmusic(num);
        //console.log(cur);
        bgm.pause();
        bgm.src = cur;
        bgm.play();
    };
    function initplay(){
        if(zhezhaoi.hasClass("fa-pause-circle-o")){
            zhezhaoi.removeClass("fa-pause-circle-o");
            zhezhaoi.addClass("fa-play-circle-o");
        }
    }

    //歌曲播放完毕
    bgm.addEventListener("ended",function () {
        nextMusic();
    });
    //歌曲播放发生错误
    bgm.onerror = function() {
        console.log("歌曲播放异常");
        nextMusic();
    };

    //播放下一首
    function nextMusic() {
        if(num<0 || num>2) return;

        cur = getmusic(num);
        bgm.src = cur;
        bgm.play();
    }


    function getmusic(k){
        console.log("k:"+k);
        if(k<0 || k>2) return;
        if(BGM[k].length==0){
            if(initmusic(k,false)){
                return BGM[k].pop();
            }else{
                while(initmusic(k,false)){
                    setTimeout("",1000);
                }
                return BGM[k].pop();
            }
        }else{
            return BGM[k].pop();
        }
    }

    zhezhaoi.mouseenter(function () {
        $(this).css("opacity",0.7);
    });
    zhezhaoi.mouseleave(function () {
        $(this).css("opacity",0.5);
    });
});



//返回顶部
$(function () {
    var backbtn =  $(".elevator-button");
    window.onscroll = function() {
        // console.info(window.scrollY);

        if(window.scrollY > 500){
            backbtn.show(800);
        }else{
            backbtn.hide(800);
        }
    };

    window.onload = function() {
        var elevator = new Elevator({
            element: document.querySelector('.elevator-button'),//选择元素
            mainAudio: 'ape/music/elevator-music.mp3',
            endAudio: 'ape/music/ding.mp3',
            duration: 2000 // 单位：毫秒
        });
    }
});

//让iframe自适应高度
function setIframeHeight(iframe) {
    if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
    }
};

window.onload = function () {
    // setIframeHeight(document.getElementById('external-frame'));
};

//body部分处理
$(function () {
    var body = $("#body");
    body.load("body");
    var basepath = $("#path").val()+"/";

    //博客列表标题特效
    var w;
    body.delegate(".text-center .card-title h5","mouseenter",function () {
        if($(this).next().is(":visible")) return;
        w = $(this).innerWidth();
        // alert($(this).parent().parent().css("padding-bottom"));

        $(this).next().css("width",1);
        $(this).next().show(400);
        $(this).next().animate({width:'+='+w},400);
        $(this).parent().parent().animate({paddingBottom:'20px'},400);
        $(this).css("color",'#000');
    });
    body.delegate(".text-center .card-title h5","mouseleave",function () {
        $(this).css("color",'gray');
        $(this).next().hide(400);
        $(this).next().animate({width:'0'},400);
        $(this).parent().parent().animate({paddingBottom:'10px'},400);
    });

    var blog_img;
    //阅读全部
    body.delegate(".text-center .read-detail","click",function () {
        console.log("read-detail");
        var url = "blog/"+$(this).attr("blog-id");

        body.load(url,function () {

            //加载成功，改变地址栏
            window.history.pushState(null,null,basepath+url);
            //修改网页标题
            $("title").text($(".detail-blog .blog-title").text()+" - 猿馆");

            blog_img = $(".detail-blog img");



            var len = blog_img.length;

            for (let i = 0;i<len;i++){
                console.log("widtg:"+blog_img[i].width);
                if(blog_img[i].width > $("#body").width()){
                    blog_img[i].width = "100%";
                }
            }


            // console.log("title:" + $(".detail-blog .blog-title").text());
            // console.log("href:" + window.location.href);
        });



        $("html, body").animate({scrollTop:$('#mao').offset().top}, 800);


        console.log("1:"+blog_img[0].width());
        console.log("2"+blog_img.parent().width());
        // blog_img.each(function () {
        //
        //     if($(this).width()>$(this).parent().width()){
        //         $(this).css("width","100%");
        //     };
        // });

    });


    window.addEventListener("popstate", function() {
        // alert("监听到返回按钮事件啦");
        //根据自己的需求实现自己的功能
        var url = window.location.href;
        url = url.replace(url.substring(0,url.indexOf(basepath)),"");

        console.log("tui："+url);

        // if(url=="" || url=="main2"){
        //     body.load("body");
        // }else{
            body.load(url);
        // }
    });

})



