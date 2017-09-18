<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8"> 
	<title>Bootstrap 实例 - 按钮选项</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script language="javascript">
		function checkAll(who,obj){
        	var curCheckBox = document.getElementsByName(who);
        	for(i=0;i<curCheckBox.length;i++){
	        	curCheckBox.item(i).checked = obj.checked
        	}

		}
		
		function formSubmit (url,sTarget){
		    document.forms[0].target = sTarget   //表示新跳转的页面在当前窗口打开
		    document.forms[0].action = url;      //发起请求 delete
		    document.forms[0].submit();
		    return true;
		}
	</script>
</head>
<body>
<hr>
<hr>
<form name="icform" method="post">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<div class="row clearfix">
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-success" onclick="formSubmit('toview','_self');this.blur();">查看</button>
				</div>
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-warning" onclick="formSubmit('tocreate','_self');this.blur();">新增</button>
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
							<input type="checkbox" name="selid" onclick="checkAll('orderInfoId',this)"/>
						<th>
							序号
						</th>
						<th>
							订单号
						</th>
						<th>
							货品名称
						</th>
						<th>
							寄件地址
						</th>
						<th>
							收件地址
						</th>
						<th>
							收件人手机号
						</th>
						<th>
							是否签收 
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderInfoList}" var="o" varStatus="status">
					
					<tr <c:if test="${o.order.state==1}">class="success"</c:if>
						<c:if test="${o.order.state==0}">class="warning"</c:if>
					>
						<td><input type="checkbox" name="orderInfoId" value="${o.orderInfoId}"/></td>
						<td>
							${status.index+1}
						</td>
						<td>
							${o.orderInfoId}
						</td>
						<td>
							${o.cargoName}
						</td>
						<td>
							${o.sendAddress}
						</td>
						<td>
							${o.receiveAddress}
						</td>
						<td>
							${o.receiveTel}
						</td>
						<td>
							<c:if test="${o.order.state==1}">已签收</c:if>
							<c:if test="${o.order.state==0}">未签收</c:if>
						</td>
					</tr>
					</c:forEach>
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
