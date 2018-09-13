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
 
 
 function geteditorhtml(){
	 var name=$.trim($("#company").val());
	 if(contact==""){
		 alert("请输入企业名称");
		 $("#company").focus();
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
	 if(isyanzhengma()&&isPoneAvailable()){
		 var param={};
		 param.name=$.trim($("#company").val());
		 param.phone=$.trim($("#phone").val());
		 param.zsname=$.trim($("#zsname").val());
		 param.number=$.trim($("#number").val());
		 param.price=$.trim($("#price").val());
		 param.address=$.trim($("#address").val());
		 param.content=$.trim($("#intor").val());
		 param.yanzhengma=$.trim($("#yanzhengma").val());
		 $.ajax({
			   type: "POST",
			   url: "${path}/guakao/qiye/add.do",
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
              <th><span class="rq">*</span><label for="ZODRdi">公司名称:</label></th> 
              <td><input name="company" id="company" type="text" style="border: 1px solid #C8C8C8; height: 24px" value='' /></td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">手机号码:</label></th> 
              <td><input type="text" name="phone" id="phone" value='' style="border: 1px solid #C8C8C8; height: 24px">
              <i id="phonespan" class="p_tip" style="color:red"></i></td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">所需证书:</label></th> 
              <td><input type="text" name="zsname" id="zsname" value='' style="border: 1px solid #C8C8C8; height: 24px"/></td> 
             </tr>
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">数量:</label></th> 
              	<td>
              	<input type="text" name="number" id="number" value='' style="border: 1px solid #C8C8C8; height: 24px"/>本
				</td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">价格:</label></th> 
              	<td>
              	<input type="text" name="price" id="price" value='' style="border: 1px solid #C8C8C8; height: 24px"/>元/年
				</td> 
             </tr> 
             <tr> 
              <th><span class="rq">*</span><label for="ZODRdi">地区:</label></th> 
              	<td>
              	<input type="text" name="address" id="address" value='' style="border: 1px solid #C8C8C8; height: 24px"/>省
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
     </form> 
    </div> 
   </div> 
  </div>


<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>