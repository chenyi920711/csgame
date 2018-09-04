<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>
<link href="/csgame/static/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/csgame/static/bootstrap-3.3.7/dist/css/bootstrap-combined.min.css" rel="stylesheet">
<link href="/csgame/static/bootstrap-3.3.7/dist/css/layoutit.css" rel="stylesheet">
<script type="text/javascript" src="/csgame/static/js/jquery-3.3.1.js"></script>
<!-- <script type="text/javascript" src="/csgame/static/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="/csgame/static/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
  		$("div[class='accordion-group']").each(function(i){
 			if($(this).html().indexOf("span")>0){
 				console.log($(this).html());
 				
 			}else{
 				$(this).remove();
 			}
 		
 		});
	 
    $(".iframeurl").click(function(){
        var cid = $(this).attr("name");
		var cname = $(this).attr("title");
        $("#iframe").attr("src",cid).ready();
		$("#Bcrumbs").attr("href",cid).ready();
		$(".Current_page a").attr('href',cid).ready();	
        $(".Current_page").attr('name',cid);
		$(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();	
		$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
		$("#parentIfour").html(''). css("display","none").ready();		
    });		 
	  		
	  	$('#firstIndex').click(function(){
	  		/* alert($("div[class='accordion-group']")); */

	  		
	  		$('#nav_list').find('li.home').removeClass('active');
	  		$(this).addClass('active');
	  	});		
	  	$('#firstIndex').click();
	});
</script>
	
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			<img alt="140x140" src="img/a.jpg" />
		</div>
		<div class="span6">
			<dl>
				<dt>
					Rolex
				</dt>
				<dd>
					劳力士创始人为汉斯.威尔斯多夫，1908年他在瑞士将劳力士注册为商标。
				</dd>
				<dt>
					Vacheron Constantin
				</dt>
				<dd>
					始创于1775年的江诗丹顿已有250年历史，
				</dd>
				<dd>
					是世界上历史最悠久、延续时间最长的名表之一。
				</dd>
				<dt>
					IWC
				</dt>
				<dd>
					创立于1868年的万国表有“机械表专家”之称。
				</dd>
				<dt>
					Cartier
				</dt>
				<dd>
					卡地亚拥有150多年历史，是法国珠宝金银首饰的制造名家。
				</dd>
			</dl>
		</div>
		<div class="span4">
			<div style="border: 2px solid #433D4C;border-radius:8px;overflow:scroll;height:290px;" class="accordion" id="accordion-216986">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<!-- #sidebar-shortcuts -->
		
						<c:set var="firstMenu" value="true"/>
						<c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
							<div class="accordion-group">
							<!-- 如果一级菜单含有链接，则直接展示一级菜单跳转，不展示下级菜单 -->
							<c:if test="${not empty menu.href && menu.parent.id eq '1' && menu.isShow eq '1'}">
								<c:choose>
									<c:when test="${firstMenu}">  
										<div class="accordion-heading"><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-216986" id="firstIndex"  href="javascript:void(0)" name="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${not empty menu.href ? menu.href : '/404'}"  title="${menu.name}" class="iframeurl"><i class="icon-dashboard"></i>${menu.name}</a>
										<c:set var="firstMenu" value="false"/> </div> 
									</c:when>
									<c:otherwise>
										<div class="accordion-heading"><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-216986" href="javascript:void(0)" name="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu.href : '/404'}"  title="${menu.name}" class="iframeurl"><i class="icon-double-angle-right"></i>${menu.name}</a></div>
									</c:otherwise>
								</c:choose>
							</c:if>
							<!-- 如果一级菜单不含有链接，则展示二级菜单跳转 -->
							<c:if test="${empty menu.href && menu.parent.id eq '1'&&menu.isShow eq '1'}">
								<div class="accordion-heading"><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-216986" href="#accrodcolsp_${menu.id}" class="dropdown-toggle"><i class="icon-${menu.icon}"></i><span class="menu-text"> ${menu.name} </span><b class="arrow icon-angle-down"></b></a></div>
									<div id="accrodcolsp_${menu.id}" class="accordion-body collapse">
										<c:forEach items="${menuList}" var="menu2">
											<c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
												<c:choose>
												   <c:when test="${firstMenu}">  
															<div style="text-align: center;" class="accordion-inner">
															<a id="firstIndex"  href="javascript:void(0)" name="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}"  title="${menu2.name}" class="iframeurl"><i class="icon-double-angle-right"></i>${menu2.name}</a>
														<c:set var="firstMenu" value="false"/> 
														</div>
												   </c:when>
												   <c:otherwise> 
															<div style="text-align: center;" class="accordion-inner">
															<a  href="javascript:void(0)" name="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}"  title="${menu2.name}" class="iframeurl"><i class="icon-double-angle-right"></i>${menu2.name}</a></div>
												   </c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
										</div>				
							</c:if>
							</div>
						</c:forEach>
				
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
                    <script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>				
			</div>
	</div>
	<div class="row-fluid">
 <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;"name="iframe" frameborder="0" src="">  </iframe>
	</div>
</div>