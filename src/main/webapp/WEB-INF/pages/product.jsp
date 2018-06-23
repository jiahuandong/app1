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
              <li class="active"><i class="glyphicon glyphicon-map-marker"></i> 商品管理 >> 商品管理</li>
            </ol>
          </div>
		</div> <!--end row-->
		
		<div class="row" align="center">
			<div class="input-group col-lg-5">
			    <input placeholder="请输入要搜索的商品" name="name" type="test" class="form-control input-sm" ng-model="searchProName"><span ng-click="searchPro('',searchProName)" class="input-group-addon btn btn-success btn-sm"><i class="glyphicon glyphicon-search"></i> 商品搜索</span>
			</div>
        </div>	
        <br />
        <div class="row" align="center">
        	 <div class="btn-group">
                  <button type="button" class="btn btn-default">分类选择</button>
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                  <ul class="dropdown-menu">
                    <li><a ng-click="searchPro(proClass.id,'')" ng-repeat="proClass in proClassList" value = "{{proClass.id}}">{{proClass.className}}</a></li>
                  </ul>
            </div><!-- /btn-group -->
        	<button type="button" class="btn btn-success btn-sm"  data-toggle="modal" data-target="#myModal-add"><span class="glyphicon glyphicon-plus-sign"></span> 添加商品</button>
        	<a type="button" class="btn btn-info btn-sm" href="product.do"><span class="glyphicon glyphicon-list"></span> 商品列表</a>
        	<a type="button" class="btn btn-warning btn-sm" href="proClass.do"><span class="fa fa-table"></span> 分类管理</a>
        </div><br />
        <div class="row">
          <div class="col-lg-12">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-money"></i> 商品列表</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>
                        <th>商品编号 <i class="fa fa-sort"></i></th>
                        <th>规格名称 <i class="fa fa-sort"></i></th>
                        <th>商品价格 <i class="fa fa-sort"></i></th>
                        <th>商品规格 <i class="fa fa-sort"></i></th>
                        <th>商品分类 <i class="fa fa-sort"></i></th>
                        <th>创建时间 <i class="fa fa-sort"></i></th>
                        <th>备注 <i class="fa fa-sort"></i></th>
                        <th>操作<i class="fa fa-sort"></i></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr valign="middle" ng-repeat="product in productList">
                        <td>{{product.id}}</td>
                        <td>{{product.name}}</td>
                        <td>{{product.price}}</td>
                        <td>{{product.model}}</td>
                        <td>{{product.className}}</td>
                        <td>{{product.createAt}}</td>
                        <td>{{product.comment}}</td>
                        <td>
                        	<button type="button" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#updatePro{{product.id}}"><span class="glyphicon glyphicon-edit"></span> 修改</button>
                        	<button ng-click="delProduct(product)" type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> 删除</button>
                        	<!-- 模态框（Modal）修改商品 -->
	                     	<div class="modal fade" id="updatePro{{product.id}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							    <div class="modal-dialog">
							        <div class="modal-content">
							            <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							                <h4 class="modal-title" style="font-family: '微软雅黑';" id="myModalLabel">添加商品</h4>
							            </div>
							            <div class="modal-body" style="font-family: '微软雅黑';">
							            	<form role="form">
							            		<div class="form-group">
								            	<label>商品名称</label>
								            	<input class="form-control" name="name" type="text" placeholder="例：火锅鸡" ng-model="product.name"/>
								            	</div>
								            	
								            	<div class="form-group">
								            	<label>商品类别</label>
								            		<select name="proClassId" class="form-control" ng-model="product.proClassId">
								            		 <!-- <option value="" disabled selected hidden>请选择分类</option> -->
									                   <option ng-repeat= "proClass in proClassList" value = "{{proClass.id}}">
									                   {{proClass.className}}
									                   </option>
									                </select>
								            	</div>
								            	
								            	<div class="form-group">
								            	<label>商品规格</label>
								            	<input class="form-control" name="model" type="text" placeholder="例：小锅" ng-model="product.model"/>
								            	</div>
								            	
								            	<div class="form-group">
								            	<label>商品价格</label>
								            	<input class="form-control" name="price" type="text" placeholder="例：88" ng-model="product.price"/>
								            	</div>
								            	
								            	<div class="form-group">
								            	<label>备注</label>
								            	<input class="form-control" name="comment" type="text" placeholder="例：主打产品" ng-model="product.comment"/>
								            	</div>
								            	
							            	</form>
							            </div>
							            <div class="modal-footer">
							                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							                <button ng-click="updateProduct(product)" type="button" class="btn btn-primary">提交</button>
							            </div>
							        </div><!-- /.modal-content -->
							    </div><!-- /.modal -->
							</div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div><!-- /.row -->
        <!--分页-->
       <!--  <div align="center">
			<ul class="pagination pagination-sm">
	            <li ng-class="{disabled:currentPage==1}"><a ng-click="proPageList(currentPage-1,'','')">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li ng-repeat="num in numList" ng-class="{'active':num==currentPage}"><a ng-click="proPageList(num,'','')">{{num}}</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li ng-class="{disabled:currentPage==totalPage}"><a ng-click="proPageList(currentPage+1,'','')">&raquo;</a></li>
	        </ul>
        </div> -->
        
        <!-- 模态框（Modal）添加商品 -->
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
			            	<label>商品名称</label>
			            	<input class="form-control" name="name" type="text" placeholder="例：火锅鸡" ng-model="product.name"/>
			            	</div>
			            	
			            	<div class="form-group">
			            	<label>商品类别</label>
			            		<select name="proClassId" class="form-control" ng-model="product.proClassId">
			            		 <option value="" disabled selected hidden>请选择分类</option>
				                   <option ng-repeat= "proClass in proClassList" value = "{{proClass.id}}">
				                   {{proClass.className}}
				                   </option>
				                </select>
			            	</div>
			            	
			            	<div class="form-group">
			            	<label>商品规格</label>
			            	<input class="form-control" name="model" type="text" placeholder="例：小锅" ng-model="product.model"/>
			            	</div>
			            	
			            	<div class="form-group">
			            	<label>商品价格</label>
			            	<input class="form-control" name="price" type="text" placeholder="例：88" ng-model="product.price"/>
			            	</div>
			            	
			            	<div class="form-group">
			            	<label>备注</label>
			            	<input class="form-control" name="comment" type="text" placeholder="例：主打产品" ng-model="product.comment"/>
			            	</div>
			            	
		            	</form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button ng-click="addProduct(product)" type="button" class="btn btn-primary">提交</button>
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
    <script src="js/morris-0.4.3.min.js"></script>
    <script src="js/morris/chart-data-morris.js"></script>
    <script src="js/tablesorter/jquery.tablesorter.js"></script>
    <script src="js/tablesorter/tables.js"></script>
    <script src="layer/layer.js"></script>
		<script>
			angular.module('myApp',[])
			.controller('Myctrl',function($scope,$http){
				var loadingIndex = -1 ;
				//页面打开加载全部分类
				$http({
					    method:'POST',  
					   /*  headers:{'Content-Type': 'application/x-www-form-urlencoded'}, */
					    url:'proClassList.do'
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							$scope.proClassList =  req.data.proClassList;
						}
	
					},function error(result){
						console.info(result);  
					}
				);
				//页面打开加载全部商品
				$http({
					    method:'POST',  
					    url:'productList.do',
					    data:{pageNo:1,pageSize:10}
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							$scope.productList = req.data.productList;
							/* $scope.numList = req.data.numList;
							$scope.totalPage = req.data.totalPage;
							$scope.totalCount = req.data.totalCount;
							$scope.currentPage = req.data.pageNo; */
						}
	
					},function error(result){
						console.info(result);  
					    alert(result.data.Message); 
					}
				);
				/* //分页
				$scope.proPageList = function(pageNo,proClassId,proName){
					var loadingIndex = -1 ;
					if(pageNo = $scope.pageNo || pageNo > $scope.totalPage || pageNo <= 0){
						return false;
					}
					$http({
					    method:'POST',  
					    url:'productList.do',
					    data:{proClassId:proClassId,name:proName,pageNo:pageNo,pageSize:10},
					    transformRequest: function(obj) {    
			                var str = [];    
			                for (var p in obj) {    
			                    str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));    
			                }    
			                return str.join("&");    
			            }
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							$scope.productList = req.data.productList;
							$scope.numList = req.data.numList;
							$scope.totalPage = req.data.totalPage;
							$scope.totalCount = req.data.totalCount;
							$scope.currentPage = req.data.pageNo;
						}
					}
					);
				}  */
				
				//分类与模糊检索
				$scope.searchPro = function(proClassId,proName){
					var loadingIndex = -1 ;
					$http({
					    method:'POST',  
					    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, 
					    url:'searchPro.do',
					    data:{proClassId:proClassId,name:proName},
					    transformRequest: function(obj) {    
			                var str = [];    
			                for (var p in obj) {    
			                    str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));    
			                }    
			                return str.join("&");    
			            }
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							$scope.productList =  req.data.productList;
						}
					}
					);
				};
				
				//添加商品
				$scope.addProduct = function(product){
					var str = angular.toJson(product, true);
					$http({
					    method:'POST',  
					    url:'addProduct.do',  
					    contentType:"application/json;charset=UTF-8",
					    data:str
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							window.location.href="product.do";
						}

					},function error(result){
						console.info(result);  
					    alert(result.data.Message); 
					}
					);
				};
				
				//修改商品
				$scope.updateProduct = function(product){
					var str = angular.toJson(product, true);
					$http({
					    method:'POST',  
					    url:'updateProduct.do',  
					    contentType:"application/json;charset=UTF-8",
					    data:str
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							window.location.href="product.do";
						}

					},function error(result){
						console.info(result);  
					    alert(result.data.Message); 
					}
					);
				};
				
				
				//添加商品
				$scope.delProduct = function(product){
					var str = angular.toJson(product, true);
					$http({
					    method:'POST',  
					    url:'delProduct.do',  
					    contentType:"application/json;charset=UTF-8",
					    data:str
					}).then(function success(req){ 
						console.log(req.data.success);
						if(true==req.data.success){
							layer.close(loadingIndex);
							layer.msg(req.data.message, {time:1000, icon:6});
							window.location.href="product.do";
						}

					},function error(result){
						console.info(result);  
					    alert(result.data.Message); 
					}
					);
				};

			});
		</script>
  </body>
</html>
