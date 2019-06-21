<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/blog/head.jsp"%>

	<link rel="stylesheet" href="statics\css\jquery.Timeline.css">

	<ul class="nav justify-content-center nav-list" id="pills-tab" role="tablist">
		<li class="nav-item" >
			<a class="nav-link active" id="pills-blog-tab" data-toggle="pill" href="#pills-blog" role="tab" aria-controls="pills-blog" aria-selected="true"> B L O G </a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="pills-photo-tab" data-toggle="pill" href="#pills-photo" role="tab" aria-controls="pills-photo" aria-selected="false"> 图册 </a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="pills-resource-tab" data-toggle="pill" href="#pills-resource" role="tab" aria-controls="pills-resource" aria-selected="false"> 资源 </a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="pills-log-tab" data-toggle="pill" href="#pills-log" role="tab" aria-controls="pills-log" aria-selected="false"> 日志 </a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="pills-massage-tab" data-toggle="pill" href="#pills-massage" role="tab" aria-controls="pills-massage" aria-selected="false"> 留言 </a>
		</li>

		<li class="nav-item">
			<a class="nav-link" id="pills-detail-tab" data-toggle="pill" href="#detail" role="tab" aria-controls="pills-detail" aria-selected="false"></a>
		</li>
	</ul>


	<div class="tab-content" id="pills-tabContent">
	
	    <div class="tab-pane fade show active container editormd-preview-container" id="pills-blog" role="tabpanel" aria-labelledby="pills-blog-tab">
			<c:if test="${blogs!=null }">
				<c:forEach var="blog" items="${blogs}">
					<div class="card">
						<hr>
			            <div class="card-body text-center">
			                <div class="card-title">
			                    <a href="blog/${blog.id }" target="_blank" blog-id="${blog.id }" class="read-detail">
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
			                <a href="blog/${blog.id }" target="_blank" blog-id="${blog.id }" class="btn btn-outline-secondary read-detail">阅读全文<i class="fa fa-angle-double-right btn-sm"></i></a>
			            </div>
			        </div>
				</c:forEach>
			</c:if>
    	</div>
    	
    	<div class="tab-pane fade container" id="pills-photo" role="tabpanel" aria-labelledby="pills-photo-tab">
    	
    		图册，还没有哦~~~~~
    	</div>
	  	<div class="tab-pane fade container" id="pills-resource" role="tabpanel" aria-labelledby="pills-resource-tab">
	  	
	  		资源，还没有哦~~~~~
	  	</div>
		<div class="tab-pane fade container" id="pills-log" role="tabpanel" aria-labelledby="pills-log-tab">

			<div class="VivaTimeline">
				<dl>
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
		<div class="tab-pane fade container" id="pills-massage" role="tabpanel" aria-labelledby="pills-massage-tab">

			<div class="message-board">
				<c:if test="${messages!=null }">
					<c:forEach var="message" items="${messages}">
						<div class="message fadeIn">
							<img src="statics/images/message/bg1.png">
							<p class="header">${message.nickname}</p>
							<div class="message-content" >${message.content}</div>
							<p class="footer"><fmt:formatDate type="both" value="${message.createTime }"/></p>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>


	<button class="btn btn-outline-secondary" id="btn-message-add" type="button"  data-toggle="modal" data-target="#message-add"><i class="fa fa-send"></i> </button>


	<div class="modal fade" id="message-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body text-content">
					<div class="message-add ">
						<input class="header" type="text" placeholder="输入昵称..." maxlength="10">
						<div class="message-content" contenteditable="true"></div>
						<button class="btn btn-outline-primary btn-sm footer">留言</button>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="/WEB-INF/jsp/blog/foot.jsp"%>

