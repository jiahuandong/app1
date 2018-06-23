<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<title>登陆页面</title>

		<!-- Page Specific CSS -->
		
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<!--必要样式-->
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<!--[if IE]>
		<script src="js/login/html5.js"></script>
		<![endif]-->
	</head>

	<body ng-app="myApp" ng-controller="myCtrl">

		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>企业管理系统</h3>
						<form action="#" name="f" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input id="loginAccount" ng-model="loginAccount" name="loginAccount" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input id="password" ng-model="passWord" name="passWord" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" value="" type="password" placeholder="请输入密码">
							</div>
							<div class="mb2">
								<a id="btn" class="act-but submit " ng-click="doLogin()"  style="color: #FFFFFF;font-family: '微软雅黑';">登录</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /container -->
		<script src="js/login/TweenLite.min.js"></script>
		<script src="js/login/EasePack.min.js"></script>
		<script src="js/login/rAF.js"></script>
		<script src="js/login/demo-1.js"></script>
		<script src="js/angular.min.js"></script>
		<script>
			
			/* function doLogin(){
				alert("aaaa");
				var username = $("#userName").val();
				var password = $("#passWord").val();;
				$.ajax({
					type:"POST",
					url:"login.do",
					data:{username:username,passwowrd:password},
					dataType:"json",
					beforeSend:function(){
						alert("before");
					},
					success:function(result){
						alert("OK!");
					}
				});
			} */
			
			angular.module('myApp',[])
				.controller('myCtrl',['$scope','$http',function($scope,$http){
					$scope.doLogin = function(){
						$http({
						    method:'POST',  
						    url:'dologin.do',  
						    /* headers:{'Content-Type': 'application/x-www-form-urlencoded'}, */
						    data:{
						    	loginAccount:$scope.loginAccount,
						    	passWord:$scope.passWord
								}  

						}).then(function success(req){ 
							console.log(req.data.success);
							if(true==req.data.success){
								alert(req.data.message);
								window.location.href = "index.do";
							}

						},function error(result){
							console.info(result);  
						    alert(result.data.Message); 
						}
						);
					}
				}]);
			
			
			
		</script>
	</body>

</html>