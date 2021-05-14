<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
	System.out.println(basePath);
%>
<html>
<head>
 
  <%-- 引入JQ和Bootstrap --%>
    <script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
 
    <title>课程发布页面 - 首页</title>
 
    <script>
    function del() {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
        });
    </script>
</head>
 
<body>

<div class="addDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">再次确认提交文件名称:</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath}/addWork2.do" role="form"style="width:600px; height:800px;">
                <table class="addTable">
                    <tr>
                    </tr>
                    <tr>
                        <td>作业名：</td>
                        <td><input type="text" name="name" id="name" readonly=”true” value="${msg2}"></td>
                    </tr>
                 <tr><br> <br> <br>
                    </tr><tr>
                    </tr>
                  
                    <tr class="submitTR">
                        <td colspan="2" align="center">
<!--                             <button type="submit" class="btn btn-success">提 交</button> -->
							<input type="submit" value="提交" />
                        </td>
 
                    </tr>
 
                </table>
            </form>
        </div>
    </div>
 
</div>
 
 
</body>
</html>
