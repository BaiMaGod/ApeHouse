<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/public/head.jsp"%>
<link rel="stylesheet" href="statics/css/list.css">
<link rel="stylesheet" href="statics/css/rc.css">
<link rel="stylesheet" href="statics/css/scrolltype.css">

<!-- 中心部分 -->
<section class="container">
	
	<!-- 通知 -->
    <div class="speedbar">
            <div class="pull-right">
                <i class="fa fa-user"></i>
                <a href="resource/fileUpload" target="_blank">上传资源</a>&nbsp;&nbsp;&nbsp;
                <i class="fa fa-power-off"></i>
                <a href="login">登录</a>
            </div>
            <div class="toptip">
                <strong class="text-success"><i class="fa fa-volume-up"></i> </strong>
                &nbsp;《Python3网络爬虫开发实战》赠书活动正在进行中！详情请戳
                <a href="https://cuiqingcai.com/6173.html">赠书活动</a>
                ！欢迎参与！非常感谢！
            </div>
        </div>
	<!-- 通知 结束-->

	<!-- 中心左边部分 -->
    <div class="content-wrap">
        <!-- 资源列表 -->
        <div id="content_list">
        
            <c:forEach items="${resurces }" var="resurce">
				<article class="excerpt">
	                <header>
	                    <a class="label label-important" href="#">资源分类
	                        <i class="label-arrow"></i>
	                    </a>
	                    <h2>
	                        <a target="_blank" href="#" title="为什么你们就是不能加个空格呢？">${resurce.name } </a>
	                    </h2>
	                </header>
	                <div class="focus">
	                    <a target="_blank" href="#">
	                        <img class="thumb" src="https://cuiqingcai.com/wp-content/themes/Yusi/timthumb.php?src=https://qiniu.cuiqingcai.com/wp-content/uploads/2019/05/u20170851661555839722fm11gp0.jpg&amp;h=123&amp;w=200&amp;q=90&amp;zc=1&amp;ct=1"
	                             alt="${resurce.name }">
	                    </a>
	                </div>
	                <span class="note">${resurce.depict }</span>
	                <p class="tags">
	                    <a href="javascript:;"><label class="tag">植物大战僵尸</label></a>
	                    <a href="javascript:;"><label class="tag">破解版</label></a>
	                    <a href="javascript:;"><label class="tag">无限砖石</label></a>
	                </p>
	                <p class="auth-span">
	                    <span class="muted">
	                        <i class="fa fa-user"></i>
	                        <a href="javascript:;">${resurce.userId }</a>
	                    </span>
	                    <span class="muted">
	                        <i class="fa fa-clock-o"></i>${resurce.createTime }
	                    </span>
	                    <span class="muted">
	                        <i class="fa fa-eye"></i> 1130浏览
	                    </span>
	                    <span class="muted">
	                        <i class="fa fa-comments-o"></i>
	                        <a target="_blank" href="#">6评论</a>
	                    </span>
	                    <span class="muted">
	                        <a href="javascript:;" data-action="ding" data-id="6533" class="Addlike action">
	                            <i class="fa fa-heart-o"></i>
	                            <span class="count">14</span>喜欢
	                        </a>
	                    </span>
	                </p>
	            </article>
			</c:forEach>
            
        
        </div>
        <!-- 资源列表 结束 -->
    </div>
    <!-- 中心左边部分 结束-->

	<!-- 侧边栏 -->
    <aside class="sidebar">

        <!-- 侧边栏顶部 搜索 -->
        <div class="widget widget_text">
            <div class="sidebar_search">
                <input type="text" placeholder="本页搜索...">
                <button type="button" ><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>

        <!-- 侧边栏顶部 热门专题 轮播图 -->
        <div class="widget widget_meta">
            <div class="div-hot">
                <div class="title"><h2>热门资源</h2></div>
                <hr>
            </div>
        </div>

    </aside>
    <!-- 侧边栏 结束 -->
</section>
<!-- 中心部分 结束 -->

<%@include file="/WEB-INF/jsp/public/foot.jsp"%>