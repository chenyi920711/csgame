$(document).ready(function() {
	var totalVal = 0;
	$("#contentTable tr").each(function(index, domEle){
		if(index>0){
			var val = parseInt($(domEle).find("td").eq(3).text());
			totalVal = totalVal + val;
		}
	});
	$("#total").html(totalVal);
});