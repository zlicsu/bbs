<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>发帖-112挂证网</title>
 <meta name="keywords" content="发帖" /> 
 <meta name="description" content="发帖" /> 
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_common.css" />
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_viewthread.css" /> 
 <link rel="stylesheet" type="text/css" href="${path}/css/css/style_javaee.css" /> 
 <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="${path}/public/baiduueditor/ueditor.all.min.js"></script>
 <script type="text/javascript" src="${path}/public/baiduueditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript">
 document.onkeydown=function(e){
	 var keycode=document.all?event.keyCode:e.which;
	 if(keycode==13)
		 submitzhuc();
};
 function isusername(){
	 var flag=false;
	 var name=$.trim($("#name").val());
	 $("#name").val(name);
	 if(name.length<6){
		 $("#namespan").html("用户长度不能小于6位");
		 $("#namespan").show();
		 return flag;
	 }else{
		 $("#namespan").hide();
	 }
	 var param={};
	 param.loginname=name;
	 $.ajax({
		   type: "POST",
		   url: "${path}/zhuc/isusername.do",
		   data: param,
		   dataType:"json",
		   async: false,
		   success: function(data){
			   if(data==0){
				   $("#namespan").html("用户名重复");
					$("#namespan").show();
					flag=false;
			   }else{
					$("#namespan").html('<p class="duihao"></p>');
					$("#namespan").show();
					flag=true;
			   }
		   }
	 });
	 return flag;
 }
 function isyanzhengma(){
	 var flag=false;
	 var yanzhengma=$.trim($("#yanzhengma").val());
	 $("#yanzhengma").val(yanzhengma);
	 if(yanzhengma.length<1){
		 $("#yanzhengmaspan").html("验证码不能为空");
		 $("#yanzhengmaspan").show();
		 return flag;
	 }else{
		 $("#yanzhengmaspan").hide();
	 }
	 var param={};
	 param.yanzhengma=yanzhengma;
	 $.ajax({
		   type: "POST",
		   url: "${path}/yanzhengma/isyanzhengma.do",
		   data: param,
		   dataType:"json",
		   async: false,
		   success: function(data){
			   if(data=="0"){
				   $("#yanzhengmaspan").html("验证码错误");
					$("#yanzhengmaspan").show();
					flag=false;
			   }else{
				   $("#yanzhengmaspan").html('<p class="duihao"></p>');
					$("#yanzhengmaspan").show();
					flag=true;
			   }
		   }
	 });
	 return flag;
 }
 function ispwd(){
	 var pwd=$.trim($("#pwd").val());
	 $("#pwd").val(pwd);
	 if(pwd.length<6){
		 $("#pwdspan").html("密码长度不能小于6位");
		 $("#pwdspan").show();
		 return false;
	 }else{
		 $("#pwdspan").html('<p class="duihao"></p>');
			$("#pwdspan").show();
		 return true;
	 }
 }
 
 function isqpwd(){
	 var pwd=$.trim($("#pwd").val());
	 var qpwd=$.trim($("#qpwd").val());
	 if(pwd!=qpwd){
		 $("#qpwdspan").html("两次密码不一致");
		 $("#qpwdspan").show();
		 return false;
	 }else{
		 $("#qpwdspan").html('<p class="duihao"></p>');
		$("#qpwdspan").show();
		 return true;
	 }
 }
 
 function submitzhuc(){
	 if(isusername()&&ispwd()&&isqpwd()&&isyanzhengma()){
		 var param={};
		 param.loginname=$.trim($("#name").val());
		 param.pwd=$.trim($("#qpwd").val());
		 param.email=$.trim($("#email").val());
		 param.yanzhengma=$.trim($("#yanzhengma").val());
		 $.ajax({
			   type: "POST",
			   url: "${path}/zhuc/add.do",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   var flag=data.flag;
				   var msg=data.msg;
				   if(flag=="1"){
					   alert(msg);
					   window.location.href='${path}/login/index.do';
				   }else{
					   alert(msg);
				   }
			   }
		 });
	 }
 }
 
 function updateyanzhengma(){
     document.getElementById('yanzhengmaimg').src= '${path}/yanzhengma/index.do?t='+new Date().getTime();
	 
 }
 
 </script>
 <script type="text/javascript">
 function sysz(){
	 var name=$("#tzname").val();
	 var length=80-name.length;
	 if(length<0)length=0;
	 $("#checklen").html(length);
 }
 $(function(){
	 UE.getEditor('myEditor');
 });
 
 function geteditorhtml(){
	 $("#editorhtml").val(UE.getEditor('myEditor').getContent());
	 $("#editortxt").val(UE.getEditor('myEditor').getContentTxt());
	 var zhutiid=$("#zhutiid").val();
	 if(zhutiid=="0"){
		 alert("请选择主题");
		 $("#zhutiid").focus();
		 return;
	 }
	 var name=$.trim($("#tzname").val());
	 if(name==""){
		 alert("请输入标题");
		 $("#tzname").focus();
		 return;
	 }
	 var editorhtml=$.trim($("#editorhtml").val());
	 if(editorhtml==""){
		 alert("请输入内容");
		 UE.getEditor('myEditor').focus();
		 return;
	 }
	 $("#form").submit();
 }
 
 
 </script>
   
