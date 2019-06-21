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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>${title}</title>
    <link rel="icon" type="image/png" href="statics/images/ape-icon.png"/>


 	<link rel="stylesheet" href="statics/editormd/css/editormd.css" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

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
            padding-left:5px;
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
        
        
        
        .o-tag{
        	color: blue;
		    height: 30px;
		    width: 30px;
		    padding-top: 2px;
		    border-width: 1px;
		    border-style: solid;
		    border-radius: 50%;
		    text-align: center;
		    margin-right: 5px;
        }
        .o-tag:hover{
        	cursor: pointer;
        	color: white;
        	background: blue;
        }
        #del-tag{
        	color:red;
        	display: none;
        }
        #del-tag:hover{
        	color: white;
        	background: red;
        }
        .tag{
        	padding:1px 4px;
        	width: 70px;
        	height: 30px;
        	border-radius: 20px;
        	border-color:#e6e6e6;
        	border-width:1px;border-style:solid;
        	outline-style: none;
        	font-size: 12px;
        	margin-right:5px;
        }
    </style>
</head>
<body>
	<form action="">

        <div>
            <div id="title" >
                <input type="text" placeholder="输入文章标题" maxlength="64" required="required">
                <label  style="border: none;outline: none"><span>0</span>/64</label>
            </div>

            <div id="sub">
                <input type="button" value="发布" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal">
                <img userId="${loginUser.id }" src="${loginUser.headImage }" alt="">
            </div>
        </div>

        <!-- Markdown 编辑器 -->
        <div id="editor">
            <!-- Tips: Editor.md can auto append a `<textarea>` tag -->
            <textarea style="display:none;" required="required">### 快用你的手指，写一篇华丽的文章吧 !</textarea>
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
                            <label for="category1" class="col-sm-2 col-form-label">博客分类</label>
                            <select id="category1" name="category1" class="col-sm-3 form-control" required="required">

                            </select>

                            <select id="category2" name="category2" class="col-sm-3 form-control" style="margin-left: 10px;display: none" required>
                                
                            </select>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">添加标签</label>

                            <input type="text" class="tag" name="tagString" maxlength="8" required="required">
                            <span id="add-tag" class="o-tag"><i class="fa fa-plus"></i></span>
                            <span id="del-tag" class="o-tag"><i class="fa fa-minus"></i></span>
                            <br>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-outline-info">保存草稿</button>
                        <button id="firmsubmit" type="button" class="btn btn-outline-primary">确认发布</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      	正在发布...
	    </div>
	  </div>
	</div>
	<div id="loading" style="position: absolute;top:40%;left: 48%;z-index: 9999"></div>
    

    <script src="statics/editormd/editormd.js"></script>
    <script type="text/javascript">
        $(function() {
            var editor = editormd("editor", {
                width: "100%",
                height: "620px",
                syncScrolling: "single",
                emoji:true,
                saveHTMLToTextarea : true,
                imageUpload       : true,				//图片上传
                imageFormats      : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL    : "img/blog",
            //    crossDomainUpload : true,				//跨域上传
            //    uploadCallbackURL : "http://xxxxxx/upload_callback.html?test=dfdf",	//跨域上传
                codeFold : true,		//启用代码折叠功能
                htmlDecode : true,		//解析所有的HTML标签和属性
                // markdown: "xxxx",     // dynamic set Markdown text
                path : "statics/editormd/lib/" // Autoload modules mode, codemirror, marked... dependents libs path

            });
        });
    </script>

    //页面加载动画插件
	 <script src="statics/js/jquery.shCircleLoader-min.js"></script>

   <!-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
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

        $(window).resize(function() {
            var w = document.getElementById("sub").offsetWidth;
            $("#title").css("width",$(window).width()-w-100);

            w = document.getElementById("title").offsetWidth;
            $("#title input").css("width",w-70);
        });


        //标题输入框 内容变化事件
        $('#title input').bind('input propertychange', function() {
            var title = $("#title input").val();
            // console.log(title);
            var len = title.length;
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
        });


        var category = [];
        $("#sub").click(function () {
            //获取博客分类
            $.get("category/blog",function(data,status){category = data;createOption($("#category1"),category);});

        });
        $("#category1").change(function() {
            $("#category2").show();
            createOption($("#category2"),category[$(this).val()].childCategories);
        });

        
        function createOption(object,category){
        	var html = "<option value='-1' selected>请选择</option>";
        	var len = category.length;
            for (let i = 0; i < len; i++) {
    			html += "<option value='"+i+"'>"+category[i].name+"</option>";
    		}
            object.html(html);
        }
        
        

        
        
        
        $("#firmsubmit").click(function() {
        	$('#loading').shCircleLoader({
    		    dots: 24,
    		    dotsRadius: 20
    		});
        	
        	var content =  $("textarea[name='editor-markdown-doc']").text();
    		var htmlString = $("textarea[name='editor-html-code']").text();
    		var summary = $(".editormd-preview-container").text();
    		var userId = $("#sub img").attr("userId");
    		var categoryId;
    		if($("#category1").val()=="-1"){
    			$('#loading').hide();
    			return;
    		}
    		if($("#category2").val()=="-1") categoryId = category[$("#category1").val()-'0'].id;
    		else categoryId = category[$("#category1").val()-'0'].childCategories[$("#category2").val()-'0'].id;
    		console.log("category2:"+$("#category2").val());
    		console.log("categoryId:"+categoryId);
    		var title = $("#title input").val();
    		var tagString = [];
    		var tags = $("input[name='tagString']");
    		for (let i = 0; i < tags.length; i++) {
				tagString.push(tags.eq(i).val());
				console.log(i+":"+tags.eq(i).val());
			}
    		
    		console.log("tagString:"+tagString);
    		$.ajax({
    			url:"admin/blog/add",
    			type:"post",
    			data:JSON.stringify({userId:userId,title:title,categoryId:categoryId,
    					summary:summary,content:content,htmlString:htmlString,tagString:tagString}),
    			contentType:"application/json",
    			async:false,
    			success:function(res){
    				$('#loading').hide();
    				console.log(res);
    				if(res!=null && res.length>20){
    					window.location.href = "admin/blog/addSuccess?id="+res;
    				}else{
	    				alert("发布失败");
    				}
    			},
    			error:function(){
    				$('#loading').hide();
    				alert("网络异常，请稍后再试");
    			}
    		});
    		
    		
		});
        
        
        
        

        var tagNum = 1;
        $("#add-tag").click(function() {
        	if($.trim($(this).prev().val())!="" && tagNum<5){
        		$(this).before("<input type='text' class='tag' name='tagString'>");
        		$(this).prev().hide();
        		$(this).prev().show("slow");
        		tagNum++;
        	}
			if(tagNum > 1){
				$("#del-tag").show("slow");
			}
		});
        $("#del-tag").click(function() {
			if(tagNum > 1){
				$("#add-tag").prev().hide("slow");
				setTimeout(function() {
					$("#add-tag").prev().remove();
				}, 600);
				tagNum--;
			}
			if(tagNum<=1){
				$(this).hide("slow");
			}
		});
       
    });
    
    

</script>