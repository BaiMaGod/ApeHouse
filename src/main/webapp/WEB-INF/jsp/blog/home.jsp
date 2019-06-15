<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>${title}</title>
    <link rel="icon" type="image/png" href="statics/images/ape-icon.png"/>

	<link rel="stylesheet" href="statics/editormd/css/editormd.css" />
    <!-- <link rel="stylesheet" href="statics/bootstrap-4.0.0/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="statics/css/font-awesome-4.7.0/css/font-awesome.css"> -->
    <link rel="stylesheet" href="statics/icon/iconfont.css">


	<link rel="stylesheet" href="statics/css/blog/home.css">
</head>
<body>
    <div class="head">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <span class="col-1"></span>
            <a class="navbar-brand" href="#"> <img src="statics/images/ape--icon.png" alt="猿馆"  oncontextmenu="return false" ondragstart="return false"> </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">
                            <i class="fa fa-qq fa-lg"></i>
                            <img class="myQQ" src="statics/images/myQQ.jpg" alt="QQ">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa fa-weixin fa-lg"></i>
                            <img class="myweixin" src="statics/images/myweixin.png" alt="weixin">
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#">
                            <i class="fa fa-envelope fa-lg"></i>
                            <img class="myweixin" src="statics/images/myemail.png" alt="email">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="https://blog.csdn.net/weixin_42486795" target="_blank"> <i class="iconfont icon-csdn"></i> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="https://github.com/BaiMaGod" target="_blank"> <i class="fa fa-github fa-lg"></i> </a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="input-search form-control mr-sm-2" type="text" placeholder="全站搜索..." aria-label="Search" style="display: none;font-size: 14px">
                    <button class="btn btn-search btn-secondary" type="button"> <i class="fa fa-search"></i> </button>
                </form>
            </div>
        </nav>


        <div class="card">
            <div class="card-body text-center top-card">
                <div oncontextmenu="return false" ondragstart="return false">
                    <h1 class="card-title">A p e H o u s e</h1>
                    <h5 class="card-text">P &nbsp;&nbsp; E &nbsp;&nbsp; R &nbsp;&nbsp; S &nbsp;&nbsp; O &nbsp;&nbsp; N &nbsp;&nbsp; A &nbsp;&nbsp; L</h5>
                    <h4 class="card-text">B &nbsp; L &nbsp; O &nbsp; G</h4>
                </div>
            </div>
        </div>

        <hr style="width: 80%;margin:10px auto">

        <div class="card text-center music-card">
            <div class="card-body"  oncontextmenu="return false" ondragstart="return false">
                    <div class="music " >
                        <div class="zhezhao">
                            <i class="fa fa-play-circle-o fa-5x play1"></i>
                            <img src="statics/images/music/zhe3.jpg" alt="">
                        </div>
                        <img src="statics/images/music/vae.jpg" alt="" class="music-img">
                    </div>
                    <div class="music" >
                        <div class="zhezhao">
                            <i class="fa fa-play-circle-o fa-5x play2"></i>
                            <img src="statics/images/music/zhe3.jpg" alt="">
                        </div>
                        <img src="statics/images/music/003.jpg" alt="" class="music-img">
                    </div>
                    <div class="music" >
                        <div class="zhezhao">
                            <i class="fa fa-play-circle-o fa-5x play3"></i>
                            <img src="statics/images/music/zhe3.jpg" alt="">
                        </div>
                        <img src="statics/images/music/xue.jpg" alt="" class="music-img">
                    </div>
            </div>
        </div>

        <a name="mao" id="mao"></a>

        <hr style="width: 80%;margin:20px auto">

        <ul class="nav justify-content-center nav-list" id="pills-tab" role="tablist">
            <li class="nav-item" >
                <a class="nav-link active" id="pills-blog-tab" data-toggle="pill" href="#pills-blog" role="tab" aria-controls="pills-blog" aria-selected="true"> B L O G </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-photo-tab" data-toggle="pill" href="#pills-photo" role="tab" aria-controls="pills-photo" aria-selected="false"> 图册 </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-resource-tab" data-toggle="pill" href="#pills-resource" role="tab" aria-controls="pills-resource" aria-selected="false"> 资源 </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"> 日志 </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"> 留言 </a>
            </li>
            
            <li class="nav-item">
            	<a class="nav-link" id="pills-detail-tab" data-toggle="pill" href="#detail" role="tab" aria-controls="pills-detail" aria-selected="false"></a>
            </li>
        </ul>
    </div>

	
	<div class="tab-content" id="pills-tabContent">
	
	    <div class="tab-pane fade show active container" id="pills-blog" role="tabpanel" aria-labelledby="pills-blog-tab">
			<c:if test="${blogs!=null }">
				<c:forEach var="blog" items="${blogs}">
					<div class="card">
						<hr>
			            <div class="card-body text-center">
			                <div class="card-title">
			                    <a href="javascript:;" blog-url="${blog.htmlUrl }" class="read-detail">
			                        <h5>${blog.title }</h5>
			                        <p></p>
			                    </a>
			                </div>
			                <p class="card-text blog-info">
			                    <i class="fa fa-clock-o"></i>发表于：<fmt:formatDate type="both" value="${blog.createTime }"/> |
			                    <i class="fa fa-folder-o"></i>分类于：<a href="javascript:;" category-id="{blog.category.id}">${blog.category.name }</a> |
			                    <i class="fa fa-comment-o"></i>评论：<span>0</span> |
			                    <i class="fa fa-eye"></i>浏览：<span>66</span>
			                </p>
			                <p class="card-text">
			                	<c:if test="${blog.tags!=null }">
			                		<c:forEach items="${blog.tags }" var="tag">
			                			<a class="btn btn-outline-secondary btn-sm tag">${tag.name}</a>
			                		</c:forEach>
			                	</c:if>
			                </p>
			                <xmp>${blog.summary }</xmp>
			                <a href="javascript:;" blog-url="${blog.htmlUrl }" class="btn btn-outline-secondary read-detail">阅读全文<i class="fa fa-angle-double-right btn-sm"></i></a>
			            </div>
			        </div>
				</c:forEach>
			</c:if>
    	</div>
    	
    	<div class="tab-pane fade container" id="pills-photo" role="tabpanel" aria-labelledby="pills-photo-tab">
    	
    		图册
    	</div>
	  	<div class="tab-pane fade container" id="pills-resource" role="tabpanel" aria-labelledby="pills-resource-tab">
	  	
	  		资源
	  	</div>
	  	
	  	<div class="tab-pane fade container editormd-preview-container" id="detail">
	  		
	  		详情
	  	</div>
	</div>


    <div class="btn btn-outline-secondary elevator-button" > <i class="fa fa-angle-double-up"></i> </div>

    <div class="foot">
        <div class="card">
            <div class="card-body bg-light text-center text-content">
                Copyright © 白马46
            </div>
        </div>
    </div>



    <!-- <script src="statics/js/jquery-1.9.1.min.js"></script> -->
    <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <!--旋转特效插件-->
    <script src="statics/js/jquery.rotate.min.js"></script>
    <!--返回顶部特效插件-->
    <script src="statics/js/elevator.js"></script>
    <!--颜色渐变动画插件-->
    <!-- <script src="statics/js/jquery.animate-colors-min.js"></script> -->
    <script src="//cdn.jsdelivr.net/jquery.color-animation/1/mainfile"></script>


<!--    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
    <script src="https://cdn.bootcss.com/jquery-migrate/1.4.1/jquery-migrate.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <audio id='bgm' src=''></audio>
    
    <script src="statics/js/blog/home.js"></script>
</body>
</html>
