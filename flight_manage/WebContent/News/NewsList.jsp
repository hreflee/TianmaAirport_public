<%@ page language="java" import="java.util.*,com.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html><head>
    <!-- Copyright 2016 软件1401第三组, Inc. All rights reserved. -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新闻中心-航班信息- 天马机场</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="<%=basePath%>/css/main.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/adminPage.css">
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap-datetimepicker.min.css">
    <!-- 支持时间控件 -->
  </head><body>
    <!-- 头部开始 -->
    <nav class="navbar navbar-default" role="navigation">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">
            <img class="navbar-logo" src="<%=basePath%>/img/logo.png">
          </a>
        </div>
        <div class="col-md-8 pull-right" id="personal-info">
          <ul class="list-inline">
            <li id="weather">正在获取天气...</li>
            <% 
            Admin admin=(Admin)request.getAttribute("admin");
			if(admin!=null){
        		out.println("<li id='cur-user'><span class='glyphicon glyphicon-user'></span>"+admin.getName()+" | 已登录</li><li><a class='text-info' href='#'>修改个人信息</a></li>");
        		out.println("<li><a class='text-danger' href='#'>退出</a></li>");
			}else{
				out.println("<li><a class='text-info' href='/flight_manage/login.jsp'>登陆</a></li>");
			}
            %>
          </ul>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-collapse-lower" id="header">
          <ul class="nav navbar-nav navbar-right">
          <%
          	if(session.getAttribute("priv3")!=null||session.getAttribute("priv4")!=null){
          		if(session.getAttribute("priv4")==null)
          			out.println("<li class='dropdown'><a href='#' class='dropdown-toggle curmenu' data-toggle='dropdown' data-hover='dropdown'>用户和角色管理</a><ul class='dropdown-menu' role='menu'><li class='curmenu'><a href='#'>角色管理</a></li></ul></li>");
          		if(session.getAttribute("priv3")==null)
          			out.println("<li class='dropdown'><a href='#' class='dropdown-toggle curmenu' data-toggle='dropdown' data-hover='dropdown'>用户和角色管理</a><ul class='dropdown-menu' role='menu'><li class='curmenu'><a href='#'>用户管理</a></li></ul></li>");
          		if(session.getAttribute("priv3")!=null&&session.getAttribute("priv4")!=null)
          			out.println("<li class='dropdown'><a href='#' class='dropdown-toggle curmenu' data-toggle='dropdown' data-hover='dropdown'>用户和角色管理</a><ul class='dropdown-menu' role='menu'><li class='curmenu'><a href='#'>用户管理</a></li><li><a href='#'>角色管理</a></li></ul></li>");
          	}
          		
          %>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">航班信息</a>
              <ul class="dropdown-menu" role="menu">
                <li>
                  <a href="#">国内到港</a>
                </li>
                <li>
                  <a href="#">国内离港</a>
                </li>
                <li>
                  <a href="#">国际到港</a>
                </li>
                <li>
                  <a href="#">国际离港</a>
                </li>
              </ul>
            </li>
            <%
            	if(session.getAttribute("priv0")!=null)
            		out.println("<li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown'>机场设施管理</a><ul class='dropdown-menu' role='menu'><li><a href='#'>机场资源</a></li><li><a href='#'>物业设施</a></li></ul></li>");
            	else
            		out.println("<li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown'>乘机指南</a><ul class='dropdown-menu' role='menu'><li><a href='#'>乘机指引</a></li><li><a href='#'>物业设施</a></li></ul></li>");
            		
            %>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">新闻中心</a>
              <ul class="dropdown-menu" role="menu">
                <li>
                  <a href="#m1">机场介绍</a>
                </li>
                <li>
                  <a href="#m2">航班信息</a>
                </li>
                <li>
                  <a href="#m3">机场资源</a>
                </li>
                <li>
                  <a href="#m4">物业资源</a>
                </li>
                <%
                	if(session.getAttribute("priv2")!=null)
                		out.println("<li><a href='#m5'>发布新闻</a></li>");
                %>
                
              </ul>
            </li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
    </nav>
    <!-- 头部结束 -->
    <!-- 内容开始 -->
    <div class="container" id="main-div">
      <div class="row">
        <div class="col-md-2" id="sidebar">
          <ul class="nav nav-pills nav-stacked" role="tablist">
            <li role="presentation" class="first-menu">
              <strong>新闻中心</strong>
            </li>
            <li>
              <ul class="nav nav-pills nav-stacked sub-menu" role="tablist">
                <li role="presentation">
                  <a href="#">机场介绍</a>
                </li>
                <li role="presentation" class="second-menu-cur">
                  <a href="#">航班信息</a>
                </li>
                <li role="presentation">
                  <a href="#">机场资源</a>
                </li>
                <li role="presentation">
                  <a href="#">物业资源</a>
                </li>
                <li role="presentation">
                  <a href="#">发布新闻</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="col-md-10" id="content">
          <ol class="breadcrumb">
            <li>
              <a href="#">新闻中心</a>
            </li>
            <li class="active">航班信息</li>
          </ol>
          <!-- <h2 class="page-header">用户管理</h2> -->
          <form class="form-horizontal" role="form">
            <div class="form-group">
              <label for="news-title" class="col-sm-2 control-label">新闻标题：</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" name="news-title">
              </div>
            </div>
            <div class="form-group">
              <label for="news-outtime" class="col-sm-2 control-label">发布时间：</label>
              <div class="col-sm-6">
                <input type="text" format="yyyy-mm-dd hh:ii" startview="0" minview="0" maxview="4" class="form-control" name="news-outtime">
              </div>
            </div>
            <div class="form-group">
              <label for="news-outname" class="col-sm-2 control-label">发布人：</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" name="news-outname">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-2"></div>
              <div class="col-sm-6">
                <button type="submit" class="col-sm-12 btn btn-primary">查询</button>
              </div>
            </div>
          </form>
          <a href="">最新航班消息</a>
          <a href="">最新航班消息</a>
          <a href="">最新航班消息</a>
          <table class="table table-hover select-table">
            <thead>
              <tr>
                <th>
                  <span class="glyphicon glyphicon-check th-check"></span>
                </th>
                <th>序号</th>
                <th>新闻标题</th>
                <th>发布时间</th>
                <th>发布人</th>
              </tr>
            </thead>
            <tbody>
              <tr data-id="10001">
                <td>
                  <span class="glyphicon glyphicon-check"></span>
                </td>
                <td>1</td>
                <td>
                  <a href="">最新航班消息</a>
                </td>
                <td>2016-1-1</td>
                <td>李静</td>
              </tr>
              <tr data-id="10002">
                <td>
                  <span class="glyphicon glyphicon-check"></span>
                </td>
                <td>2</td>
                <td>
                  <a href="">最新航班消息</a>
                </td>
                <td>2016-1-1</td>
                <td>李静</td>
              </tr>
              <tr data-id="10003">
                <td>
                  <span class="glyphicon glyphicon-check"></span>
                </td>
                <td>3</td>
                <td>
                  <a href="">最新航班消息</a>
                </td>
                <td>2016-1-1</td>
                <td>李静</td>
              </tr>
              <tr data-id="10004">
                <td>
                  <span class="glyphicon glyphicon-check"></span>
                </td>
                <td>4</td>
                <td>
                  <a href="">最新航班消息</a>
                </td>
                <td>2016-1-1</td>
                <td>李静</td>
              </tr>
              <tr data-id="10005">
                <td>
                  <span class="glyphicon glyphicon-check"></span>
                </td>
                <td>...</td>
                <td>
                  <a href="">最新航班消息</a>
                </td>
                <td>2016-1-1</td>
                <td>李静</td>
              </tr>
            </tbody>
          </table>
          <div>
            <ul class="pager">
              <li class="previous">
                <a href="#">← 上一页</a>
              </li>
              <li class="next">
                <a href="#">下一页 →</a>
              </li>
            </ul>
          </div>
          <div class="col-sm-6 btn-modify">
            <div class="btn-group btn-group-justified">
              <a class="btn btn-primary" href="">修改</a>
              <a class="btn btn-danger" href="">删除</a>
              <a class="btn btn-success" href="">新增</a>
            </div>
          </div>
        </div>
      </div>
      <div id="backToTop-btn" onclick="scroll(0,0)">
        <span class="glyphicon glyphicon-chevron-up"></span>
      </div>
    </div>
    <!-- 内容结束 -->
    <!-- 尾部开始 -->
    <footer class="container-fluid">
      <p class="text-center">
        <a href="#">About Us</a>·
        <a href="#">Site Map</a>·
        <a href="#">Privacy Policy</a>·
        <a href="#">Contact Us</a>· ©2016 软件1401班第三组</p>
    </footer>
    <!-- 尾部结束 -->
    <script src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/public.js"></script>
    <script type="text/javascript" src="https://api.thinkpage.cn/v3/weather/now.json?key=hoqbrzywjm37qvzd&amp;location=changsha"></script>
  

</body></html>