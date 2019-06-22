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

    <!-- <link rel="stylesheet" href="statics/bootstrap-4.0.0/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="statics/css/font-awesome-4.7.0/css/font-awesome.css"> -->
    <link rel="stylesheet" href="statics/icon/iconfont.css">

    <!-- 时间轴 -->
    <link rel="stylesheet" href="statics\css\jquery.Timeline.css">

    <!-- 表情输入 -->
    <link rel="stylesheet" href="statics/jQuery-emoji/css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="statics/jQuery-emoji/css/jquery.emoji.css">


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
                    <li class="nav-item ">
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
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa fa-envelope fa-lg"></i>
                            <img class="myweixin" src="statics/images/myemail.png" alt="email">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="https://blog.csdn.net/weixin_42486795" target="_blank"> <i class="iconfont icon-csdn"></i> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="https://github.com/BaiMaGod" target="_blank"> <i class="fa fa-github fa-lg"></i> </a>
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


    </div>

    
    