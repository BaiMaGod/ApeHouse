<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>登录-猿馆</title>
<link rel="icon" type="image/png" href="statics/images/ape-icon.png"/>


 	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="statics/css/login.css">
</head>
<body>
<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>

	<form:form class="form-signin" action="doLogin" method="post" modelAttribute="user">
		<div class="form-group">
	    	<h1 class="h3 mb-3 font-weight-normal">登录</h1>
		</div>
		
		<div class="form-group">
		    <label for="inputEmail" class="sr-only">账户：</label>
		    <input type="text" id="number" name="number" class="form-control" placeholder="邮箱"  autofocus>
		    <font color="red"><form:errors path="number"></form:errors></font>
		</div>
		
		<div class="form-group">
		    <label for="inputPassword" class="sr-only">密码：</label>
		    <input type="password" id="password" name="password" class="form-control" placeholder="密码" >
			<font color="red"><form:errors path="password"></form:errors></font>
		</div>
		
		
	    <button class="btn btn-lg btn-primary btn-block" type="button" onclick="login();">登录</button>
	    <div class="form-group" style="margin-top: 10px;text-decoration: none">
			<a href="#" class="mt-5 mb-3" >没有账号？点击注册</a>
		</div>
	</form:form>

	<div style="position: absolute;bottom: 10px">
		<div class="container">
			<p class="mt-5 mb-3 text-muted">Copyright © 白马46</p>
		</div>
	</div>
	
	<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
</body>
</html>

<script type="text/javascript">
function login() {
	var number = $("#number").val();
	var password = $("#password").val();
	
	
	$.ajax({
		url:"admin/login",
		type:"post",
		data:JSON.stringify({number:number,password:password}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(data){
			if(data.code==1){
				if($("#referer")!=null){
					window.location.href = $("#referer").val();
				}else{
					window.location.href = "";
				}
			}else{
				alert("密码或用户名错误！");
			}
		},
		error:function(){
			alert("error");
		}
	});
}
</script>