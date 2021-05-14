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
        var msg = "您真的确定要选择此课程吗？\n\n请确认！";
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
<form action="${pageContext.request.contextPath}/editCourse3.do" method="post">
            <div class="indexSearch">
               课程号查询：<input type="text" placeholder="请输入课程号" name="course_id"/>
                <input type="submit" value="搜索"/>
            </div>
            </form>
            <br>
 <form action="${pageContext.request.contextPath}/editCourse1.do" method="post">
 
            <div class="indexSearch">
                课程名查询：<input type="text" placeholder="请输入名字" name="name"/>
                <input type="submit" value="搜索"/>
            </div>
            </form><br>
 <form action="${pageContext.request.contextPath}/editCourse2.do" method="post">
 
            <div class="indexSearch">
                教师名查询：<input type="text" placeholder="请输入任课教师" name="teacher"/>
                <input type="submit" value="搜索"/>
            </div>
            </form>
            <br>
    <table class="table table-striped table-bordered table-hover table-condensed">
 
        <caption>课程列表 - 共${page.total}门课</caption>
        <thead>
        <tr class="success">
            <th>课程号</th>
            <th>课程名</th>
            <th>教师</th>
            
            <th>选择</th>
        </tr>
        </thead>
 
        <tbody>
<c:forEach items="${courses}" var="s">
            <tr>
                <td>${s.course_id}</td>
           
                <td>${s.name}</td>
                <td>${s.teacher}</td>
                 <td><a href="/cainiao/editCourse4.do?id=${s.id}"onclick="javascript:return del();">选修 </a></td>
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
            <h3 class="panel-title">增加课程</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath}/addCourse.do" role="form">
                <table class="addTable">
                    <tr>
                        <td>课程号：</td>
                        <td><input type="text" name="course_id" id="course_id" placeholder="请在这里输入课程号"></td>
                    </tr>
                    <tr>
                        <td>课程名：</td>
                        <td><input type="text" name="name" id="name" placeholder="请在这里输入名字"></td>
                    </tr>
                    <tr>
                        <td>教师名：</td>
                        <td><input type="text" name="teacher" id="teacher" placeholder="请在这里输入名字"></td>
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