<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
    
        <title>物流信息查询</title>

        <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap-theme.min.css">

        <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    
        <style>
            .bs-docs-home
            {
            background-color: #1B31B1;
            background-image: url(line.png);
            }
            .active:hover{
	            color: red;
            }
            .success:hover{
	            color: red;
            }
    	</style>
</head>

<body class="bs-docs-home">
    <div class="container theme-showcase">
        <h1 style=" line-height:2em;"> </h1><br />
      
        <div class="row">
            <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>物流信息查询（请输入快递单号或收件人手机号码进行查询）</strong></h3>
                </div>
                <div class="panel-body">
                   
              
                       <form method="post" role="form" name="form1" action="${pageContext.request.contextPath}/findOrderByOrderInfoId">

                           <div class="form-group">
                               <label for="IDCard">请输如快递订单号</label>
                               <div class="input-group">
                                   <input type="text" class="form-control" id="orderInfoId" name="orderInfoId" placeholder="请输如快递订单号" value="${orderInfoId}">
                                   <span class="input-group-btn">
                                       <button class="btn btn-default" type="button" onClick="form1.submit();" >查询</button>
                                   </span>
                               </div>
                           </div>
       					</form>
       					<form method="post" role="form" name="form2" action="${pageContext.request.contextPath}/findOrderByReceiveTel">
                           <div class="form-group">
                               <label for="IDCard">请输入您要查询的手机号</label>
                               <div class="input-group">
                                   <input type="text" class="form-control" id="receiveTel" name="receiveTel" placeholder="请输入您要查询的手机号" value="${receiveTel}" >
                                   <span class="input-group-btn">
                                       <button class="btn btn-default" type="button" onClick="form2.submit();" >查询</button>
                                   </span>
                               </div>
                           </div>
      
                       </form>
           
                       <div class="alert alert-danger alert-dismissable">
                           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                           <strong>注意!</strong> 没有查到信息请检查快递单号或手机号是否有误！有任何疑问请致电400800XXXX
                       </div> 
            
                       <div class="table-responsive">
                           <table  border="0" cellspacing="0" cellpadding="0" class="table">
                               <tr class=" label-primary">
                                   <th scope="col"><span style="color:white">订单号</span></th>
                                   <th scope="col"><span style="color:white">手机号</span></th>
                                   <th scope="col"><span style="color:white">始发地</span></th>
                                   <th scope="col"><span style="color:white">目的地</span></th>
                                   <th scope="col"><span style="color:white">签收状态</span></th>
                               </tr>
                               <c:forEach items="${orderInfoList}" var="orderInfo">
                               <tr class="active">
                               	   <td>${orderInfo.orderInfoId}</td>
                                   <td>${orderInfo.receiveTel}</td>
                                   <td>${orderInfo.sendAddress}</td>
                                   <td>${orderInfo.receiveAddress}</td>
                                   <td>
                                   <c:if test="${orderInfo.order.state==1}">已签收</c:if>
                                   <c:if test="${orderInfo.order.state==0}">未签收</c:if>
                                   </td>
                                </tr>
                               </c:forEach>
                               
                               
                               
                               <!-- <tr class="active">
                                   <td>11111111111111111111</td>
                                   <td>18080808080</td>
                                   <td>杭州</td>
                                   <td>北京</td>
                                   <td>未签收</td>
                               </tr>
                               <tr class="success" >
                                   <td>22222222222222222222</td>
                                   <td>18080808080</td>
                                   <td>杭州</td>
                                   <td>北京</td>
                                   <td                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            表示                                      >已签收</td>
                               </tr> -->

                           </table>
                       </div>         
                   </div>
               </div>
           </div>
     
           <div class="col-sm-2"></div>
        </div>
    </div> 
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
</body>
</html>