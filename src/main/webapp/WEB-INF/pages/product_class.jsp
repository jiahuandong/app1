<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>企业进销存管理系统</title>
	<%@ include file="/WEB-INF/pages/base.jsp" %>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link rel="stylesheet" href="font-awesome/css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link href="css/sb-admin.css" rel="stylesheet">
    
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="css/morris-0.4.3.min.css">
  </head>

  <body ng-app="myApp">

    <div id="wrapper" ng-controller="Myctrl">

      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div id="page_menu">
        	<%@ include file="/WEB-INF/pages/page_menu.jsp" %>
        </div>
      </nav>
		<div class="copyrights">Collect from </div>
      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li class="active"><i class="glyphicon glyphicon-map-marker"></i> 商品管理 >> 商品分类管理</li>
            </ol>
          </div>
				</div> <!--end row-->
				<div class="row" align="center">
						<div class="input-group col-lg-5">
						    <input type="text" class="form-control input-sm"><span class="input-group-addon btn btn-success btn-sm"><i class="glyphicon glyphicon-search"></i> 商品搜索</span>
						</div>
        </div>
        <br />
        <div class="row" align="center">
        	<button type="button" class="btn btn-success btn-sm"  data-toggle="modal" data-target="#myModal-add"><span class="glyphicon glyphicon-plus-sign"></span> 添加分类</button>
        	<a type="button" class="btn btn-info btn-sm" href="product.do"><span class="glyphicon glyphicon-list"></span> 商品列表</a>
        	<a type="button" class="btn btn-warning btn-sm" href="proClass.do"><span class="fa fa-table"></span> 分类管理</a>
        </div><br />
        <div class="row">
          <div class="col-lg-12">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-money"></i> 商品分类列表</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>
                        <th>分类编号 <i class="fa fa-sort"></i></th>
                        <th>分类名称 <i class="fa fa-sort"></i></th>
                        <th>添加日期 <i class="fa fa-sort"></i></th>
                        <th>操作<i class="fa fa-sort"></i></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr valign="middle" ng-repeat="proClass in proClassList">
                        <td>{{proClass.id}}</td>
                        <td>{{proClass.className}}</td>
                        <td>{{proClass.createAt}}</td>
                        <td>
                        	<button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#myModal{{proClass.id}}"><span class="glyphicon glyphicon-edit"></span> 修改</button>
                        	<button  ng-click="delProClass(proClass.id)" type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash" ></span> 删除</button>
	                       	<!-- 分类修改 -->
	                       	<div class="modal fade" id="myModal{{proClass.id}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							    <div class="modal-dialog">
							        <div class="modal-content">
							            <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							                <h4 class="modal-title" style="font-family: '微软雅黑';" id="myModalLabel">修改商品分类信息</h4>
							            </div>
							            <div class="modal-body" style="font-family: '微软雅黑';">
							            	<form role="form">
							            		<div class="form-group">
								            	<label>分类编号</label>
								            	<input class="form-control" name="id" type="text" value="{{proClass.id}}" disabled="disabled" ng-model="proClass.id"/>
								            	</div>
								            	
							            		<div class="form-group">
								            	<label>分类名称</label>
								            	<input class="form-control" name="className" type="text" value="{{proClass.className}}" ng-model="proClass.className"/>
								            	</div>
								            	
								            	<div class="form-group">
							            	</form>
							            </div>
							            <div class="modal-footer">
							                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							                <button type="button" ng-click="updateProClass(proClass)" class="btn btn-primary">提交</button>
							            </div>
							        </div><!-- /.modal-content -->
							    </div><!-- /.modal -->
							</div>
                        </td>
                    </tbody>
                  </table>
                </div>
               <!--  <div class="text-right">
                  <a href="#">查看更多订单  <i class="fa fa-arrow-circle-right"></i></a>
                </div> -->
              </div>
            </div>
          </div>
        </div><!-- /.row -->
        <!--分页-->
        <!-- <div align="center">
					<ul class="pagination pagination-sm">
            <li class="disabled"><a href="#">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">&raquo;</a></li>
          </ul>
        </div> -->
        <!-- 添加分类 -->
		<div class="modal fade" id="myModal-add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" style="font-family: '微软雅黑';" id="myModalLabel">添加商品</h4>
		            </div>
		            <div class="modal-body" style="font-family: '微软雅黑';">
		            	<form role="form">
		            		<div class="form-group">
			            	<label>分类名称</label>
			            	<input class="form-control" name="className" type="text" placeholder="火锅类" ng-model="proClass.className"/>
			            	</div>
			            	
			            	<div class="form-group">
		            	</form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" ng-click="addProClass(proClass)" class="btn btn-primary">提交</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		
		
		
      </div><!-- /#page-wrapper -->
				
    </div><!-- /#wrapper -->
    
	
    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/angular.min.js" ></script>
    <script src="js/bootstrap.js"></script>
	
    <!-- Page Specific Plugins --> 
    <script src="js/raphael-min.js"></script>
   <!--  <script src="js/morris-0.4.3.min.js"></script>
    <script src="js/morris/chart-data-morris.js"></script> -->
    <script src="js/tablesorter/jquery.tablesorter.js"></script>
    <script src="js/tablesorter/tables.js"></script>
    <script src="layer/layer.js"></script>
	<script>
		angular.module('myApp',[])
		.controller('Myctrl',function($scope, $http){
			var loadingIndex = -1 ;
				$http({
				    method:'POST',  
				    url:'proClassList.do'
				}).then(function success(req){ 
					console.log(req.data.success);
					if(true==req.data.success){
						layer.close(loadingIndex);
						layer.msg(req.data.message, {time:1000, icon:6});
						$scope.proClassList =  req.data.proClassList;
					}

				},function error(result){
					console.info(result);  
				    alert(result.data.Message); 
				}
				);
				
				
			$scope.updateProClass = function(proClass){
				$http({
				    method:'POST',  
				    url:'updateProClass.do',  
				    data:proClass
				}).then(function success(req){ 
					console.log(req.data.success);
					if(true==req.data.success){
						layer.close(loadingIndex);
						layer.msg(req.data.message, {time:1000, icon:6});
						window.location.href="proClass.do";
					}

				},function error(result){
					console.info(result);  
				    alert(result.data.Message); 
				}
				);
			};
			
			$scope.addProClass = function(proClass){
				$http({
				    method:'POST',  
				    url:'addProClass.do',  
				    data:proClass
				}).then(function success(req){ 
					console.log(req.data.success);
					if(true==req.data.success){
						layer.close(loadingIndex);
						layer.msg(req.data.message, {time:1000, icon:6});
						window.location.href="proClass.do";
					}

				},function error(result){
					console.info(result);  
				    alert(result.data.Message); 
				}
				);
			};
			
			$scope.delProClass = function(id){
				alert(id);
				layer.confirm("确定要删除吗?",  {icon: 3, title:'提示'}, function(cindex){
					$http({
					    method:'POST',  
					    url:'delProClass.do',  
					    data:id
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							window.location.href="proClass.do";
						}

					},function error(result){
						console.info(result);  
					    alert(result.data.Message); 
					}
					);
    			    layer.close(cindex);
    			}, function(cindex){
    			    layer.close(cindex);
    			});
				
				
			};
				
				
			
			
		});
		
	</script>
  </body>
</html>
