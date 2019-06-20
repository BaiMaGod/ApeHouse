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


    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="statics/css/font-awesome-4.7.0/css/font-awesome.css"> -->
    <link rel="stylesheet" href="statics/icon/iconfont.css">


    <link rel="stylesheet" href="statics/css/blog/home.css">
</head>
<body>

    <a name="mao" id="mao"></a>

    <hr style="width: 80%;margin:20px auto">

    <ul class="nav justify-content-center nav-list">
        <li class="nav-item">
            <a class="nav-link active" href="#"> B L O G </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:;"> 图册 </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:;"> 资源 </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:;"> 日志 </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:;"> 留言 </a>
        </li>
    </ul>