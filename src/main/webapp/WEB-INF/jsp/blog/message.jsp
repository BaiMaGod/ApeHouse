<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/blog/head.jsp"%>



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
            <c:if test="${messages!=null }">
                <c:forEach var="message" items="${messages}">
                    <div class="message fadeIn">
                        <img src="statics/images/message/${message.background}.png">
                        <p class="header">${message.nickname}：</p>
                        <div class="message-content" >${message.content}</div>
                        <p class="footer"><fmt:formatDate type="both" value="${message.createTime }"/></p>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>

    <button class="btn btn-outline-secondary" id="btn-message-add" type="button"  data-toggle="modal" data-target="#message-add"><i class="fa fa-send"></i> </button>


    <div class="modal fade" id="message-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body text-content">
                    <div class="message-add ">
                        <input id="nickname" class="header" type="text" placeholder="输入昵称..." maxlength="7">
                        <div id="message-add-editor" class="message-content" contenteditable="true"></div>
                        <button id="message-send" class="btn btn-outline-primary btn-sm footer">留言</button>
                        <i id="message-add-emoji" class="fa fa-smile-o fa-2x"></i>
                        <i id="change-bg" bg="1" class="fa fa-arrow-circle-o-right fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>

<script>




</script>