<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="../../commons/head.jsp" %>
<%@ include file="../../commons/js.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>修改新闻</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
.STYLE2 {font-size: x-large}
</STYLE>

<style type="text/css" media="all"> 
body,div{font-size:12px;}
</style> 

<META content="MSHTML 6.00.2900.5848" name=GENERATOR>

<script type="text/javascript">
	$(document).ready(function(){
$.formValidator.initConfig({formid:"form1",onError:function(){alert("具体错误请看提示!")}});
		//点击获取脚本按钮，获取校验代码
$("#userName").formValidator({onshow:"请输入用户名",onfocus:"用户名不能为空",oncorrect:"用户名合法"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"用户名两边不能有空符号"},onerror:"用户名不能为空,请确认"}).ajaxValidator({
	    type : "get",
		url : "${ctx}/manage/user/checkUserName.do",
		datatype : "json",
		success : function(data){	
            if( data == "0" )
			{		
                return true;
			}
            else
			{
                return false;
			}
		},	
		error: function(){alert("服务器没有返回数据，可能服务器忙，请重试");},
		onerror : "该用户名不可用，请更换用户名",
		onwait : "正在对用户名进行合法性校验，请稍候..."
	});

$("#password1").formValidator({onshow:"请输入密码",onfocus:"密码不能为空",oncorrect:"密码合法"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"密码两边不能有空符号"},onerror:"密码不能为空,请确认"});

$("#password2").formValidator({onshow:"请输入重复密码",onfocus:"两次密码必须一致哦",oncorrect:"密码一致"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"重复密码两边不能有空符号"},onerror:"重复密码不能为空,请确认"}).compareValidator({desid:"password1",operateor:"=",onerror:"2次密码不一致,请确认"});

$("input:radio[name='sex']").formValidator({tipid:"sexTip",onshow:"请选择你的性别",onfocus:"没有第三种性别了，你选一个吧",oncorrect:"输入正确",defaultvalue:[1]}).inputValidator({min:1,max:1,onerror:"性别忘记选了,请确认"});//.defaultPassed();

$("#email").formValidator({onshow:"请输入邮箱",onfocus:"邮箱6-100个字符,输入正确了才能离开焦点",oncorrect:"恭喜你,你输对了",defaultvalue:"@",forcevalid:true}).inputValidator({min:6,max:100,onerror:"你输入的邮箱长度非法,请确认"}).regexValidator({regexp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onerror:"你输入的邮箱格式不正确"});

$("#content").formValidator({onshow:"请输入你的描述",onfocus:"描述至少要输入10个汉字或20个字符",oncorrect:"恭喜你,你输对了",defaultvalue:"这家伙很懒，什么都没有留下。"}).inputValidator({min:20,onerror:"你输入的描述长度不正确,请确认"});	


$("#qq").formValidator({empty:true,onempty:"你真的不想留下QQ号码吗？",onshow:"请输入你的QQ号码",onfocus:"请输入至少5位的QQ号码"}).InputValidator({min:5,max:12,onerror:"你输入的QQ号码长度错误"});	


});	

</script>
	

</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="${ctx }/manage/index/Left.files/bg_left_tl.gif"></TD>
      <TD 
    style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(../images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">新闻资料</TD>
      <TD width=10><IMG src="${ctx }/manage/index/Left.files/bg_left_tr.gif"></TD>
    </TR>
    <TR>
      <TD colspan="3"  style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" 
    vAlign=top>
      <form name="form1" id="form1" method="post" action="${ctx }/manage/news/update.do">
        <table width="591" height="433" border="0" align="center">
          <tr>
            <td colspan="3"><div align="center"><span class="STYLE2">修改新闻</span></div></td>
            </tr>
          <tr>
          <input type="hidden" value="${news.id }"/>"
            <td width="101" align="right">标题:</td> 
     	 <td width="120"><input type="text" id="title" name="title" style="width:120px" value="${news.title }" /></td> 
     		 <td width="342"><div id="titleTip" style="width:250px"></div></td> 
          </tr>
          <tr>
		  <td align="right">类型:</td> 
     	 <td><input type="text" id="type" name="type" style="width:120px" value="${news.type }"/></td> 
     	 <td><div id="typeTip" style="width:250px"></div></td> 
		</tr>
          <tr>
         <td align="right">状态:</td> 
	     <td>
			<select name="status">
				<option <c:if test="${news.status eq '上线' }">selected</c:if> value="上线">上线</option>
				<option <c:if test="${news.status eq '下线' }">selected</c:if> value="下线">下线</option>
			</select>
		</td> 
     	  <td><div id="statusTip" style="width:250px"></div></td>
          </tr>
          <tr>
            <td align="right">用户名:</td> 
    	    <td>
				<select name="userId"><c:forEach var="user" items="${userList }">
						<option <c:if test="${news.user.userName eq user.userName }">selected</c:if>
							 value="${user.id }">${user.userName }</option>
				</c:forEach></select>
			</td> 
     	    <td><div id="userNameTip" style="width:250px"></div></td> 
          </tr>
          <tr>
            <td align="right">公司名:</td>
            <td>
				<select name="complanyId"><c:forEach var="complany" items="${comlanyList }">
						<option <c:if test="${news.complany.name eq complany.name }">selected</c:if>
							 value="${complany.id }">${complany.name }</option>
				</c:forEach></select>
			</td> 
     	    <td><div id="complanyNameip" style="width:250px"></div></td> 
          </tr>
          <tr>
            <td align="right">详细内容:</td>
            <td><textarea rows="10" cols="30" id="detail" name="detail" style="width:260px">${news.detail }</textarea></td> 
     	    <td><div id="complanyNameip" style="width:250px"></div></td> 
          </tr>
          <tr>
            <td align="right">发布时间:</td>
            <td><input type="text" id="createtime" name="createtime" style="width:120px" value="${news.createtime }"/></td> 
     	    <td><div id="createtimeTip" style="width:250px"></div></td> 
          </tr>
          <tr>
            <td align="right">排列序号:</td>
            <td><input type="text" id="orders" name="orders" style="width:120px" value="${news.orders }"/></td> 
     	    <td><div id="ordersTip" style="width:250px"></div></td> 
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="button" id="button" value="提交" /> </td>
            <td>&nbsp;</td>
          </tr>
  
        </table>
            </form>
      </TD>  
    </TR>
         <TR>
      <TD width=10><IMG src="${ctx }/manage/index/Left.files/bg_left_bl.gif"></TD>
      <TD style="BACKGROUND-IMAGE: url(../images/bg_left_bc.gif)"></TD>
      <TD width=10><IMG 
src="${ctx }/manage/index/Left.files/bg_left_br.gif"></TD>
    </TR>
      
  </TBODY>

</TABLE>

</BODY>
</HTML>
