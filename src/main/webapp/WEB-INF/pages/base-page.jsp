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

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link rel="stylesheet" href="../font-awesome/css/bootstrap.min.css">
    <link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
    <link href="../css/sb-admin.css" rel="stylesheet">
    
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="../css/morris-0.4.3.min.css">
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" style="font-family: '微软雅黑'; color: white; " href="javascript;">>>>企业进销存管理系统>>></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
        	<div id="page_menu"></div>
          

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown messages-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> 今日订单 <span class="badge">7</span> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">7 今日订单</li>
                <li class="message-preview">
                  <a href="#">
                    <!--<span class="avatar"><img src="http://placehold.it/50x50"></span>-->
                    <span class="name">订单1</span>
                    <span class="message">Hey there, I wanted to ask you something...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li class="message-preview">
                  <a href="#">
                    <!--<span class="avatar"><img src="http://placehold.it/50x50"></span>-->
                    <span class="name">订单1</span>
                    <span class="message">Hey there, I wanted to ask you something...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li><li class="message-preview">
                  <a href="#">
                    <!--<span class="avatar"><img src="http://placehold.it/50x50"></span>-->
                    <span class="name">订单1</span>
                    <span class="message">Hey there, I wanted to ask you something...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li><a href="#">查看订单列表 <span class="badge">7</span></a></li>
              </ul>
            </li>
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 系统管理员 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="javascript:return false;"><i class="fa fa-user"></i> 管理员</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="fa fa-power-off"></i> 退出登陆</a></li>
              </ul>
            </li>
            <li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>
		<div class="copyrights">Collect from </div>
      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li class="active"><i class="glyphicon glyphicon-map-marker"></i> 销售管理 >> 订单操作</li>
            </ol>
		        <div class="alert alert-success alert-dismissable">
		        	以下为近七日销量商品概况统计，......
		        </div>
          </div>
        </div><!-- /.row -->

        <div class="row">
          <div class="col-lg-3">
            <div class="panel panel-info">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-6">
                    <i class=" 	glyphicon glyphicon-heart-empty fa-5x"></i>
                  </div>
                  <div class="col-xs-6 text-right">
                    <p class="announcement-heading">456</p>
                    <p class="announcement-text">商品名称</p>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer announcement-bottom">
                  <div class="row">
                    <div class="col-xs-6">
                      	最受欢迎商品
                    </div>
                    <div class="col-xs-6 text-right">
                      <i class="fa fa-arrow-circle-right"></i>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="panel panel-warning">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-6">
                    <i class="glyphicon glyphicon-stats fa-5x"></i>
                  </div>
                  <div class="col-xs-6 text-right">
                    <p class="announcement-heading">12</p>
                    <p class="announcement-text">商品名称</p>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer announcement-bottom">
                  <div class="row">
                    <div class="col-xs-6">
                      	销量最高商品
                    </div>
                    <div class="col-xs-6 text-right">
                      <i class="fa fa-arrow-circle-right"></i>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="panel panel-danger">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-6">
                    <i class="glyphicon glyphicon-dashboard fa-5x"></i>
                  </div>
                  <div class="col-xs-6 text-right">
                    <p class="announcement-heading">18</p>
                    <p class="announcement-text">最高订单日</p>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer announcement-bottom">
                  <div class="row">
                    <div class="col-xs-6">
                      	最高订单日
                    </div>
                    <div class="col-xs-6 text-right">
                      <i class="fa fa-arrow-circle-right"></i>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="panel panel-success">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-6">
                    <i class="glyphicon glyphicon-fire fa-5x"></i>
                  </div>
                  <div class="col-xs-6 text-right">
                    <p class="announcement-heading">56</p>
                    <p class="announcement-text">产品名称</p>
                  </div>
                </div>
              </div>
              <a href="#">
                <div class="panel-footer announcement-bottom">
                  <div class="row">
                    <div class="col-xs-6">
                     	 单品复购最高
                    </div>
                    <div class="col-xs-6 text-right">
                      <i class="fa fa-arrow-circle-right"></i>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div><!-- /.row -->

        <div class="row">
          <div class="col-lg-12">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-money"></i> 近期订单列表......</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>
                        <th>订单编号 <i class="fa fa-sort"></i></th>
                        <th>订单日期 <i class="fa fa-sort"></i></th>
                        <th>下单时间 <i class="fa fa-sort"></i></th>
                        <th>订单金额 <i class="fa fa-sort"></i></th>
                        <th>实收金额 <i class="fa fa-sort"></i></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>3326</td>
                        <td>10/21/2013</td>
                        <td>3:29 PM</td>
                        <td>$321.33</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3325</td>
                        <td>10/21/2013</td>
                        <td>3:20 PM</td>
                        <td>$234.34</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3324</td>
                        <td>10/21/2013</td>
                        <td>3:03 PM</td>
                        <td>$724.17</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3323</td>
                        <td>10/21/2013</td>
                        <td>3:00 PM</td>
                        <td>$23.71</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3322</td>
                        <td>10/21/2013</td>
                        <td>2:49 PM</td>
                        <td>$8345.23</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3321</td>
                        <td>10/21/2013</td>
                        <td>2:23 PM</td>
                        <td>$245.12</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3320</td>
                        <td>10/21/2013</td>
                        <td>2:15 PM</td>
                        <td>$5663.54</td>
                        <td>$321.33</td>
                      </tr>
                      <tr>
                        <td>3319</td>
                        <td>10/21/2013</td>
                        <td>2:13 PM</td>
                        <td>$943.45</td>
                        <td>$321.33</td>
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

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="../js/jquery-1.10.2.js"></script>
    <script src="../js/bootstrap.js"></script>

    <!-- Page Specific Plugins -->    <script src="../js/raphael-min.js"></script>
    <script src="../js/morris-0.4.3.min.js"></script>
    <script src="../js/morris/chart-data-morris.js"></script>
    <script src="../js/tablesorter/jquery.tablesorter.js"></script>
    <script src="../js/tablesorter/tables.js"></script>
		<script>
			$("#page_menu").load("../pages/page_menu.html");
		</script>
  </body>
</html>
