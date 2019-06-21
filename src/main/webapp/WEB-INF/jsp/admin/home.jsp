<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>${title}</title>
    <link rel="icon" type="image/png" href="statics/images/ape-icon.png"/>


    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">


    <style>
        /*
       底部及其他部分样式
    */



        .foot .card .text-content{
            font-size: 12px;
        }


        .elevator-button{
            position: fixed;
            right: 2%;
            bottom: 60px;
            display: none;
        }
        .elevator-button2{
            position: fixed;
            right: 2%;
            bottom: 60px;
            display: none;
        }


        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }
        ::-webkit-scrollbar-button,
        ::-webkit-scrollbar-button:vertical {
            display: none;
        }

        ::-webkit-scrollbar-track,
        ::-webkit-scrollbar-track:vertical {
            background-color: whitesmoke;
        }

        ::-webkit-scrollbar-track-piece {
            background-color: whitesmoke;
        }

        ::-webkit-scrollbar-thumb,
        ::-webkit-scrollbar-thumb:vertical {
            border-radius: 5px;
            margin-right: 10px;
            background-color: #bba;
        }

        ::-webkit-scrollbar-thumb:hover,
        ::-webkit-scrollbar-thumb:vertical:hover {
            background-color: #aaa;
        }

        ::-webkit-scrollbar-corner,
        ::-webkit-scrollbar-corner:vertical {
            background-color: whitesmoke;
        }

        /*
            底部及其他部分样式 —— 结束
         */
    </style>
</head>
<body>
    <div class="user-info">
        <img userId="${loginUser.id }" src="${loginUser.headImage }" alt="">
    </div>

    <div>
        <a href="admin/blog/add">发布博客</a>
    </div>
    <div>
        <button class="btn btn-primary">上传图册</button>
    </div>
    <div>
        <a href="admin">上传资源</a>
    </div>
    <div>
        <button class="btn btn-primary" data-toggle="modal" data-target="#add-log">发表日志</button>
    </div>
    <div>
        <a href="admin/music/add" class="btn btn-primary">获取音乐</a>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="add-log" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">发条日志</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="add-log-form">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">标题：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add-log-title" placeholder="输入标题">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">天气：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add-log-weather" placeholder="今天天气如何？">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">内容：</label>
                            <div class="col-sm-10">
                                <textarea type="text" class="form-control" id="add-log-content" wrap="hard" rows="10" placeholder="记录今天发生的事件..."></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">取消</button>
                    <button id="log-submit" class="btn btn-primary">发布</button>
                </div>
            </div>
        </div>
    </div>

    <div class="alert alert-primary" id="add-log-alert" style="display: none;max-width:200px;text-align: center;z-index: 9000;margin: auto;">

    </div>

    <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>

    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
<script>
    $(function () {
        var log_alert = $("#add-log-alert");
        var userId_obj = $(".user-info img");
        var title_obj = $("#add-log-title");
        var weather_obj = $("#add-log-weather")
        var content_obj = $("#add-log-content");

        $("#log-submit").click(function () {
            var userId = userId_obj.attr("userId");
            var title = title_obj.val();
            var weather = weather_obj.val();
            var content = content_obj.val();

            $.ajax({
                url:"admin/log/add",
                type:"post",
                data:JSON.stringify({userId:userId,title:title,weather:weather,content:content}),
                contentType:"application/json",
                async:false,
                success:function (res) {
                    if(res!=null){
                        log_alert.text("发布成功!");
                        log_alert.fadeIn("slow");
                        $("#add-log").modal("hide");
                        clearLog();
                        setTimeout(function () {
                            log_alert.fadeOut("slow");
                        },3000);

                    } else{
                        log_alert.text("发布失败!");
                        log_alert.fadeIn("slow");
                        setTimeout(function () {
                            log_alert.fadeOut("slow");
                        },3000);
                    }
                },
                error:function () {
                    log_alert.text("请求错误!");
                    log_alert.fadeIn("slow");
                    setTimeout(function () {
                        log_alert.fadeOut("slow");
                    },3000);
                }
            });

        });

        function clearLog() {
            title_obj.val("");
            weather_obj.val("");
            content_obj.val("");
        }


    })


</script>