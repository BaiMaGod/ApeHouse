<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/blog/head.jsp"%>

<link rel="stylesheet" href="statics/editormd/css/editormd.css" />

	<div class="container">
		<div class="detail-blog">
			<c:if test="${blog!=null}">
	            <h2 class="blog-title">${blog.title }</h2>
	            <p class="blog-info">
	                <i class="fa fa-clock-o"></i>发表于：<fmt:formatDate type="both" value="${blog.createTime }"/> |
	                <i class="fa fa-folder-o"></i>分类于：<span>${blog.category.name }</span> |
	                <i class="fa fa-comment-o"></i>评论：<span>0</span> |
	                <i class="fa fa-eye"></i>浏览：<span>66</span>
	            </p>
	            <br>
				<jsp:include page="/ape/jsp/${blog.id}.jsp"></jsp:include>
				
			</c:if>
		</div>
	</div>
	
<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>

<script>
//		let mao = $('#mao');
//	    let scrollTop = $('html,body').scrollTop();
//	    let off = mao.offset().top + scrollTop;
//	    $('html,body').stop(true).animate({scrollTop: off+'px'}, 500);

	window.onload=function(){
	    $("html, body").animate({scrollTop:$('#mao').offset().top}, 800); 
	};
</script>