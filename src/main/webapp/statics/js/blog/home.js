
    var BGM = [
        ["statics/music/vae/许嵩,黄龄 - 惊鸿一面.flac","statics/music/vae/许嵩 - 幻听.flac","statics/music/vae/许嵩 - 庐州月.flac"],
        ["statics/music/gu/你的九儿 - 清明上河图 (cover：李玉刚).mp3","statics/music/gu/刘安琪 - 白山茶（Cover 陈雪凝）.flac"],
        ["statics/music/xue/薛之谦 - 方圆几里.flac","statics/music/xue/薛之谦 - 演员.flac"]
    ];
    var cur,num=0;

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
        musicImg.stop().rotate({animateTo:36000,duration: 2000000});

        musicImg.mouseenter(function(){
            $(this).stopRotate();
            $(this).prev().fadeIn("slow");
        });
        musicImg.mouseleave(function(){
            $(this).stop().rotate({animateTo:36000,duration: 2000000});
        });

        $(".zhezhao").mouseleave(function () {
            $(this).fadeOut("slow");
        });

        var me;
        var zhezhaoi = $(".music-card .music .zhezhao i");
        var bgm = document.getElementById("bgm");
        zhezhaoi.click(function () {
            me = $(this);
            $(this).animate(
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
        });


        // zhezhaoi.dblclick(function () {
        //     if(num==0 || $(this).hasClass("fa-pause-circle-o")) return;
        //     playbgm($(this));
        // });

        function playbgm(music){
            // console.log(music);
            initplay();
            if(music.hasClass("play1")){
                if(num == 1){
                    bgm.play();
                    return;
                }
                num=0;
            }else if(music.hasClass("play2")){
                if(num == 2){
                    bgm.play();
                    return;
                }
                num = 1;
            }else if(music.hasClass("play3")){
                if(num == 3){
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

        //自动播放下一首
        bgm.addEventListener("ended",function () {
            cur = getmusic(num);
            bgm.src = cur;
            bgm.play();
        });

        function getmusic(k){
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


        var backbtn =  $(".elevator-button");
        window.onscroll = function() {
            // console.info(window.scrollY);

            if(window.scrollY > 500){
                backbtn.show(800);
            }else{
                backbtn.hide(800);
            }
        };

    });



    window.onload = function() {
        var elevator = new Elevator({
            element: document.querySelector('.elevator-button'),//选择元素
            mainAudio: 'statics/music/elevator-music.mp3',
            endAudio: 'statics/music/ding.mp3',
            duration: 2000 // 单位：毫秒
        });
    }

