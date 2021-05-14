<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" href="css/index.css" />


</head>

<body>
<img src="img/bgImg.jpg" class="bgImg" />
 <form action="${pageContext.request.contextPath}/add.do"
				method="post" onsubmit="return check()">
<div class="content">
	<div class="bidTitle">作业管理系统注册</div>
	<div class="logCon">
		<div class="line"><span>用户名:</span>
		<input class="bt_input" type="text" name="username" id="username"/></div>
		<div class="line"><span>密&nbsp&nbsp&nbsp&nbsp码:</span>
		<input class="bt_input" type="password" name="password" id="password" /></div>
		<input type="submit" class="logingBut"   value="注册"/>
	</div>
</div>
	</form>
<div style="text-align:center;">

</div>
<style>
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

</body>

</html>