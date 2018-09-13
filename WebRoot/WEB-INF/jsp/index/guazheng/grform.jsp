 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>提交证书-112挂证网</title>
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
 
 function isPoneAvailable() {  
     var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;  
     if (!myreg.test($("#phone").val())) {
    	 $("#phonespan").html("手机号码有误");
			$("#phonespan").show();
         return false;  
     } else {  
         return true;  
     }  
 }  
 
 function isRegType() {  
	 var regType= $('input:radio[name="regType"]:checked').val();
     if(regType==null){
         alert("请选择注册情况!");
         return false;
     }
     else{
    	 return true;
     }       
 }  
 
 function geteditorhtml(){
	 var contact=$.trim($("#contact").val());
	 if(contact==""){
		 alert("请输入真实姓名");
		 $("#contact").focus();
		 return;
	 }
	 var phone=$.trim($("#phone").val());
	 if(phone==""){
		 alert("请输入手机号码");
		 $("#phone").focus();
		 return;
	 }
	 var zsname=$.trim($("#zsname").val());
	 if(zsname==""){
		 alert("请输入证书名称");
		 $("#zsname").focus();
		 return;
	 }
	 var intor=$.trim($("#intor").val());
	 if(intor==""){
		 alert("请输入详细需求");
		 $("#intor").focus();
		 return;
	 }
	 submit();
 }
 
 function submit(){
	 if(isyanzhengma()&&isPoneAvailable()&&isRegType()){
		 var param={};
		 param.name=$.trim($("#contact").val());
		 param.phone=$.trim($("#phone").val());
		 param.zsname=$.trim($("#zsname").val());
		 param.regType=$.trim($("input[name='regType']:checked").val());
		 param.content=$.trim($("#intor").val());
		 param.yanzhengma=$.trim($("#yanzhengma").val());
		 $.ajax({
			   type: "POST",
			   url: "${path}/guakao/geren/add.do",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   var flag=data.flag;
				   var msg=data.msg;
				   if(flag=="1"){
					   alert(msg);
					   window.location.href='${path}/index.do';
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
     	<a href="${path}/guazheng/geren/add.do">快速挂证</a>
     </div> 
    </div> 
    <div class="qing_forum_second cl"> 
    <a href="javascript:;" class="pn pnc poster z" onclick="window.history.go(-1);">返回</a> 
    </div> 
   </div> 
  </div> 
 <div id="wp" class="wp"> 
   <div id="f_pst" class="bm"> 
    <div class="bm_c"> 
     <form method="post" id="form" action="${path}/guazheng/geren/addForm.do"> 
     
     <table width="960" style="border-collapse:separate; border-spacing:10px 15px;"> 
            <tbody>
            <tr id="gerenxinxi_tr">
               <td colspan="2" style="font-size: 16px; font-weight: bold; color: Black; background: #f7f7f7;">
                   		发布信息
               </td>
           </tr>
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">真实姓名:</label></th> 
              <td><input name="contact" id="contact" type="text" style="border: 1px solid #C8C8C8; height: 24px" value='' /></td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">手机号码:</label></th> 
              <td><input type="text" name="phone" id="phone" value='' style="border: 1px solid #C8C8C8; height: 24px">
              <i id="phonespan" class="p_tip" style="color:red"></i></td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">证书名称:</label></th> 
              <td><input type="text" name="zsname" id="zsname" value='' style="border: 1px solid #C8C8C8; height: 24px"/></td> 
             </tr>
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">注册情况:</label></th> 
              <td>
              	<label><input type="radio" id="zhuce1" value="1" name="regType">初始注册</label>
                <label><input type="radio" id="zhuce2" value="2" name="regType">转注册</label>
                <span></span>
			</td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">详细需求:</label></th> 
              <td>
                  <textarea name="Content" class="textarea2" rows="7" cols="60" id="intor"></textarea>
                  <span></span>
              </td> 
             </tr>
              <th><span class="rq">*</span><label for="ZODRdi">验证码:</label></th> 
              <td style="height: 56px;">
              <input style="width: 125px;margin-top: -20px;" type="text" name="yanzhengma" id="yanzhengma" class="px"  size="4" maxlength="4"  onblur="isyanzhengma();"/>
              <img src="${path}/yanzhengma/index.do" alt="验证码" height="30px;" id="yanzhengmaimg" onclick="updateyanzhengma();"/><i id="yanzhengmaspan" class="p_tip" style="color:red"></i>
              </td> 
             </tr> 
             </tr>
              <th></th> 
              <td>
              	<p class="ptm pnpost"> <button type="button"  name="topicsubmit"  class="pn pnc" onclick="geteditorhtml();"><strong>提交</strong></button> </p>
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
     </form> 
    </div> 
   </div> 
  </div>


<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>