<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%--<%@include file="/WEB-INF/jsp/blog/head2.jsp"%>--%>


        <c:if test="${blogs!=null }">
            <c:forEach var="blog" items="${blogs}">
                <div class="card">
                    <hr>
                    <div class="card-body text-center">
                        <div class="card-title">
                            <a href="javascript:;" blog-id="${blog.id }" class="read-detail">
                                <h5>${blog.title }</h5>
                                <p></p>
                            </a>
                        </div>
                        <p class="card-text blog-info">
                            <i class="fa fa-clock-o"></i>发表于：<fmt:formatDate type="both" value="${blog.createTime }"/> |
                            <i class="fa fa-folder-o"></i>分类于：<a href="blog/${blog.id}" category-id="{blog.category.id}">${blog.category.name }</a> |
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
                        <a href="javascript:;" blog-id="${blog.id }" class="btn btn-outline-secondary read-detail">阅读全文<i class="fa fa-angle-double-right btn-sm"></i></a>
                    </div>
                </div>
            </c:forEach>
        </c:if>


<%--    <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>--%>

<%--    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>--%>

<%--    <script src="statics/js/blog/body.js"></script>--%>
<%--</body>--%>
<%--</html>--%>
