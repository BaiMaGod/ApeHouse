<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/blog/head.jsp"%>


<link rel="stylesheet" href="statics\css\jquery.Timeline.css">


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
    <div class="VivaTimeline">
        <dl>
            <dt>Jan 2016</dt>
            <dd class="pos-left clearfix">
                <div class="circ"></div>
                <div class="time">Jan 07</div>
                <div class="events">
                    <div class="events-header">Event Heading</div>
                    <div class="events-body">
                        <div class="row" style="display: block;">
                            <div class="col-md-6 pull-left">
                                <img class="events-object img-responsive img-rounded" src="img/rabbit01.png">
                            </div>
                            <div class="events-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </div>
                        </div>
                    </div>
                </div>
            </dd>


            <c:if test="${logs!=null }">
                <c:forEach var="log" items="${logs}">
                    <dt><fmt:formatDate type="date" value="${log.createTime}" pattern="yyyy M d"/></dt>
                    <dd class="pos-left clearfix">
                        <div class="circ"></div>
                        <div class="time"><p> <fmt:formatDate type="time" value="${log.createTime}"/> </p> <p style="font-size: 12px">${log.weather}</p></div>
                        <div class="events">
                            <div class="events-header">${log.title}</div>
                            <div class="events-body">
                                <div class="row" style="display: block;">
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

<script src="statics/js/jquery.Timeline.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.VivaTimeline').vivaTimeline({
            carousel: true,
            carouselTime: 3000
        });
    });
</script>