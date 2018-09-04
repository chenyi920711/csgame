<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>
<link href="/csgame/static/bootstrap-3.3.7/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link
	href="/csgame/static/bootstrap-3.3.7/dist/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link href="/csgame/static/bootstrap-3.3.7/dist/css/layoutit.css"
	rel="stylesheet">
<script type="text/javascript" src="/csgame/static/js/jquery-3.3.1.js"></script>
<!-- <script type="text/javascript" src="/csgame/static/js/bootstrap.min.js"></script> -->
<script type="text/javascript"
	src="/csgame/static/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
<script src="/csgame/static/js/custom.js"></script>
<script src="/csgame/static/js/modernizr.custom.js"></script>
<script src="/csgame/static/js/jquery.isotope.min.js"></script>

<script src="/csgame/static/js/jquery.magnific-popup.min.js"></script>

<script src="/csgame/static/js/animate.js"></script>

<script src="/csgame/static/js/jquery.easing.1.3.js"></script>
<script src="/csgame/static/js/bootstrap.min.js"></script>
<script src="/csgame/static/js/jquery.fancybox.pack.js"></script>
<script src="/csgame/static/js/jquery.fancybox-media.js"></script>
<script src="/csgame/static/js/jquery.flexslider.js"></script>
<script src="/csgame/static/js/animate.js"></script>
<script type="text/javascript"src="/csgame/static/layer/layer.js"></script>
<!-- <script src="/csgame/static/js/iealert.js"></script> -->
<style type="text/css">
th {
	text-align: center; /** 设置水平方向居中 */
	vertical-align: middle /** 设置垂直方向居中 */
}
 
</style>
<script type="text/javascript">
	
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
	 function showNotify(id){
	   	  
          layer.config({
            skin: 'demo-class'//自定义样式demo-class
          })
          layer.open({
          title: false, //不显示标题栏
		  type: 2,
		  offset: 'auto', //具体配置参考：offset参数项
		  maxmin: false,
		  scrollbar: false,
		  content: '${ctx}/oa/oaNotify/showNotify?id=' + id,
		  area: ['400px', '400px'],
		  skin: 'yourclass',
		  btn: '关闭',
		  btnAlign: 'c', //按钮居中
		  shade: 0,//不显示遮罩
		  /* yes: function(){
		    layer.closeAll();
		    window.location.replace("${ctx}/equip/equipment/storeEquipment/list");
		  } */
		  yes: function () {
              layer.closeAll();
             }
		  
		});
	 }
</script>
	



<script type="text/javascript">
	$(document).ready(function() {
		$("#iframe").height($(window).height() * 0.75);
		/* alert($(window).height()*0.55); */
		/* alert($(window).height()); //浏览器当前窗口可视区域高度
		alert($(document).height()); //浏览器当前窗口文档的高度
		alert($(document.body).height()); //浏览器当前窗口文档body的高度
		alert($(document.body).outerHeight(true)); //浏览器当前窗口文档body的总高度 包括border padding margin

		alert($(window).width()); //浏览器当前窗口可视区域宽度
		alert($(document).width()); //浏览器当前窗口文档对象宽度
		alert($(document.body).width()); //浏览器当前窗口文档body的宽度
		alert($(document.body).outerWidth(true)); //浏览器当前窗口文档body的总宽度 包括border padding margin */


		$("div[class='accordion-group']").each(function(i) {
			if ($(this).html().indexOf("div") > 0) {

			} else {
				$(this).remove();
			}

		});

		$(".iframeurl").click(function() {
			var cid = $(this).attr("name");
			var cname = $(this).attr("title");
			$("#iframe").attr("src", cid).ready();
			$("#Bcrumbs").attr("href", cid).ready();
			$(".Current_page a").attr('href', cid).ready();
			$(".Current_page").attr('name', cid);
			$(".Current_page").html(cname).css({
				"color" : "#333333",
				"cursor" : "default"
			}).ready();
			$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
			$("#parentIfour").html('').css("display", "none").ready();
		});

		$('#firstIndex').click(function() {
			/* alert($("div[class='accordion-group']")); */


			$('#nav_list').find('li.home').removeClass('active');
			$(this).addClass('active');
		});
	});
</script>

