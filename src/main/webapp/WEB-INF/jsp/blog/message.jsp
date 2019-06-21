<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/blog/head.jsp"%>


<link rel="stylesheet" href="statics\css\jquery.Timeline.css">


<ul class="nav justify-content-center nav-list">
    <li class="nav-item">
        <a class="nav-link active" href="blog"> B L O G </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="album"> 图册 </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="javascript:;"> 资源 </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="log"> 日志 </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="message"> 留言 </a>
    </li>
</ul>


<style>


</style>

<div class="container">
    <div class="message-board">
        <div class="message fadeIn">
            <img src="statics/images/message/bg1.png">
            <p class="header">头：</p>
            <div class="message-content" ></div>
            <p class="footer">2019 6 18 18:25:00</p>
        </div>
        <div class="message fadeIn">
            <img src="statics/images/message/bg2.png">
            <p class="header">头：</p>
            <div class="message-content" ></div>
            <p class="footer">2019 6 18 18:25:00</p>
        </div>
        <div class="message fadeIn">
            <img src="statics/images/message/bg3.png" alt="">
            <p class="header">头：</p>
            <div class="message-content" ></div>
            <p class="footer">2019 6 18 18:25:00</p>
        </div>
    </div>

</div>

    <button class="btn btn-outline-secondary" id="btn-message-add" type="button"  data-toggle="modal" data-target="#message-add"><i class="fa fa-send"></i> </button>


    <div class="modal fade" id="message-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body text-content">
                    <div class="message-add ">
                        <input class="header" type="text" placeholder="输入昵称..." maxlength="10">
                        <div class="message-content" contenteditable="true"></div>
                        <button class="btn btn-outline-primary btn-sm footer">留言</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>