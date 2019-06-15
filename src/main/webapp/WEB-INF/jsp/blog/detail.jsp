<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/blog/head.jsp"%>

	<style>
		.detail h1,.detail h2,.detail h3,.detail h4,.detail h5,{
			color: gray;
		}
	</style>

	<div class="detail" style="width: 80%;margin: auto">
		<c:if test="${blog!=null}">
			<div class="blog-title" style="text-align: center;">
            </div>
                   <h2 style="text-align: center; margin:20px auto;">${blog.title }</h2>
            <p class="blog-info" style="font-size: 14px;text-align: center;margin:20px auto;">
                <i class="fa fa-clock-o"></i>发表于：<fmt:formatDate type="both" value="${blog.createTime }"/> |
                <i class="fa fa-folder-o"></i>分类于：<span>${blog.category.name }</span> |
                <i class="fa fa-comment-o"></i>评论：<span>0</span> |
                <i class="fa fa-eye"></i>浏览：<span>66</span>
            </p>
            <br>
			<jsp:include page="/${blog.htmlUrl}"></jsp:include>
			
		</c:if>
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