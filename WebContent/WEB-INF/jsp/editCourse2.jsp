<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
            <h3 class="panel-title">确认课程</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/updateCourse2.do" role="form">
                <table class="editTable">
                    <tr>
                        <td>课程号：</td>
                        <td><input type="text" name="course_id" id="course_id" readonly=”true” value="${course.course_id}"
                                   placeholder="请在这里输入课程号">
                                   <font color="red" >不可修改</font></td>
                     
                    </tr>
                    <tr>
                        <td>课程名：</td>
                        <td><input type="text" name="name" id="name" readonly=”true” value="${course.name}" placeholder="请在这里输入名字">
                          <font color="red" >不可修改</font></td>
                  
                    </tr>
                    <tr>
                        <td>任课老师：</td>
                        <td><input type="text" name="teacher" id="teacher" readonly=”true” value="${course.teacher}"
                                   placeholder="请在这里输入教师名">
                                   <font color="red" >不可修改</font></td>
                         
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${course.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                            <a href="${pageContext.request.contextPath }/listCourse1.do"><button class="btn btn-success">返 回</button><a/>
                        </td>
 
                    </tr>
 
                </table>
            </form>
        </div>
    </div>
 
</div>
 
</body>
</html>
