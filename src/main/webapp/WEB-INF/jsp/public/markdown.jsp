<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>投稿——白马46的个人博客</title>


 	<link rel="stylesheet" href="../../../statics/editormd/css/editormd.css" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <script src="../../../statics/js/jquery-3.3.1.js"></script>

    <style>
        #title{
            float: left;
            width: 80%;
            margin-top: 5px;
            margin-bottom: 5px;
            margin-left: 20px;
            border-width:1px;
            border-style: solid;
            border-color: #ddd;
            border-radius: 10px;
        }
        #title input{
            height: 40px;
            width: 100%;
            font-size: 18px;
            border-radius: 15px;
            border: none;
            outline: none;
        }
        #title label{
            width: 50px;
            font-size: 18px;
        }
        #sub {
            float:right;
            margin-top: 3px;
            margin-right: 50px;
            margin-left: 10px;
        }
        #sub input{
            width: 100px;
            border-radius: 5px;
            margin-right: 30px;
            outline: none;
        }
        #sub img{
            height: 45px;
            width: 45px;
            border-radius: 23px;
        }

        .modal-content{
            width: 600px;
        }
    </style>
</head>
<body>
	<form action="">

        <div>
            <div id="title" >
                <input type="text" placeholder="输入文章标题" maxlength="64">
                <label  style="border: none;outline: none"><span>0</span>/64</label>
            </div>

            <div id="sub">
                <input type="button" value="发布" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal">
                <img src="https://cuiqingcai.com/wp-content/themes/Yusi/timthumb.php?src=https://qiniu.cuiqingcai.com/wp-content/uploads/2019/05/u20170851661555839722fm11gp0.jpg&amp;h=123&amp;w=200&amp;q=90&amp;zc=1&amp;ct=1"
                    alt="为什么你们就是不能加个空格呢？">
            </div>
        </div>

        <!-- Markdown 编辑器 -->
        <div id="editor">
            <!-- Tips: Editor.md can auto append a `<textarea>` tag -->
            <textarea style="display:none;">### 快用你的手指，写一篇华丽的文章吧 !</textarea>
        </div>
        <!-- Markdown 编辑器 -->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">发布文章</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="articleType" class="col-sm-2 col-form-label">文章类型</label>
                            <select id="articleType" name="articleType" class="col-sm-3 form-control">
                                <option selected>请选择</option>
                                <option value="1">原创</option>
                                <option value="2">转载</option>
                                <option value="3">翻译</option>
                            </select>

                            <label for="blogType" class="col-sm-2 col-form-label">博客分类</label>
                            <select id="blogType" name="blogType" class="col-sm-3 form-control">
                                <option selected>请选择</option>
                                <option value="1">原创</option>
                                <option value="2">转载</option>
                                <option value="3">翻译</option>
                            </select>
                        </div>
                        <div class="form-group row">
                            <label for="tags" class="col-sm-2 col-form-label">添加标签</label>

                            <input type="password" class="form-control col-sm-2" id="tags" name="tags">
                            <br>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-outline-info">保存草稿</button>
                        <button type="button" class="btn btn-outline-primary">确认发布</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="../../../statics/editormd/editormd.js"></script>
    <script type="text/javascript">
        $(function() {
            var editor = editormd("editor", {
                width: "100%",
                height: "620px",
                syncScrolling: "single",
                emoji:true,
                saveHTMLToTextarea : true,
                // markdown: "xxxx",     // dynamic set Markdown text
                path : "../../../statics/editormd/lib/" // Autoload modules mode, codemirror, marked... dependents libs path

            });
        });
    </script>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>
<script>
    $(function () {
            var w = document.getElementById("sub").offsetWidth;
            $("#title").css("width",$(window).width()-w-100);

            w = document.getElementById("title").offsetWidth;
            $("#title input").css("width",w-70);
        },

        $(window).resize(function() {
            var w = document.getElementById("sub").offsetWidth;
            $("#title").css("width",$(window).width()-w-100);

            w = document.getElementById("title").offsetWidth;
            $("#title input").css("width",w-70);
        }),


        $('#title input').bind('input propertychange', function() {
            var title = $("#title input").val();
            var len = title.length;
            // alert(len);
            if(len > 64) {

                return;
            }
            var sp = $("#title label span");
            if(len == 64){
                sp.css("color","red");
            }else{
                sp.css("color","#000");
            }

            sp.text(len);
        })
    );

</script>