<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title><sitemesh:title/></title><!--  - Powered By csgame -->
	
		<link href="${ctxStatic}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctxStatic}/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ctxStatic}/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="${ctxStatic}/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${ctxStatic}/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${ctxStatic}/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="${ctxStatic}/css/style.css"/>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${ctxStatic}/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${ctxStatic}/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="${ctxStatic}/assets/js/html5shiv.js"></script>
		<script src="${ctxStatic}/assets/js/respond.min.js"></script>
		<![endif]-->
		<script src="${ctxStatic}/js/jquery-1.9.1.min.js"></script>        
        <script src="${ctxStatic}/assets/layer/layer.js" type="text/javascript"></script>
	<sitemesh:head/>
</head>
<body class="login-layout">
	<sitemesh:body/>
</body>
</html>