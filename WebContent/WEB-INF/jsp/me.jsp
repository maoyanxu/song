
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
 
    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
 
    <title>学生修改页面 - 修改页面</title>
</head>

<body>
 
<div class="editDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading" >
            <h3 class="panel-title">个人信息</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/me.do" role="form">
                <table class="editTable">
                    <tr>
                        <td>姓名：${stu_SESSION.name}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>学号：${stu_SESSION.student_id}</td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>年龄：${stu_SESSION.age}</td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>性别：${stu_SESSION.sex}</td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期：${stu_SESSION.birthday}</td>
                        <td>
                        </td>
                    </tr>
                 
               
                  
 
                </table>
            </form>
        </div>
    </div>
 
</div>
 
</body>
</html>
