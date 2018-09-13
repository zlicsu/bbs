<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/buttons.css" />
<script src="${path }/public/js/pace.min.js"></script>
<script src="${path}/public/js/index/common.js" type="text/javascript"></script>
<script src="${path}/public/js/fk.js" type="text/javascript"></script>
<script src="${path}/public/js/index.js"></script>
<script src="${path}/public/js/prefixfree.min.js"></script>

<div id="xq">
	<div class="geren">
	 <a href="${path}/guakao/geren/index.do" class="button button-glow button-block button-primary button-rounded">快速挂证入口</a>
	</div>
	<div class="qiye">
	 <a href="${path}/guakao/qiye/index.do" class="button button-glow button-block button-primary button-rounded">企业寻证入口</a>
	</div>
   <div class="Wire">
     <div class="title">证书信息<span><a href="${path}/guakao/geren/querypage.do">更多</a></span></div>
	 <ul class="content">
		 <c:forEach items="${zhengshus}" var="zhengshu" varStatus="id">  
	       <li>
		   <p>·<a href="#">${zhengshu.content}</a><span>${zhengshu.createtime}</span><span>${zhengshu.zsname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
		   </li>  
	     </c:forEach>  
	   <li>
	 </ul>
   </div>
   <div class="Activities">
    <div class="title">安全企业<span><a href="${path}/guakao/qiye/querypage.do">更多</a></span></div>
	 <ul class="content">
		 <c:forEach items="${companies}" var="company" varStatus="id">  
	       <li>
		   <p>·<a href="#">${company.name}</a><span>${company.createtime}</span><span>${company.zsname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
		   </li>  
	     </c:forEach>  
	   <li>
	 </ul>
   </div> 
</div>