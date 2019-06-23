<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>QAQ内容找不到了 - 猿馆</title>
	<link rel="icon" type="image/png" href="statics/images/ape-icon.png"/>

	<link rel="stylesheet" href="statics/css/blog/404.css" />
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</head>
<body>
<div class="code">
	<p>ERROR 404</p>
</div>
<div class="road">
	<div class="shadow">
		<div class="shelt">
			<div class="head">
				<div class="eyes">
					<div class="lefteye">
						<div class="eyeball"></div>
						<div class="eyebrow"></div>
					</div>
					<div class="righteye">
						<div class="eyeball"></div>
						<div class="eyebrow"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="hat"></div>
		<div class="bubble">
			<a href="">Go back Home?</a>
		</div>
	</div>
	<p>PAGE NOT FOUND</p>
</div>

<script type="text/javascript" src="statics/js/blog/404.js" ></script>
</body>
</html>
