<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/blog/head.jsp"%>


	<div class="tab-content" id="pills-tabContent">
	
	    <div class="tab-pane fade show active container editormd-preview-container" id="pills-blog" role="tabpanel" aria-labelledby="pills-blog-tab">
			<c:if test="${blogs!=null }">
				<c:forEach var="blog" items="${blogs}">
					<div class="card">
						<hr>
			            <div class="card-body text-center">
			                <div class="card-title">
			                    <a href="blog/${blog.id }" blog-id="${blog.id }" class="read-detail">
			                        <h5>${blog.title }</h5>
			                        <p></p>
			                    </a>
			                </div>
			                <p class="card-text blog-info">
			                    <i class="fa fa-clock-o"></i>发表于：<fmt:formatDate type="both" value="${blog.createTime }"/> |
			                    <i class="fa fa-folder-o"></i>分类于：<a href="javascript:;" category-id="{blog.category.id}">${blog.category.name }</a> |
			                    <i class="fa fa-comment-o"></i>评论：<span>0</span> |
			                    <i class="fa fa-eye"></i>浏览：<span>66</span>
			                </p>
			                <p class="card-text">
			                	<c:if test="${blog.tags!=null }">
			                		<c:forEach items="${blog.tags }" var="tag">
			                			<a class="btn btn-outline-secondary btn-sm tag">${tag.name}</a>
			                		</c:forEach>
			                	</c:if>
			                </p>
			                <xmp>${blog.summary }</xmp>
			                <a href="blog/${blog.id }" blog-id="${blog.id }" class="btn btn-outline-secondary read-detail">阅读全文<i class="fa fa-angle-double-right btn-sm"></i></a>
			            </div>
			        </div>
				</c:forEach>
			</c:if>
    	</div>
    	
    	<div class="tab-pane fade container" id="pills-photo" role="tabpanel" aria-labelledby="pills-photo-tab">
    	
    		图册
    	</div>
	  	<div class="tab-pane fade container" id="pills-resource" role="tabpanel" aria-labelledby="pills-resource-tab">
	  	
	  		资源
	  	</div>
	  	
	  	<div class="tab-pane fade container" id="detail">
	  		
	  		详情
	  	</div>
	</div>

<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>