</head>
<body style="background-color: #143D43;">

	<div class="container-fluid"
		style="margin: 0px -100px;width: 100%; height:98%">
		<div class="row-fluid" style="text-align: center;margin-bottom:0px;">
			<div class="span2"
				style="height:38%;border: 2px solid #0FA2A5;border-radius:8px;width:15%;">
				<font color="#F0F8FF"><span><span class="time">
					<em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>${fns:getUser().name}
				</span></span></font>
				<ul class="nav ace-nav">
					<li class="light-blue"><img alt=""
						src="${fns:getUser().photo}" height="60px" width="70px"
						border-radius="60px">

						<div
							style=" margin-top:5px; border:1px solid 	#00CED1; font-color:#F0F8FF;text-align:center">
							<a href="${ctx}/sys/user/info" target="iframe" color="#F0F8FF">个人资料</a>
						</div>
						<div
							style=" margin-top:5px; border:1px solid 	#00CED1; text-align:center">
							<a href="${ctx}/sys/user/modifyPwd" target="iframe">修改密码</a>
						</div>
						<div
							style=" margin-top:5px; border:1px solid 	#00CED1; text-align:center">
							<a href="${ctx}/oa/oaNotify/self" target="iframe">查看通知</a>
						</div>
						<div
							style=" margin-top:5px; border:1px solid 	#00CED1; text-align:center">
							<a href="${ctx}/logout" id="Exit_system">注销登陆</a>
						</div> 
						<%-- <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li><a href="${ctx}/sys/user/modifyPwd" target="iframe"><i class="icon-cog"></i>修改密码</a></li>
								<li><a href="${ctx}/sys/user/info" target="iframe"><i class="icon-user"></i>个人资料</a></li>
								<li class="divider"></li>
								<li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
							</ul> --%>
					</li>
				</ul>
			</div>
			<div class="span6"  style="height:38%;border: 2px solid #0FA2A5;border-radius:8px;width:60%;margin-left: 0px;">

				<div id="main-slider" class="flexslider" style="height:100%;width:100%;margin-left: 0px;" >
				
					<ul class="slides" id="img" style="list-style-type:none;margin:0px;">
						<c:forEach items="${findPicture}" var="notify">
							<li style=" list-style-position:outside;">
								<img src="../..${notify.files}" alt="" id="${notify.id}" onclick="showNotify(this.id)"
								style="height: 100%;width: 100%;" />
							</li>
						</c:forEach>
					</ul>
				</div>


			</div>
			<div class="span3" style="margin-left: 0px;width:25%;">
				<div
					style="border: 2px solid #0FA2A5;border-radius:8px;height:38%;overflow:scroll;"
					class="accordion" id="accordion-216986">
					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'fixed')
						} catch (e) {}
					</script>
					<!-- #sidebar-shortcuts -->

					<c:set var="firstMenu" value="true" />
					<c:forEach items="${fns:getMenuList()}" var="menu"
						varStatus="idxStatus">
						<div class="accordion-group" style="border: 0px solid #143D43;">
							<!-- 如果一级菜单含有链接，则直接展示一级菜单跳转，不展示下级菜单 -->
							<c:if
								test="${not empty menu.href && menu.parent.id eq '1' && menu.isShow eq '1'}">
								<div class="accordion-inner" style="border: 0px solid #0FA2A5;">
									<c:choose>
										<c:when test="${firstMenu}">

											<a class="iframeurl" style="color:#00bfbf;font-weight:bold;"
												data-parent="#accordion-216986" id="firstIndex"
												href="javascript:void(0)"
												name="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${not empty menu.href ? menu.href : '/404'}"
												title="${menu.name}" class="iframeurl"><i
												class="icon-dashboard"></i>${menu.name}</a>
											<c:set var="firstMenu" value="false" />

										</c:when>
										<c:otherwise>
											<a class="iframeurl" style="color:#00bfbf;font-weight:bold;"
												data-parent="#accordion-216986" href="javascript:void(0)"
												name="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${not empty menu.href ? menu.href : '/404'}"
												title="${menu.name}" class="iframeurl"><i
												class="icon-double-angle-right"></i>${menu.name}</a>
										</c:otherwise>

									</c:choose>
								</div>
							</c:if>
							<!-- 如果一级菜单不含有链接，则展示二级菜单跳转 -->
							<c:if
								test="${empty menu.href && menu.parent.id eq '1'&&menu.isShow eq '1'}">
								<div class="accordion-heading"
									style="border: 0px solid #0FA2A5;">
									<a class="accordion-toggle collapsed" data-toggle="collapse"
										style="color:#00bfbf;font-weight:bold;border: 1px solid #0FA2A5;"
										data-parent="#accordion-216986" href="#accrodcolsp_${menu.id}"
										class="dropdown-toggle"><i class="icon-${menu.icon}"></i><span
										class="menu-text"> ${menu.name} </span><b
										class="arrow icon-angle-down"></b></a>
								</div>
								<div id="accrodcolsp_${menu.id}" class="accordion-body collapse"
									style="border: 1px solid #0FA2A5;">
									<c:forEach items="${menuList}" var="menu2">
										<c:if
											test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
											<c:choose>
												<c:when test="${firstMenu}">
													<div style="text-align: center;border: 0px solid #0FA2A5;"
														class="accordion-inner">
														<a id="firstIndex" href="javascript:void(0)"
															style="color:#00bfbf;font-weight:bold;"
															name="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}"
															titlefF="${menu2.name}" class="iframeurl"><i
															class="icon-double-angle-right"></i>${menu2.name}</a>
														<c:set var="firstMenu" value="false" />
													</div>
												</c:when>
												<c:otherwise>
													<div style="text-align: center;border: 1px solid #0FA2A5;"
														class="accordion-inner">
														<a id="secIndex" href="javascript:void(0)"
															style="color:#00bfbf;font-weight:bold;"
															name="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}"
															title="${menu2.name}" class="iframeurl"><i
															class="icon-double-angle-right"></i>${menu2.name}</a>
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</c:forEach>

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left"
							data-icon1="icon-double-angle-left"
							data-icon2="icon-double-angle-right"></i>
					</div>
					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'collapsed')
						} catch (e) {}
					</script>
				</div>
			</div>
		</div>
		<div class="row-fluid"
			style="border: 2px solid #0FA2A5;marginheight:0px;border-radius:8px;overflow:scroll;">
			<iframe id="iframe"
				style="border:0; width:100%; background-color:#323232;"
				name="iframe" frameborder="0" src=""> </iframe>
		</div>
	</div>
</body>
