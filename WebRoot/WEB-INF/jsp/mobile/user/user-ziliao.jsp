<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>个人资料-112挂证网</title>
 <meta name="keywords" content="个人资料" /> 
  <meta name="description" content="个人资料" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<body class="bg" id="wrap">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<header class="header">
    <div class="nav">
<a href="javascript:;" onclick="history.go(-1);" class="z"><img src="${path}/public/mobile/images/icon_back.png" /></a>
<span>我的资料</span>
    </div>
</header>
<div class="userinfo">
<div class="user_avatar">
<div class="avatar_m"><span><img src="<%=request.getContextPath()%>/file/${sessionScope.indexuser.img}" /></span></div>
<h2 class="name">${sessionScope.indexuser.loginname}</h2>
</div>
<div class="user_box">
<ul>
<li><span>${sessionScope.indexuser.name}</span>真实姓名</li>
<li><span>
<c:if test="${sessionScope.indexuser.sex==0}">保密</c:if> 
<c:if test="${sessionScope.indexuser.sex==1}">男</c:if> 
<c:if test="${sessionScope.indexuser.sex==2}">女</c:if> 
</span>性别</li>
<li><span>${sessionScope.indexuser.birthday}</span>生日</li>
<li><span>${sessionScope.indexuser.email}</span>邮箱</li>
</ul>
</div>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

