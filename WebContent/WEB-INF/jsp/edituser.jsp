<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(basePath);
%>
<!DOCTYPE html>

<html>
<head>

<%-- 引入JQ和Bootstrap --%>
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<link href="<%=basePath%>css/style.css" rel="stylesheet">
<style>
body{background:url(img/1.gif) top left;
background-size:100%;}
</style>
<title>学生管理页面-编辑页面</title>
</head>

<body >

	<div class="editDIV">

		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">修改个人信息</h3>
			</div>
			<div class="panel-body">

				<form method="post" action="${pageContext.request.contextPath }/updateUser.action" role="form">
					<table class="editTable">

						<tr>
							<td>姓名：</td>
							<td><input type="text" name="user_username" id="username"
								value="${user_username}" placeholder="请在这里输入名字"></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="text" name="user_password" id="password"
								value="${user_password}" placeholder="请在这里输入密码"></td>
						</tr>



						<tr class="submitTR">
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-success">提 交</button>
							</td>

						</tr>

					</table>
				</form>
			</div>
		</div>

	</div>

</body>
</html>
