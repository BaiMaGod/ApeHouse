<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/blog/head.jsp"%>


    <link rel="stylesheet" href="statics/editormd/css/editormd.css" />


    <ul class="nav justify-content-center nav-list">
        <li class="nav-item">
            <a class="nav-link active" href="blog"> B L O G </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:;"> 图册 </a>
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


    <div class="container">
        <div class="detail-blog">
            <c:if test="${blog!=null}">
                <h2 class="blog-title">${blog.title }</h2>
                <p class="blog-info">
                    <i class="fa fa-clock-o"></i>发表于：<fmt:formatDate type="both" value="${blog.createTime }"/> |
                    <i class="fa fa-folder-o"></i>分类于：<a href="javascript:;" category-id="{blog.category.id}">${blog.category.name }</a> |
                    <i class="fa fa-comment-o"></i>评论：<span>0</span> |
                    <i class="fa fa-eye"></i>浏览：<span>66</span>
                </p>
                <br>
                <jsp:include page="/ape/jsp/${blog.id}.jsp"></jsp:include>

            </c:if>
        </div>
    </div>



<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>
<script src="statics/js/blog/detail.js"></script>
