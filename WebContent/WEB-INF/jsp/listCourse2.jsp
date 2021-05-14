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

 
<div class="listDIV">
<font color="blue"><h1>我的课表:</h1></font>
            <br>
    <table class="table table-striped table-bordered table-hover table-condensed">
 
        <caption>课程列表 - 共有${page.total}门课</caption>
        <thead>
        <tr class="success">
            <th>课程号</th>
            <th>课程名</th>
            <th>教师</th>
            
        </tr>
        </thead>
 
        <tbody>
<c:forEach items="${courses}" var="s">
            <tr>
                <td>${s.course_id}</td>
           
                <td>${s.name}</td>
                <td>${s.teacher}</td>
 
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

 
 
</body>
</html>