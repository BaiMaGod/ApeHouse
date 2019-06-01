<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>${title}</title>


    <link rel="stylesheet" href="../../../statics/css/public.css">
    <link rel="stylesheet" href="../../../statics/css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="../../../statics/css/fhNav.css">
</head>
<body>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>


    <!-- 顶部导航栏 -->
    <div class="wrap">

        <div class="topBox">
            <div class="fhNav">
                <div class="bottomLine"></div>
                <ul class="nav clearfix">
                    <li class="selectedNav"><a href="home.html">首页</a></li>
                    <li><a href="blog.html">博客文章</a></li>
                    <li>福利分享</li>
                    <li><a href="resourceCenter.html"> 资源中心</a></li>
                    <li>赞助白马</li>
                    <li>技术交流</li>
                    <li>给我留言</li>
                </ul>
            </div>
            <div class="div_search">
                <input type="text" placeholder="全站搜索...">
                <button type="button" ><i class="fa fa-search fa-lg"></i></button>

            </div>
        </div>
        <script src="../../../statics/js/jquery.js"></script>
        <script src="../../../statics/js/fhNav.js"></script>
        <script>
            $(".div_search button").click(function () {
                var search_input = $(".div_search input");
                search_input.toggle("slow");
            });
        </script>
    </div>
    <!--顶部导航栏结束-->



