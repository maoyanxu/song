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
<form action="${pageContext.request.contextPath}/editWork1.do" method="post">
 
            <div class="indexSearch">
               作业号查询：<input type="text" placeholder="请输入作业号" name="work_id"/>
                <input type="submit" value="搜索"/>
            </div>
            </form>
            <br>
<form action="${pageContext.request.contextPath}/editWork2.do" method="post">
 
            <div class="indexSearch">
               作业名查询：<input type="text" placeholder="请输入作业名" name="name"/>
                <input type="submit" value="搜索"/>
            </div>
            </form>
            <br>
    <table class="table table-striped table-bordered table-hover table-condensed">
 
        <caption>作业列表 - 共发布${page.total}作业</caption>
        <thead>
        <tr class="success">
            <th>作业号</th>
            <th>作业名</th>
            <th>作业内容</th>
            <th>发布日期</th>
            
            <th>查看</th>
        </tr>
        </thead>
 
        <tbody>
<c:forEach items="${works}" var="s">
            <tr>
                <td>${s.work_id}</td>
           
                <a href="${pageContext.request.contextPath}/lookhomework.do?name=${s.name}"><td>${s.name}</td></a>
                <td>${s.text}</td>
                <td>${s.date}</td>
 
                <td><a href="${pageContext.request.contextPath}/lookHomework.do?name=${s.name}">查看作业</span> </a></td>
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

 
</body>
</html>