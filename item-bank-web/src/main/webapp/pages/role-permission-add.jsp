<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>数据后台管理 - 角色</title>
		<meta name="description" content="角色">
		<meta name="keywords" content="角色">

		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

		<!-- 引入css -->
		<jsp:include page="common/css.jsp"></jsp:include>
		<!-- 引入css /-->
	</head>

<body class="hold-transition skin-purple sidebar-mini" style="overflow:scroll;overflow-x:hidden">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="common/header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="common/aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				角色管理 <small>添加权限资源表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/role/list/1/5">角色管理</a></li>
				<li class="active">添加权限资源表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form
				action="${pageContext.request.contextPath}/role/addPermissionToRole"
				method="post">
				<!-- 正文区域 -->
				<section class="content">
                    <input type="hidden" name="roleId" value="${role.id}">
					<table id="dataList"
							class="table table-bordered table-striped table-hover dataTable">
							<thead>
								<tr>
									<th class="" style="padding-right: 0px">
									<input id="selall" 
										type="checkbox" class="icheckbox_square-blue"></th>
									<th class="sorting_asc">ID</th>
									<th class="sorting">权限名称</th>
									<th class="sorting">URL</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${permissionList}" var="permission">
									<tr>
										<td><input name="ids" type="checkbox" value="${permission.id}"></td>
										<td>${permission.id}</td>
										<td>${permission.permissionName }</td>
										<td>${permission.url}</td>
										
									</tr>
								</c:forEach>
							</tbody>

						</table>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
			</form>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<jsp:include page="common/footer.jsp"></jsp:include>
		<!-- 底部导航 /-->

	</div>
</body>
	<!-- 引入js -->
	<jsp:include page="common/js.jsp"></jsp:include>
	<!-- 引入js /-->
</html>