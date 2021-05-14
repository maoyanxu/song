<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
	System.out.println(basePath);
%>
<!DOCTYPE HTML >

<HTML>
<head>
<TITLE>登录 </TITLE>  

<LINK href="<%=basePath%>js/reset.css" rel="stylesheet" type="text/css">  
<LINK href="<%=basePath%>js/signin.css" rel="stylesheet" type="text/css">
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<script>

// 判断是登录账号和密码是否为空
function check(){
// 	if(document.form1.user[0].checked){
//         document.form1.action="${pageContext.request.contextPath }/login1.action"
//     }else{
//         document.form1.action="${pageContext.request.contextPath }/login.action"
//     }
//     document.form1.submit();
    var username = $("#username").val();
    var password = $("#password").val();
    if(username=="" || password==""){
    	$("#message").text("用户名或密码不能为空！");
        return false;
    }  
    return true;
}
</script>
</head> 
<BODY>

<div class="signin-bg"></div>

<div class="signin-container">

	<div style="margin: 170px 0px 30px 45px;">
		<div style="width: 340px; float: left; display: inline-block;">
			<div style="margin-bottom:8px;"><a href=""><IMG style="width: 200px;" src="<%=basePath%>img/title.png" border="0"></A></div>
			
			
			 <fieldset style="width: auto; margin: 0px auto;">
		 
		
			<FORM  action="${pageContext.request.contextPath }/login.action"  method="post" onsubmit="return check()">
			
				<input type="radio" name="user" checked="checked"  value="1"/>学生
				<input type="radio" name="user" value="0"/>教师
				<div style="margin-top: 25px;"><input id="username" class="signin-txt" type="text" name="username" placeholder="用户名" /></div>
				<div style="margin-top: 20px;"><input name="password" class="signin-txt" id="password" type="password" placeholder="密码" ></div>
				<div style="margin-top: 20px;">
					<font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font><br><br>
					<input class="button default signin-btn" type="submit" value="立即登录" />	
				</div>
				<div style="color: rgb(34, 34, 34); margin-top:100px;">还没有账户？您可以在此&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;<A  class="button default signin-btn1" style="color: rgb(228, 87, 61);" href="register.jsp">注册</A></div>
			</FORM>
			
			 </fieldset>
		</div>
		<div class="clear"></div>
	</div>
	
</div>

</BODY>
</HTML>
    