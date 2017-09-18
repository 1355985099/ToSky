<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>订单列表</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
<hr>
<hr>
<form method="post" >
<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<div class="row clearfix">
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-success" onclick="">查看</button>
				</div>
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-warning">新增</button>
				</div>
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-info btn-default active">修改</button>
				</div>
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-danger">删除</button>
				</div>
				<div class="col-md-8 column">
				</div>
			</div>
			<hr>
			<hr>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>
							<td>选择</td>
						<th>
							编号
						</th>
						<th>
							产品
						</th>
						<th>
							交付时间
						</th>
						<th>
							状态
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="orderId"/></td>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
					</tr>
					<tr class="success">
						<td><input type="checkbox" name="orderId"/></td>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr class="error">
						<td><input type="checkbox" name="orderId"/></td>
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr class="warning">
						<td><input type="checkbox" name="orderId"/></td>
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
					</tr>
					<tr class="info">
						<td><input type="checkbox" name="orderId"/></td>
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-1 column">
		</div>
	</div>
</div>
</form>
</body>
</html>
