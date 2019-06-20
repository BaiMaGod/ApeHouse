<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



    <link rel="stylesheet" href="statics/editormd/css/editormd.css" />

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