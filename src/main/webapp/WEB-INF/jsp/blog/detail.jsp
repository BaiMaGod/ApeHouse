<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%--<%@include file="/WEB-INF/jsp/blog/head2.jsp"%>--%>


	<link rel="stylesheet" href="statics/editormd/css/editormd.css" />

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

	<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>

	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="statics/js/blog/body.js"></script>
</body>
</html>

<script>
//		let mao = $('#mao');
//	    let scrollTop = $('html,body').scrollTop();
//	    let off = mao.offset().top + scrollTop;
//	    $('html,body').stop(true).animate({scrollTop: off+'px'}, 500);

	window.onload=function(){
	    $("html, body").animate({scrollTop:$('#mao').offset().top}, 800); 
	};


	function changeURLArg(url,arg,arg_val){
		var pattern=arg+'=([^&]*)';
		var replaceText=arg+'='+arg_val;
		if(url.match(pattern)){
			var tmp='/('+ arg+'=)([^&]*)/gi';
			tmp=url.replace(eval(tmp),replaceText);
			return tmp;
		}else{
			if(url.match('[\?]')){
				return url+'&'+replaceText;
			}else{
				return url+'?'+replaceText;
			}
		}
		return url+'\n'+arg+'\n'+arg_val;
	}
</script>