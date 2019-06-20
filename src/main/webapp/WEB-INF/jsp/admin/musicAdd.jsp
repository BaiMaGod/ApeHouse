<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>添加音乐</title>
    <link rel="icon" type="image/png" href="statics/images/ape-icon.png"/>


    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

	<input type="text" id="playlist-name" class="form-control" placeholder="输入网易云音乐歌单名">
	<input type="text" id="playlist-id" class="form-control" placeholder="输入网易云音乐歌单id">
	<button class="btn btn-outline-primary" id="get-music">获取</button>

	<div id="music-list">

	</div>

	<div class="alert alert-primary" id="add-log-alert" style="display: none;max-width:200px;text-align: center;z-index: 9000;margin: auto;">

	</div>



	<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
<script>
	$(function () {
		var log_alert = $("#add-log-alert");

		$("#get-music").click(function () {
			var url = "https://music.163.com/api/playlist/detail?id="+$("#playlist-id").val();
			$.ajax({
				url:url,
				async:false,
                // 将XHR对象的withCredentials设为true
                xhrFields: {
                    withCredentials: true
                },
				success:function(res){
					printMusic(res.result.tracks);
					uploadMusic(res.result.tracks);
				},
				error:function () {
					log_alert.text("获取失败!");
					log_alert.fadeIn("slow");
					setTimeout(function () {
						log_alert.fadeOut("slow");
					},3000);
				}
			})
		});

		function printMusic(tracks) {
			console.log(tracks);
			var len = tracks.length;

			for (let i = 0; i < len; i++) {
				console.log("id:"+tracks[i].id);
				console.log("name:"+tracks[i].name);
				console.log("artist:"+tracks[i].artist[0].name);
			}
		}
		function uploadMusic(tracks) {

		}
	});
</script>
