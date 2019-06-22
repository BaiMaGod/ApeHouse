<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/blog/head.jsp"%>


<link rel="stylesheet" href="statics\css\jquery.Timeline.css">


<ul class="nav justify-content-center nav-list">
    <li class="nav-item">
        <a class="nav-link" href="blog"> B L O G </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="javascript:;"> 图册 </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="javascript:;"> 资源 </a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="log"> 日志 </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="message"> 留言 </a>
    </li>
</ul>


<div class="container">
    <div class="VivaTimeline">
        <dl>
            <c:if test="${logs!=null }">
                <c:forEach var="log" items="${logs}" varStatus="status">
                    <dt><fmt:formatDate type="date" value="${log.createTime}" pattern="yyyy M d"/></dt>
                    <dd class="pos-left clearfix">
                        <div class="circ"></div>
                        <div class="time">
                            <p><fmt:formatDate type="time" value="${log.createTime}"/> </p>
<%--                            <p style="font-size: 12px;text-align: center">${log.weather}</p>--%>
                        </div>
                        <div class="events">
                            <div class="events-header">${log.title}</div>
                            <div class="events-body">
                                <div class="row">
                                    <div class="events-desc">${log.content}</div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </c:forEach>
            </c:if>
        </dl>
    </div>
</div>



<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>
