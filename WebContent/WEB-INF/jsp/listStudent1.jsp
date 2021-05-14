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
 
    <title>学生管理页面 - 首页</title>
 
    <script>
    $(function () {
        $("ul.pagination li.disabled a").click(function () {
            return false;
        });
        $("#addForm").submit(function () {
            if (!checkEmpty("student_id", "学号"))
                return false;
            if (!checkEmpty("name", "姓名"))
                return false;
            if (!checkEmpty("age", "年龄"))
                return false;
            return true;
        });
    });
    function del() {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
    function checkEmpty(id, name) {
        var value = $("#" + id).val();
        if (value.length == 0) {
            alert(name + "不能为空");
            $("#" + id).focus();
            return false;
        }
        return true;
    }
    </script>
</head>
 
<body>
<div class="listDIV">
 <form action="${pageContext.request.contextPath}/editStudent2.do" method="post">
 
            <div class="indexSearch">
               学号查询：<input type="text" placeholder="请输入学号" name="student_id"/>
                <input type="submit" value="搜索"/>
            </div>
            </form>
            <br>
 <form action="${pageContext.request.contextPath}/editStudent1.do" method="post">
 
            <div class="indexSearch">
                姓名查询：<input type="text" placeholder="请输入姓名" name="name"/>
                <input type="submit" value="搜索"/>
            </div>
            </form>
 <br> <br> 

    <table class="table table-striped table-bordered table-hover table-condensed">
 
        <caption>学生列表 - 共${page.total}人</caption>
        <thead>
        <tr class="success">
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>入学日期</th>
 
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
 
        <tbody>
<c:forEach items="${students}" var="s">
            <tr>
                <td>${s.student_id}</td>
                <td>${s.name}</td>
                <td>${s.age}</td>
                <td>${s.sex}</td>
                <td>${s.birthday}</td>
 
                <td><a href="/cainiao/editStudent.do?id=${s.id}" >修改</span> </a></td>
                <td><a href="/cainiao/deleteStudent.do?id=${s.id}"onclick="javascript:return del();">删除 </a></td>
            </tr>
        </c:forEach>



        </tbody>
    </table>
</div>
 <table border="2" bordercolor="#99ccff" cellspacing="5" cellpadding="5" align="center" width="40%">
 
<nav class="pageDIV">
<tr>
       <th> <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=0">
                <span>«</span>
            </a>
        </li></th>
 
        <th><li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=${page.start-page.count}">
                <span>‹</span>
            </a>
        </li></th>
 
        <th><c:forEach begin="0" end="${page.totalPage+3}" varStatus="status">
 
            <th><c:if test="${status.count*page.count-page.start<=50 && status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if></th>
        </c:forEach></th>
 
        <th><li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.start+page.count}">
                <span>›</span>
            </a>
        </li></th>
       <th> <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.last}">
                <span>»</span>
            </a>
        </li></th>
     </tr>
</nav>
 </table>
 <br><br><br><br><br>
<div class="addDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">增加学生</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" id="addForm"action="${pageContext.request.contextPath}/addStudent.do" role="form">
                <table class="addTable">
                    <tr>
                        <td>学号：</td>
                        <td><input type="text" name="student_id" id="student_id" placeholder="请在这里输入学号"></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" id="name" placeholder="请在这里输入名字"></td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input type="text" name="age" id="age" placeholder="请在这里输入年龄"></td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td><input type="radio" class="radio radio-inline" name="sex" value="男"> 男
                            <input type="radio" class="radio radio-inline" name="sex" value="女"> 女
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期：</td>
                        <td><input type="date" name="birthday" id="birthday" placeholder="请在这里输入出生日期"></td>
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