</head>
 <body id="nv_forum" class="pg_index">

 <%@ include file="/WEB-INF/inc/top.jsp"%>
 <div id="wp" class="wp"></div> 
  <div class="qing_forum_thumb cl" style="background:url(${path}/css/img/banner/common_2_banner.jpg) no-repeat center top;"> 
   <div class="wp cl"> 
    <div id="pt" class="cl"> 
     <div class="z"> 
      <a href="${path}/" class="nvhm" title="首页">首页</a> 
      <em>›</em> 
     	<a href="${path}/guazheng/geren/add.do">证书提交</a>
     </div> 
    </div> 
    <div class="qing_forum_second cl"> 
    <a href="javascript:;" class="pn pnc poster z" onclick="window.history.go(-1);">返回</a> 
     <ul id="thread_types" class="qttp y cl"> 
      <li id="ttp_all" class="xw1 a"><a href="">全部<span></span></a></li> 
      <c:forEach items="${zhutilist}" var="zhuti">
	      <li><a href="${zhuti.id}">${zhuti.name}<span></span></a></li> 
      </c:forEach>
     </ul> 
    </div> 
   </div> 
  </div> 
 <div id="wp" class="wp"> 
   <div id="f_pst" class="bm"> 
    <div class="bm_c"> 
     <form method="post" id="form" action="${path}/guazheng/geren/addForm.do"> 
     
     <table> 
            <tbody>
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">姓名:</label></th> 
              <td><input type="text" name="loginname" id="name" class="px"  size="25" maxlength="15"  onblur="isusername();"/></td> 
              <td class="tipcol" colspan="3">
              <i id="namespan" class="p_tip"></i>
              </td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">电话:</label></th> 
              <td><input type="password" class="px" id="pwd"  size="25" maxlength="15"  onblur="ispwd();"/></td> 
              <td class="tipcol" colspan="3">
              <i id="pwdspan" class="p_tip"></i>
              </td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">证书名称:</label></th> 
              <td><input type="password" name="pwd" id="qpwd" class="px"  size="25" maxlength="15" onblur="isqpwd();" /></td> 
              <td class="tipcol" colspan="3">
              <i id="qpwdspan" class="p_tip"></i>
              </td> 
             </tr>
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">详细需求:</label></th> 
              <td>
              	<div class="tedt"> 
						<script id="myEditor" type="text/plain" style="width:500px;height:200px;"></script>
			    </div>
			  </td> 
              <td class="tipcol" colspan="3">
              <i id="qpwdspan" class="p_tip"></i>
              </td> 
             </tr>
             <!-- <tr>
             <div>详细需求</div>
	             <div class="cl"> 
			       <div id="fastsmiliesdiv" class="y">
			        <div id="fastsmiliesdiv_data">
			         <div id="fastsmilies"></div>
			        </div>
			       </div>
			       <div class="hasfsl" id="fastposteditor"> 
			        <div class="tedt"> 
						<script id="myEditor" type="text/plain" style="width:1000px;height:240px;"></script>
			        </div> 
			       </div> 
			      </div>
		      </tr>  
             <tr>  -->
              <th><span class="rq">*</span><label for="ZODRdi">验证码:</label></th> 
              <td style="height: 56px;">
              <input style="width: 125px;margin-top: -20px;" type="text" name="yanzhengma" id="yanzhengma" class="px"  size="4" maxlength="4"  onblur="isyanzhengma();"/>
              <img src="${path}/yanzhengma/index.do" alt="验证码" height="30px;" id="yanzhengmaimg" onclick="updateyanzhengma();"/>
              </td> 
              <td class="tipcol" colspan="3">
              <i id="yanzhengmaspan" class="p_tip"></i>
              </td> 
             </tr> 
            </tbody>
           </table>
     
     
      <!-- <div id="fastpostreturn" style="margin:-5px 0 5px"></div> 
      <div class="pbt cl"> 
       <div class="ftid"> 
        
       </div> 
       <input type="text" id="tzname" name="name" class="px" maxlength="80"  tabindex="11" style="width: 560px;" onchange="sysz();" onkeydown="sysz();" onkeyup="sysz();"/> 
       <input type="hidden" id="editorhtml" name="contenthtml"/>
       <input type="hidden" id="editortxt" name="contenttxt"/>
       <span>还可输入 <strong id="checklen">80</strong> 个字符</span> 
      </div> 
      <div class="cl"> 
       <div id="fastsmiliesdiv" class="y">
        <div id="fastsmiliesdiv_data">
         <div id="fastsmilies"></div>
        </div>
       </div>
       <div class="hasfsl" id="fastposteditor"> 
        <div class="tedt"> 
			<script id="myEditor" type="text/plain" style="width:1000px;height:240px;"></script>
        </div> 
       </div> 
      </div> --> 
      <p class="ptm pnpost"> <button type="button"  name="topicsubmit"  class="pn pnc" onclick="geteditorhtml();"><strong>发表帖子</strong></button> </p>
      <p></p> 
     </form> 
    </div> 
   </div> 
  </div>


<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>