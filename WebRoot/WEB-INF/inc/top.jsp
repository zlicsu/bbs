<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/css/style.css" />
<link rel="Shortcut Icon" href="${path}/logoicon.ico" type="image/x-icon" />
<script src="${path }/public/js/pace.min.js"></script>
<script src="${path}/public/js/index/common.js" type="text/javascript"></script>
<script type="text/javascript">

function showhidediv(){
	$("#login_user_menu").slideToggle('fast');
}
</script>
 <!-- 弹出页面 -->
<div id="append_parent"></div> 
  <div id="toptb" class="cl"> 
   <div class="wp"> 
    <div class="z"> 
     <a href="${path}/" title="112挂证网"><img src="${path}/file/${applicationScope.bbsinfo.logoimg}" alt="112挂证网"  /></a> 
    </div> 
    <div class="z qing_toptb"> 
     <ul> 
      <li id="mn_portal"><a href="${path}/" title="112挂证网">首页<span>首页</span></a></li> 
     </ul> 
    </div> 
    <div class="z qing_toptb"> 
    <!-- <div class="topp_rabg" style="padding-top:3px; padding-bottom:8px; width:265px; height:29px">
           <marquee scrollAmount=3 width=100% onmouseover=this.stop() onmouseout=this.start()><span style="color: #666;padding-left: 80px">挂证咨询：</span> <span style="color: #eb0000; font-size: 14px; font-weight: 800">
        13983388960
    </span></marquee>
          </div> -->
    <span style="color: #999;padding-left: 100px;font-size: 16px;">挂证咨询：</span> <span style="color: #eb0000; font-size: 14px; font-weight: 800">
        15683103769
    </span>
    </div>
    <div class="y"> 
     <div class="qing_no_login cl"> 
     <c:if  test="${!empty sessionScope.indexuser}">
      <a href="javascript:;" id="qing_user" onclick="showhidediv();" >${sessionScope.indexuser.loginname}
      <c:if test="${sessionScope.indexuser.isreadcount!=0}">
     	 <span style="color: red;" onclick="window.location.href='${path}/user/message/index.do'">(消息:${sessionScope.indexuser.isreadcount})</span>
      </c:if> 
      </a> 
      <div id="login_user_menu" class="qing_user_pop"> 
       <a href="${path}/member/${sessionScope.indexuser.id}_1.html" class="qing_userinfo_avtar" target="_blank">
        <span class="grid_edit">个人资料</span>
        <img src="${path}/upload/image/${sessionScope.indexuser.img}" /></a> 
       <c:if  test="${sessionScope.indexuser.groupid==1}">
       	<a href="${path}/admin/index.do"><span class="z">后台中心</span></a> 
       </c:if>
       <a href="${path}/user/index.do">设置</a> 
       <a href="${path}/user/logout.do">退出</a> 
      </div> 
     </c:if>	
     <c:if  test="${empty sessionScope.indexuser}">
      <a href="${path}/login/index.do">登录</a> 
      <a href="${path}/zhuc/index.do" >立即注册</a> 
     </c:if>
     </div> 
     <div id="scbar" class="qing_search cl" style="display: none;"> 
      <form id="scbar_form" method="post" action="" target="_blank"> 
       <div class="qing_search_type"> 
        <a href="javascript:;" id="scbar_type" onclick="showMenu(this.id)">搜索</a> 
       </div> 
       <div class="qing_search_txt"> 
        <input type="text" name="srchtxt" id="scbar_txt" value="请输入搜索内容" /> 
       </div> 
       <div class="qing_search_btn"> 
        <button type="submit" name="searchsubmit" id="scbar_btn" value="true"></button> 
       </div> 
      </form> 
     </div> 
    </div> 
    <div class="y qing_toptb"> 
    </div> 
   </div> 
  </div> 
  