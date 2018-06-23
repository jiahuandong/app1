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
          <li class="active"><i class="glyphicon glyphicon-map-marker"></i> 销售管理 >> 订单操作</li>
        </ol>
      </div>
    </div> <!--end row-->
    <div class="row" align="center">
      <div class="input-group col-lg-7">
        <input type="text" class="form-control input-sm"><span class="input-group-addon btn-primary btn-sm"><span class="glyphicon glyphicon-search"></span> 搜索</span>
      </div>
    </div>
    <br />
    <div class="row" align="center">
      <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus-sign"></span> 创建订单</button>
      <button type="button" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-zoom-in"></span> 查询订单</button>
      <button type="button" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-list"></span> 全部订单</button>
    </div><br />
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-money"></i> 订单列表</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped tablesorter">
                <thead>
                <tr>
                  <th>订单编号 <i class="fa fa-sort"></i></th>
                  <th>桌位编号 <i class="fa fa-sort"></i></th>
                  <th>订单日期 <i class="fa fa-sort"></i></th>
                  <th>下单时间 <i class="fa fa-sort"></i></th>
                  <th>订单金额 <i class="fa fa-sort"></i></th>
                  <th>实收金额 <i class="fa fa-sort"></i></th>
                  <th>操作<i class="fa fa-sort"></i></th>
                </tr>
                </thead>
                <tbody>
                <tr valign="middle">
                  <td>3326</td>
                  <td>3326</td>
                  <td>10/21/2013</td>
                  <td>3:29 PM</td>
                  <td>$321.33</td>
                  <td>$321.33</td>
                  <td>
                    <button type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-edit"></span> 修改</button>
                    <button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> 删除</button>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="text-right">
              <a href="#">查看更多订单  <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div><!-- /.row -->
    <div align="center">
      <ul class="pagination pagination-sm">
        <li class="disabled"><a href="#">&laquo;</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
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
