<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/jsp/public/head.jsp"%>

<link rel="stylesheet" href="statics/layui/css/layui.css">
<link rel="stylesheet" href="statics/css/scrolltype.css">

<style>
        .layui-form{
            margin: auto;
            margin-top: 10px;
            max-width: 800px;
        }
    </style>
    
    
    
    
    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color:red;">*</span>资源文件</label>
            <div class="layui-input-block">
                <input type="file" name="title" required  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color:red;"></span>图标</label>
            <div class="layui-input-block">
                <input type="file" name="title" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color:red;">*</span>资源名</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入资源名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color:red;">*</span>资源类型</label>
            <div class="layui-input-block" style="max-width: 300px">
                <select name="type" lay-verify="required">
                    <option value=""></option>
                    <option value="0">文档</option>
                    <option value="1">代码</option>
                    <option value="2">软件</option>
                    <option value="3">工具</option>
                    <option value="4">图片</option>
                    <option value="5">视频</option>
                    <option value="6">其他</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><span style="color:red;">*</span>所属分类</label>
                <div class="layui-input-inline" style="width: 300px;">
                    <select name="class-1" lay-verify="required">
                        <option value=""></option>
                        <option value="0">移动开发</option>
                        <option value="1">开发技术</option>
                        <option value="2">安全技术</option>
                        <option value="3">数据库</option>
                        <option value="4">服务器</option>
                        <option value="5">证书考试</option>
                        <option value="6">游戏</option>
                        <option value="7">其他</option>
                    </select>
                </div>
                <div class="layui-input-inline" style="width: 300px;">
                    <select name="class-2" lay-verify="required">
                        <option value=""></option>
                        <option value="0">移动开发1</option>
                        <option value="1">开发技术1</option>
                        <option value="2">安全技术1</option>
                        <option value="3">数据库1</option>
                        <option value="4">服务器1</option>
                        <option value="5">证书考试1</option>
                        <option value="6">游戏1</option>
                        <option value="7">其他1</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color:red;">*</span>标签</label>
            <div class="layui-input-block" style="padding-top: 4px">
                <input type="text" name="tags" style="height: 30px;width: 120px;border-radius: 20px;border-color:#e6e6e6;border-width:1px;border-style:solid;" lay-verify="required">
                <input type="button" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm" value="添加标签" id="add-tag" onclick="addTag()">
            </div>
            <div class="layui-input-block">
                <label class="layui-form-mid layui-word-aux">至少1个标签，最多5个标签，每个标签最多8个字符</label>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label"><span style="color:red;">*</span>资源描述</label>
            <div class="layui-input-block">
                <textarea name="desc" placeholder="请输入内容" class="layui-textarea" lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    
<script src="statics/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function(){
        var form = layui.form;


    });

</script>


<%@include file="/WEB-INF/jsp/public/foot.jsp"%>