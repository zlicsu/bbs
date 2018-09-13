<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title>证书挂靠|安全快捷-112挂证网</title> 
  <meta name="keywords" content="${bankuai.name}" /> 
  <meta name="description" content="${bankuai.descs}" /> 
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_common.css" />
  <link rel="stylesheet" type="text/css" href="${path}/css/css/style_javaee.css" /> 
  <script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
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
     	<a href="#">更多证书</a>
     </div> 
    </div> 
    <div class="qing_forum_second cl"> 
     <a href="javascript:;" class="pn pnc poster z" onclick="window.history.go(-1);">返回</a> 
    </div> 
   </div> 
  </div> 
  <div id="wp" class="wp"> 
   <div class="boardnav"> 
    <div id="ct" class="wp cl"> 
     <div class="mn"> 
      <div id="threadlist" class="tl qing_threadlist bm"> 
       <div class="cl qing_simplelist"> 
        <div id="forumnew" style="display:none"></div> 
        <form method="post"  name="moderate" id="moderate" action=""> 
         <table summary="forum_2" cellspacing="0" cellpadding="0" id="threadlisttableid"> 
          <tbody id="separatorline"> 
           <tr class="ts"> 
            <th colspan="6">
             <div class="separatorlinediv cl">
              <a href="javascript:;" title="查看更新" class="forumrefresh">证书列表</a>
             </div></th> 
           </tr> 
          </tbody>
          <tr style="background-color: #FFF; font-weight: bold;">
                        <td width="15%" class="tc">
                           	 姓名
                        </td>
                        <td width="15%" class="tc">
                            	状态
                        </td>
                        <td width="10%" class="tc">
                            	价格
                        </td>
                        <td width="11%" class="tc">
                           	 注册情况
                        </td>
                        <td width="23%">
                            	证书名称
                        </td>
                        <td width="13%">
                            	更新时间
                        </td>
                    </tr>
           
          <tbody id="normalthread_14"> 
          <c:forEach items="${page.list}" var="zhengshu">
           <tr style="background-color: #FFF" onmouseover=" this.style.backgroundColor = '#fffee5'; "
                        onmouseout=" this.style.backgroundColor = '#ffffff'; ">
                        <td class="t">
                            <span style="margin-right: 10px;">
                                <input type="checkbox" name="idli" value="60110" /></span> <a style="font-size: 14px;"
                                    href="#" target="_blank">
                                    ${zhengshu.name}</a> <span class="icoSmsTel1" title="手机已验证"></span>
                        </td>
                        <td class="tc">
                           	 闲置中
                            <span>&nbsp;</span>
                        </td>
                        <td class="tc">
                           	 面议&nbsp;
                        </td>
                        <td class="tc">
                            ${zhengshu.regType}&nbsp;
                        </td>
                        <td>
                        ${zhengshu.zsname}&nbsp;
                        </td>
                        <td class="tc">
                           ${zhengshu.createtime}
                        </td>
                    </tr>
           </c:forEach>
          </tbody> 
         </table>
        </form> 
       </div> 
      </div> 
      <div class="bm bw0 pgs cl"> 
        <div class="pg">
       <span>当前第${page.pagestart}页/总${page.totalPages}页</span>
        <c:if test="${page.pagestart!=1}">
        <a href="${path}/guakao/geren/querypage.do?pagestart=1" >首页</a>
        <a href="${path}/guakao/geren/querypage.do?pagestart=${page.pagestart-1}" >上一页</a>
        </c:if>
	         <strong>${page.pagestart}</strong>
         <c:if test="${page.pagestart!=page.totalPages}">
         <a href="${path}/guakao/geren/querypage.do?pagestart=${page.pagestart+1}" >下一页</a>
        <a href="${path}/guakao/geren/querypage.do?pagestart=${page.totalPages}" >末页</a>
         </c:if>
        </div>
      </div>
     </div> 
    </div> 
   </div> 
  </div> 
  <div class="qing_lk cl"> 
   <div id="category_lk" class="wp ptm"> 
    <ul class="x cl"> 
    <c:forEach items="${linklist}" var="link">
     <li><a href="${link.link}" target="_blank" title="${link.name}">${link.name}</a></li>
    </c:forEach>
    </ul> 
   </div> 
  </div> 
<%@ include file="/WEB-INF/inc/foot.jsp"%>

 </body>
</html>