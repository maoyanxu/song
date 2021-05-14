<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
	System.out.println(basePath);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" href="<%=basePath%>css/layui.css">
  <link rel="stylesheet" href="<%=basePath%>css/global.css">
<script src="<%=basePath%>js/layui.js"></script>
</head>
<body>
<div class="header" >
  <div class="main">
    <a  href="main.jsp"  style="margin-left: 30px;line-height: 65px; color: white;font-size: 18px;">菜鸟作业管理系统</a>
    <div class="nav">
    
    </div>
    
    <div class="nav-user">      
      <!-- 登入后的状态 -->
      
      <a class="avatar" href="edituser.action">
        <img src="<%=basePath%>images/8.jpg">
        <cite style="color: white;">用户：${USER_SESSION.user_username}</cite>
        
        <a href="${pageContext.request.contextPath }/logout.action">
			<i style="color: red;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp退出登录</i></a>
        </i>
      </a>
      <div class="nav">
        <a href="main.jsp">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
        <a href="login.jsp"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>


	<div class="main fly-user-main layui-clear">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
			
					
								
			<li class="layui-nav-item "><a href="${pageContext.request.contextPath }/listStudent.do" target="right"> <i
					class="layui-icon">&#xe612;</i> 学生管理</a></li>
						
			<li class="layui-nav-item "><a href="${pageContext.request.contextPath }/listWork.do" target="right"> <i
					class="layui-icon">&#xe611;</i> 作业管理</a></li>
				
				<li class="layui-nav-item "><a href="${pageContext.request.contextPath }/listCourse.do" target="right"> <i
					class="layui-icon">&#xe61a;</i> 课程管理 </a></li>
			<li class="layui-nav-item  "><a href="edituser.jsp" onclick="updatePwd('修改密码',2)"> <i
					class="layui-icon">&#xe620;</i> 修改密码 </a></li>
						<li class="layui-nav-item "><a href="${pageContext.request.contextPath }/homeworklist1.do" target="right"> <i
					class="layui-icon">&#xe612;</i> 批改作业</a></li>
					<li class="layui-nav-item "><a href="${pageContext.request.contextPath }/fileUpload.do" target="right"> <i
					class="layui-icon">&#xe611;</i> 发布文件</a></li>
					<li class="layui-nav-item "><a href="${pageContext.request.contextPath }/shangchuan.do" target="right"> <i
					class="layui-icon">&#xe611;</i> 资料上传</a></li>
		</ul>

		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon">&#xe602;</i>
		</div>
		<div class="site-mobile-shade"></div>

		<div class="fly-panel fly-panel-user"  >
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				
				<div class="layui-tab-content" style="padding: 20px;padding-top: 0px;">
					
    					<iframe src="newsType.jsp" width="88%" style="border: none;" height="800" border="none" name="right">
    					</iframe>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/plugs.js" ></script>
<script>
		layui.use('element', function() {
			var element = layui.element();
		});
	</script>
<script>

layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '<%=basePath%>images/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '../res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
	//添加编辑弹出层
			function updatePwd(title, id) {
				$.jq_Panel({
					title: title,
					iframeWidth: 500,
					iframeHeight: 300,
					url: "updatePwd.jsp"
				});
			}
</script>

</body>
</html>