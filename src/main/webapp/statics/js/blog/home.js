
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


    //顶部--------------------------------------------
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




        $("#pills-tab .nav-item").click(function () {
            $("html, body").animate({scrollTop:$('#mao').offset().top}, 800);
        });
    });




    //音乐部分-------------------------------
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
            //如果不是在首页
            if(!document.getElementById("pills-tabContent")){
                if(num<0){
                    $("#gohome").modal("show");
                }
            }

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


    //-------------------------------------
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
        var message_add_btn = $("#btn-message-add");
        var pills_massage = $("#pills-massage");
        var message_board = $(".message-board");
        window.onscroll = function() {
            // console.info(pills_massage);

            if((document.getElementById("pills-massage")==null || pills_massage.hasClass("active")) && window.scrollY > message_board.offset().top-window.innerHeight+120){
                message_add_btn.show(800);
            }else{
                message_add_btn.hide(800);
            }


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


            if(!document.getElementById("pills-tabContent")){
                $("html, body").animate({scrollTop:$('#mao').offset().top}, 800);
            }
        }



        $("#gohome #cancel").click(function () {
            $("#gohome").modal("hide");
        });




    });

    function tipsbox(msg,bgcolor,time) {
        $("body").append("<div id='tips' class='tipsbox'>" + msg + "</div>");
        var tips = $("#tips");
        tips.css("margin-left","-"+tips.width()/2+"px");
        if(bgcolor!=null){
            tips.css("background-color",bgcolor);
        }
        if(time == null){
            time = 3000;
        }
        tips.fadeIn("slow");
        setTimeout(function () {
            tips.fadeOut("slow");
            setTimeout(function () {
                tips.remove();
            },1000);
        },time)

    }


    //时间线------------------------------
    $(function () {

        $('.VivaTimeline').vivaTimeline({
            carousel: true,
            carouselTime: 3000
        });

        var pre;
        $(".VivaTimeline .clearfix").each(function () {
            var curTime = $(this).prev().text();
            if(pre!=null){
                //日期与前一个不一样
                if(curTime!=pre.prev().text()){
                    // console.log(curTime+"!="+pre.prev().text());
                    //前一个在左边
                    if(pre.hasClass("pos-left")){
                        //当前不在右边，变换成右边
                        if(!$(this).hasClass("pos-right")){
                            $(this).removeClass("pos-left");
                            $(this).addClass("pos-right");
                        }
                    }else if(pre.hasClass("pos-right")){
                        if(!$(this).hasClass("pos-left")){
                            $(this).removeClass("pos-right");
                            $(this).addClass("pos-left");
                        }
                    }
                }else{
                    //前一个在左边
                    if(pre.hasClass("pos-left")){
                        //当前不在左边，变换成左边
                        if(!$(this).hasClass("pos-left")) {
                            $(this).removeClass("pos-right");
                            $(this).addClass("pos-left");
                        }
                    }else if(pre.hasClass("pos-right")){
                        //当前不在右边，变换成右边
                        if(!$(this).hasClass("pos-right")) {
                            $(this).removeClass("pos-left");
                            $(this).addClass("pos-right");
                        }
                    }
                }
            }
            pre = $(this);
        });
    });


    //=留言------------------------------
    $(function () {
        var message_add_editor = $("#message-add-editor");
        var flag = false;

        message_add_editor.keyup(function () {
            var scrollHeight=$(this)[0].scrollHeight; //div文档总高度
            // var offsetHeight=message_add_editor[0].offsetHeight; //获取div窗口显示高度
            // var allheight=scrollHeight-offsetHeight;           //div内容的实际高度

            var text;
            if(scrollHeight>200){
                while(scrollHeight>200){
                    console.log("scrollHeight:"+scrollHeight);

                    text = $(this).html();
                    if(text.lastIndexOf("&nbsp;")==text.length-6){
                        text = text.substring(0,text.length-6);
                    }else if(text.lastIndexOf("<div><br></div>")==text.length-15){
                        text = text.substring(0,text.length-15);
                    } else{
                        text = text.substring(0,text.length-1);
                    }

                    flag = true;
                    $(this).html(text);
                    scrollHeight=$(this)[0].scrollHeight;
                }
                tipsbox("内容不能太多哦~~~",null,null);
                setFocus($(this));
            }
        });
        message_add_editor.bind("DOMNodeInserted",function(){
            if(flag){
                flag = false;
                return;
            }
            var scrollHeight=$(this)[0].scrollHeight; //div文档总高度
            console.log("内容变化："+$(this).html());
            console.log("内容变化后scrollHeight："+scrollHeight);

            if(scrollHeight>200){
                var text = $(this).html();
                var index1 = text.lastIndexOf("<img");
                var index2 = text.lastIndexOf(">");
                if(index1>0 && index2>index1){
                    console.log("删除："+text.substring(index1,index2-index1));
                    text = text.replace(text.substring(index1,index2-index1),"");
                    flag = true;
                    $(this).html(text);
                }
                tipsbox("内容不能太多哦~~~",null,null);
                setFocus($(this));
            }
        });



        message_add_editor.emoji({
            button: "#message-add-emoji",
            showTab: true,
            animation: 'slide',
            icons: [{
                name: "QQ表情",
                path: "statics/jQuery-emoji/img/qq/",
                maxNum: 91,
                excludeNums: [41, 45, 54],
                file: ".gif",
                placeholder: "#qq_{alias}#"
            },{
                name: "百度贴吧",
                path: "statics/jQuery-emoji/img/tieba/",
                maxNum: 50,
                file: ".jpg",
                placeholder: ":{alias}:",
                alias: {
                    1: "hehe",
                    2: "haha",
                    3: "tushe",
                    4: "a",
                    5: "ku",
                    6: "lu",
                    7: "kaixin",
                    8: "han",
                    9: "lei",
                    10: "heixian",
                    11: "bishi",
                    12: "bugaoxing",
                    13: "zhenbang",
                    14: "qian",
                    15: "yiwen",
                    16: "yinxian",
                    17: "tu",
                    18: "yi",
                    19: "weiqu",
                    20: "huaxin",
                    21: "hu",
                    22: "xiaonian",
                    23: "neng",
                    24: "taikaixin",
                    25: "huaji",
                    26: "mianqiang",
                    27: "kuanghan",
                    28: "guai",
                    29: "shuijiao",
                    30: "jinku",
                    31: "shengqi",
                    32: "jinya",
                    33: "pen",
                    34: "aixin",
                    35: "xinsui",
                    36: "meigui",
                    37: "liwu",
                    38: "caihong",
                    39: "xxyl",
                    40: "taiyang",
                    41: "qianbi",
                    42: "dnegpao",
                    43: "chabei",
                    44: "dangao",
                    45: "yinyue",
                    46: "haha2",
                    47: "shenli",
                    48: "damuzhi",
                    49: "ruo",
                    50: "OK"
                },
                title: {
                    1: "呵呵",
                    2: "哈哈",
                    3: "吐舌",
                    4: "啊",
                    5: "酷",
                    6: "怒",
                    7: "开心",
                    8: "汗",
                    9: "泪",
                    10: "黑线",
                    11: "鄙视",
                    12: "不高兴",
                    13: "真棒",
                    14: "钱",
                    15: "疑问",
                    16: "阴脸",
                    17: "吐",
                    18: "咦",
                    19: "委屈",
                    20: "花心",
                    21: "呼~",
                    22: "笑脸",
                    23: "冷",
                    24: "太开心",
                    25: "滑稽",
                    26: "勉强",
                    27: "狂汗",
                    28: "乖",
                    29: "睡觉",
                    30: "惊哭",
                    31: "生气",
                    32: "惊讶",
                    33: "喷",
                    34: "爱心",
                    35: "心碎",
                    36: "玫瑰",
                    37: "礼物",
                    38: "彩虹",
                    39: "星星月亮",
                    40: "太阳",
                    41: "钱币",
                    42: "灯泡",
                    43: "茶杯",
                    44: "蛋糕",
                    45: "音乐",
                    46: "haha",
                    47: "胜利",
                    48: "大拇指",
                    49: "弱",
                    50: "OK"
                }
            },{
                name: "emoji",
                path: "statics/jQuery-emoji/img/emoji/",
                maxNum: 84,
                file: ".png",
            }]
        });
        $("#message-add-emoji").click(function () {
            var el = $("#message-add-editor");
            setFocus(el);
            // el.emoji('toggle');

        });
        //切换背景
        $("#change-bg").click(function () {
            var bg = parseInt($(this).attr("bg"))%3;
            $(".message-add").css("background","transparent url(\"statics/images/message/bg"+(bg+1)%3+".png\")")
            $(this).attr("bg",(bg+1)%3);
        });


        //下面的解决代码,光标位置
        function setFocus(el) {
            el = el[0]; // jquery 对象转dom对象
            el.focus();
            var range = document.createRange();
            range.selectNodeContents(el);
            range.collapse(false);
            var sel = window.getSelection();
            //判断光标位置，如不需要可删除
            if (sel.anchorOffset != 0) {
                return;
            };
            sel.removeAllRanges();
            sel.addRange(range);
        };

        $("#message-send").click(function () {
            var nickname_obj = $("#nickname");
            var nickname = nickname_obj.val();
            if(nickname.trim()==""){
                nickname = "神秘人";
            }
            var content_obj = $("#message-add-editor");
            var content = content_obj.html();
            var background = "bg"+$("#change-bg").attr("bg");

            if(content.trim() == ""){
                tipsbox("留言内容不能为空",null,3000);
                return;
            }

            console.log("content:"+content);

            content = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + content;

            $.ajax({
                url:"message/add",
                type:"POST",
                data:JSON.stringify({nickname:nickname,content:content,background:background}),
                contentType:"application/json",
                async:"false",
                success:function (res) {
                    console.log("res:"+res);
                    if(res!=null){
                        tipsbox("留言成功！","blue",3000);

                        $("#message-add").modal("hide");
                        nickname_obj.val("");
                        content_obj.html("");

                        addMessage(nickname,content,background);
                    }else{
                        tipsbox("留言失败，看看输入是否合理哦~~~·",null,20000);
                    }

                },
                error:function () {
                    tipsbox("请求错误，留言失败，请稍后再试！",null,20000);
                }
            });

        });

        function addMessage(nickname,content,background) {
            var html = "<div class=\"message fadeIn first\" style='display: none;'>\n" +
                "                        <img src=\"statics/images/message/"+background+".png\">\n" +
                "                        <p class=\"header\">"+nickname+"：</p>\n" +
                "                        <div class=\"message-content\" >"+content+"</div>\n" +
                "                        <p class=\"footer\">"+new Date().toLocaleString()+"</p>\n" +
                "                    </div>";
            var board = $(".message-board");
            board.prepend(html);
            board.find(".first").show("slow");
            board.find(".first").removeClass("first");
        };
    });