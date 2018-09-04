<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div  id="notify" 
		style="width:100%;height:100%;align:center;" >
		<table style="align:center;width:90%;font-size: 14px;"  >
			<tr>
				<td style="text-align:rigth;">通知标题：</td>
				<td style="text-align:left;">
					<span>${oaNotify.title }</span>
				</td>
			</tr>
			<tr>
				<td style="text-align: rigth;">发布时间：</td>
				<td style="text-align:left;">
					<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: rigth;">通知内容：</td>
				<td style="text-align:left;">
					<textarea path="content" readonly="readonly" font-family="微软雅黑"  font-size="14px" rows="10" cols="30" maxlength="2000" >${oaNotify.content }</textarea>
				</td>
			</tr>
			
		</table>
</div>

</body>
</html>