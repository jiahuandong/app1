<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
	<a class="navbar-brand" style="font-family: '微软雅黑'; color: white; " href="javascript:;">企业进销存管理系统</a>
</div>

<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
	<ul class="nav navbar-nav side-nav"">
		<li class="active">
			<a href="index.do"><i class="glyphicon glyphicon-home"></i> &nbsp;菜单首页</a>
		</li>
		<li class="dropdown">
			<a href="order.do"><i class="glyphicon glyphicon-list-alt"></i> &nbsp;销售管理</a>
			<!--<ul class="dropdown-menu">
			<li>
				<a href=""><span class="glyphicon glyphicon-th-list"></span> 订单列表</a>
			</li>
			<li>
				<a href="#"><span class="glyphicon glyphicon-plus"></span> 创建订单</a>
			</li>
		</ul>-->
		</li>
		<li class="dropdown">
			<a href="product.do"><i class="glyphicon glyphicon-tasks"></i> &nbsp;商品管理</a>
		</li>
		<li class="dropdown">
			<a href="stock.do"><i class="glyphicon glyphicon-th"></i> &nbsp;货品管理</a>
		</li>
		<li class="dropdown">
			<a href="trade.do"><i class="glyphicon glyphicon-random"></i> &nbsp;购货管理</a>
		</li>
		<li class="dropdown">
			<a href="supplier.do"><i class="glyphicon glyphicon-globe"></i> &nbsp;供应商管理</a>
		</li>
		<li class="dropdown">
			<a href="statistics.do"><i class="glyphicon glyphicon-stats"></i> &nbsp;统计报表</a>
		</li>
		<li class="dropdown">
			<a href="user.do"><i class="glyphicon glyphicon-user"></i> &nbsp;用户管理</a>
		</li>
		<!--<li class="dropdown">
		<a href="../pages/product-list.html" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-tasks"></i> &nbsp;商品管理 <b class="caret"></b></a>
	</li>
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-th-large"></span> &nbsp;购货管理 <b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li>
				<a href="#"><span class="glyphicon glyphicon-th-list"></span> 购货列表</a>
			</li>
			<li>
				<a href="#"><span class="glyphicon glyphicon-plus"></span> 添加清单</a>
			</li>
		</ul>
	</li>
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> &nbsp;用户管理 <b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li>
				<a href="#"><span class="glyphicon glyphicon-th-list"></span> 用户列表</a>
			</li>
			<li>
				<a href="#"><span class="glyphicon glyphicon-pencil"></span> 权限管理</a>
			</li>
		</ul>
	</li>-->
	</ul>
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
				<li class="divider"></li>
				<li class="message-preview">
					<a href="#">
						<!--<span class="avatar"><img src="http://placehold.it/50x50"></span>-->
						<span class="name">订单1</span>
						<span class="message">Hey there, I wanted to ask you something...</span>
						<span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
					</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="#">查看订单列表 <span class="badge">7</span></a>
				</li>
			</ul>
		</li>
		<li class="dropdown user-dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;${sessionScope.userName }<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li>
					<a href="javascript:return false;"><i class="fa fa-user"></i> 管理员</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="doLoginOut.do"><i class="fa fa-power-off"></i> 退出登陆</a>
				</li>
			</ul>
		</li>
		<li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
	</ul>
</div>
<!-- /.navbar-collapse -->