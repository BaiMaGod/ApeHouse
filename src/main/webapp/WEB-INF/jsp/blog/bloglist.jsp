<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/blog/head.jsp"%>





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
        <a class="nav-link" href="javascript:;"> 留言 </a>
    </li>
</ul>


    <div class="container">
        <c:if test="${blogs!=null }">
            <c:forEach var="blog" items="${blogs}">
                <div class="card">
                    <hr>
                    <div class="card-body text-center">
                        <div class="card-title">
                            <a href="blog/${blog.id }" target="_blank" blog-id="${blog.id }" class="read-detail">
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
                        <a href="blog/${blog.id }" target="_blank" blog-id="${blog.id }" class="btn btn-outline-secondary read-detail">阅读全文<i class="fa fa-angle-double-right btn-sm"></i></a>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>



<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>