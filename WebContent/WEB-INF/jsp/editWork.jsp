
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
 
    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
 
    <title>课程修改页面 - 修改页面</title>
</head>
 
<body>
 
<div class="editDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">修改作业</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/updateWork.do" role="form">
                <table class="editTable">
                    <tr>
                        <td>作业号：</td>
                        <td><input type="text" name="work_id" id="work_id" value="${work.work_id}"
                                   placeholder="请在这里输入作业号"></td>
                    </tr>
                    <tr>
                        <td>作业名：</td>
                        <td><input type="text" name="name" id="name" value="${work.name}" placeholder="请在这里输入名字">
                        </td>
                    </tr>
                    <tr>
                        <td>作业内容：</td>
                        <td><input type="text" name="text" id="text" value="${work.text}" placeholder="请在这里输入内容"></td>
                    </tr>
                   
                    <tr>
                        <td>发布日期：</td>
                        <td><input type="date" name="date" id="date" value="${work.date}"
                                   placeholder="请在这里输入发布日期"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${work.id}">
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
