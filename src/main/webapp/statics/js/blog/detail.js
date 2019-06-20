



$(".detail-blog img").on("load",function() {
    // console.log($(this).width());
    // console.log($(this).parent().width());
    if($(this).width()>$(this).parent().width()){
        $(this).css("width","100%");
    };
});

//博客详情
$(function() {


/*    var blog = {msg:"获取博客失败！"};
    $("#pills-blog .read-detail").click(function() {
        getBlogDetail($(this).attr("blog-id"));
        blogDetail(blog);


        $("#detail").delegate(".detail-blog img","load",function () {
            console.log("width2:"+$(this).width());
            if($(this).width()>$(this).parent().width()){
                $(this).css("width","100%")
            }
        })
        $("#detail .blog-content").load($(this).attr("blog-url"),function () {
            $("#detail .detail-blog img").get(0).onload = function (){ //$("galleryImg")是选择器
                //var picH=document.getElementById("galleryImg").height;原生写法
                //var picW=document.getElementById("galleryImg").width;原生写法
                console.log("width1:"+$(this).width());
                if($(this).width()>$(this).parent().width()){
                    $(this).css("width","100%")
                }
            };

        });


        $("#pills-detail-tab").click();
        $("html, body").animate({scrollTop:$('#mao').offset().top}, 800);


    });

    function getBlogDetail(id) {
        $.ajax({
            url:"blog/detail?id="+id,
            async:false,
            success:function(res){
                console.log("获取博客成功："+id);
                blog = res;
            },
            error:function(){
                console.log("获取博客失败："+id);
            }
        });
    };
    function blogDetail(blog) {
        var html = "";
        if(!('msg' in blog)){
            html = "<div class='detail-blog'>"+
                "<h2 class='blog-title'>"+blog.title+"</h2>"+
                "<p class='blog-info'>"+
                "<i class='fa fa-clock-o'></i>发表于：<fmt:formatDate type='both' value='"+blog.createTime+"'/> | "+
                "<i class=fa fa-folder-o></i>分类于：<a href='javascript:;' category-id='"+blog.category.id+"'> "+ blog.category.name +" </a> | "+
                "<i class=fa fa-comment-o'></i>评论：<span>0</span> | "+
                "<i class=fa fa-eye'></i>浏览：<span>66</span>"+
                "</p>"+
                "<br>"+
                "<div class='blog-content'></div>"+
                "</div>";
        }else{
            html = "<div class='detail-blog'>"+
                "<h6 class='blog-title'>获取博客失败！</h6>"+
                "</div>";
        }
        $("#detail").html(html);
    }*/
});
console.log("-------");
window.onload=function(){
    console.log("onload");
    $("html, body").animate({scrollTop:$('#mao').offset().top}, 800);
};