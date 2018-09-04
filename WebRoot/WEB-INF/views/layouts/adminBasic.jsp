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
        <!--[if !IE]> -->
		<script src="${ctxStatic}/js/jquery-1.9.1.min.js"></script>        
		<!-- <![endif]-->
		<!--[if IE]>
         <script type="text/javascript">window.jQuery || document.write("<script src='${ctxStatic}/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");</script>
        <![endif]-->
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ctxStatic}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
		<script src="${ctxStatic}/assets/js/typeahead-bs2.min.js"></script>
		<!--[if lte IE 8]>
		  <script src="${ctxStatic}/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="${ctxStatic}/assets/js/ace-elements.min.js"></script>
		<script src="${ctxStatic}/assets/js/ace.min.js"></script>
        <script src="${ctxStatic}/assets/layer/layer.js" type="text/javascript"></script>
		<script src="${ctxStatic}/assets/laydate/laydate.js" type="text/javascript"></script>
	<sitemesh:head/>
</head>
<body>
	<sitemesh:body/>
</body>
</html>