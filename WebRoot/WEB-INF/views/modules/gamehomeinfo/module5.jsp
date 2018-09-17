<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>游戏房间</title>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <script src="https://webapi.amap.com/maps?v=1.4.8&key=3569ec90020ba941e9269f398bc8896c&plugin=AMap.PolyEditor,AMap.CircleEditor,AMap.ToolBar"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
 	<script type="text/javascript" src="/csgame/static/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/csgame/static/layer/layer.js"></script>  
	<style type="text/css">
		#thebutt{
			width:52%;
			float:right;
			margin-bottom: 0px;		
		}
		#thetop{
			width:52%;
			float:right;
			margin-bottom: 0px;		
		}
		#thebutt input{
			width:50%;
			height:6%;
		}					
		#thebutt input{
			width:19%;
			height:6%;
		}
		
	</style>	 
</head>
<body>
<div id="container"></div>
<div id="tip" style="right: 0%;top: 25%;background-color: #282C35;" >
 	<div style="color: white;background-color: #282C35;width: 100%;border-bottom: 1px solid white;" onclick="lookgp()" >
 		<span style="color: white;font-size: 16px;">玩<br>家<br>列<br>表<br></span>
 	</div>
 	<div style="color: white;background-color: #282C35;width: 100%;" onclick="lookatta()" >
 		<span style="color: white;font-size: 16px;">战<br>斗<br>日<br>志<br></span>
 	</div>  	  
</div>
<div class="button-group" id="thetop" style="text-align: center;top: 1%;	">
  <input type="text" id="duration" class="button" value="剩余时间" style="margin-right: 15%;background-color: #282C35;width: 35%;" />
</div>
<div class="button-group" id="thebutt" style="text-align: left;bottom: 1%;	">
  <input type="button" id="startgame" class="button" value="结束游戏" style="margin-right: 15%;background-color: #282C35;" onclick="gotoend()" />
</div>
	<div style="display: none;" >
	<input type="text" id="mapid" value="${gamehome.grommap}" />
	<input type="text" id="ghomeid" value="${gamehome.id}" />
	<input type="text" id="ghavecircle" value="${gamehome.havecircle}" />
		<input type="text" id="themap" />
		<input type="text" id="thesafec" />
		<input type="text" id="thesafe" />
		<input type="text" id="thegun" />
		<input type="text" id="theintime" />
		<input type="text" id="thechtime" />		
	</div>
<script>
	function getrangerand(){
		var ran = Math.random()*3;
		if(ran>=0&&ran<0.5){
			console.log(Math.random());
			return Math.random();
		}else if(ran>=0.5&&ran<1.8){
			console.log(Math.random()*0.3+0.7);
			return Math.random()*0.3+0.7;
		}else if(ran>=1.8&&ran<3){
			console.log(Math.random()*0.1+0.9);
			return Math.random()*0.1+0.9;
		}else{
			return 1;
		}
	}
	function getslilng(a,b,c){
	    var lnglat = new AMap.LngLat(a,b);
	    var cir1ran =  Math.random()*4;
	    var slidm = Math.ceil(Math.random()*(c/5));
	    console.log(slidm);
	    if(cir1ran>=0&&cir1ran<1){
	    	
	    
	    	return lnglat.offset(0,slidm);
	    }
	    else if(cir1ran>=1&&cir1ran<2){
	    	
	    	
	    	return lnglat.offset(slidm,0);
	    }
	    else  if(cir1ran>=2&&cir1ran<3){
	    	
	    	
	    	return lnglat.offset(0,-slidm);
	    }
	    else if(cir1ran>=3&&cir1ran<4){
	    	
	    	
	    	return lnglat.offset(-slidm,0);
	    }else{
	    	return lnglat;
	    }
	}
	function getslilngne(a,b,c){
	    var lnglat = new AMap.LngLat(a,b);
	    var cir1ran =  Math.random()*2;
	    
	    var slidm = Math.ceil(getrangerand()*(c/5));
	    console.log(slidm);
	    if(cir1ran>=0&&cir1ran<1){
	    	
	    
	    	return lnglat.offset(0,slidm);
	    }
	    else if(cir1ran>=1&&cir1ran<2){
	    	
	    	
	    	return lnglat.offset(slidm,0);
	    }
	    else{
	    	return lnglat;
	    }
	}
	function getslilnges(a,b,c){
	    var lnglat = new AMap.LngLat(a,b);
	    var cir1ran =  Math.random()*2;
	    var slidm = Math.ceil(getrangerand()*(c/5));
	    console.log(slidm);
	    if(cir1ran>=0&&cir1ran<1){
	    	
	    	
	    	return lnglat.offset(slidm,0);
	    }
	    else  if(cir1ran>=1&&cir1ran<2){
	    	
	    	
	    	return lnglat.offset(0,-slidm);
	    }
	 	else{
	    	return lnglat;
	    }
	}
	function getslilngnw(a,b,c){
	    var lnglat = new AMap.LngLat(a,b);
	    var cir1ran =  Math.random()*2;
	    var slidm = Math.ceil(getrangerand()*(c/5));
	    console.log(slidm);
	    if(cir1ran>=0&&cir1ran<1){
	    	
	    
	    	return lnglat.offset(0,slidm);
	    }
	    else if(cir1ran>=1&&cir1ran<2){
	    	
	    	
	    	return lnglat.offset(-slidm,0);
	    }else{
	    	return lnglat;
	    }
	}
	function getslilngws(a,b,c){
	    var lnglat = new AMap.LngLat(a,b);
	    var cir1ran =  Math.random()*2;
	    var slidm = Math.ceil(getrangerand()*(c/5));
	    console.log(slidm);
		if(cir1ran>=0&&cir1ran<1){
	    	
	    	return lnglat.offset(0,-slidm);
	    }
	    else if(cir1ran>=1&&cir1ran<2){
	    	
	    	
	    	return lnglat.offset(-slidm,0);
	    }else{
	    	return lnglat;
	    }
	}
</script>
<script type="text/javascript">
	
	var map = new AMap.Map("container", {
        resizeEnable: true,
        zoom: 8
    });	
	//获得内窗高度
	var heig =  window.innerHeight;
	//获得内窗宽度
	var widh =  window.innerWidth;
	var mapid = $("#mapid").val();
	console.log(mapid+"-------");
	//补给点位置数组
	var gundata = [];
	var hpdata = [];
	
	//加载地图数据
	$.ajax({
			url: "${ctx}/gamehomeinfo/gamehome/recshopmap",
	   		type : 'POST', 
			data : {"manshopid" : mapid},
			dataType : 'json',
			async:false, 
			success : function(optss){
				 for (var i = 0; i < optss.length; i++) { 
	                  $("#themap").val(optss[i].gamemapcenter);
	                  $("#thesafec").val(optss[i].gamemaprang);
	                  $("#thesafe").val(optss[i].gsafepoi);
	                  $("#thegun").val(optss[i].ggunpoi);
	                  $("#theintime").val(optss[i].scirintime);
	                  $("#thechtime").val(optss[i].scrichtime);
	              
	                } 		 
			}		
	});

	
	console.log("地图数据加载完");
	
	//地图范围加载
    if(document.getElementById("themap").value!=""){
	    //回显地图区域
	    	var cent = document.getElementById("themap").value.split("#");
	    	var patha = [];
	    	if(cent.length>0){
	    	for(var i=0;i<cent.length;i++){
	    		if(cent[i]!=""){
	    			patha.push(new AMap.LngLat(cent[i].split("-")[0],cent[i].split("-")[1]));
	    		}
	    	}
		      var  polygon = new AMap.Polygon({
		        path: patha,//设置多边形边界路径
		        strokeColor: "#FF33FF", //线颜色
		        strokeOpacity: 0.2, //线透明度
		        strokeWeight: 3,    //线宽
		        fillColor: "#1791fc", //填充色
		        fillOpacity: 0.35//填充透明度
		    });
		    polygon.setMap(map);
    	}
    }	
	
      var style = [{
                      url: 'https://a.amap.com/jsapi_demos/static/images/mass0.png',
                      anchor: new AMap.Pixel(6, 6),
                      size: new AMap.Size(11, 11)
                    },{
                      url: 'https://a.amap.com/jsapi_demos/static/images/mass1.png',
                      anchor: new AMap.Pixel(4, 4),
                      size: new AMap.Size(7, 7)
                    },{
                      url: 'https://a.amap.com/jsapi_demos/static/images/mass2.png',
                      anchor: new AMap.Pixel(3, 3),
                      size: new AMap.Size(5, 5)
                    }
                  ];	
	//海量点画生命点
   		if(document.getElementById("thesafe").value!=""){
	      var marksaf1 = document.getElementById("thesafe").value.split("#");
	      for(var m = 0; m<=marksaf1.length-1;m++){
		      if(marksaf1[m]!=""){
		      	var sa = marksaf1[m].split("-");	
					hpdata.push({
						lnglat : [
							parseFloat(sa[0]),
							parseFloat(sa[1])
						],
						name : "生命点",
						style : 1
					});		      	      		      	
		      }     	
	      }   		
   		}	

		var mass2 = new AMap.MassMarks(hpdata,{
			opacity : 0.8,
			zIndex : 111,
			cursor : 'pointer',
			style : style,
			zooms : [ 3, 20 ],
			expandZoomRange : true
		});	

		mass2.setMap(map);

	console.log("海量点1加载完")
	//海量点画弹药点
   		if(document.getElementById("thegun").value!=""){
	      var marksaf = document.getElementById("thegun").value.split("#");
	      for(var ma = 0; ma<=marksaf.length-1;ma++){
		      if(marksaf[ma]!=""){
		      	var sma = marksaf[ma].split("-");	
					gundata.push({
						lnglat : [
							parseFloat(sma[0]),
							parseFloat(sma[1])
						],
						name : "弹药点",
						style : 2
					});		      	      		      	
		      }     	
	      }   		
   		}	

		var mass = new AMap.MassMarks(gundata,{
			opacity : 0.8,
			zIndex : 111,
			cursor : 'pointer',
			style : style,
			zooms : [ 3, 20 ],
			expandZoomRange : true
		});	

		mass.setMap(map);

		console.log("海量点2加载完");
	
	var thechtime =  parseFloat($("#thechtime").val());
	var inttime = parseFloat($("#theintime").val());
	var readytime = 12000;
	var sttime = readytime+inttime*1000;
	var retime1 = readytime/1000+inttime;
    var evetime = thechtime*1000+inttime*1000;
    var retime2 = thechtime+inttime;
    var marker, lineArr = [];
    var lineArr2 = [];
    var lineArr3 = [];
    var lineArr4 = [];
    var lineArr5 = [];

   
    var radi = parseFloat($("#thesafec").val().split("#")[0]);

    var radi2c = radi/5*4;

    var radi3c = radi/5*3;

    var radi4c = radi/5*2;

    var radi5c = radi/5*1;
    

    var radiss = radi5c/(57*thechtime);
    
    //这个东西没用
    var radis2s = radi5c/145;

    var startTime = new Date().getTime();

    var readtime = 120000;

        var sir = 0;//1
        var sirt = 0;//2
        var sirth = 0;//3
        var sirf = 0;//4
        var sirfi = 0;//5
        
        
	

    
  
	var thecent = $("#thesafec").val().split("#")[1];
	var lngX = parseFloat(thecent.split("-")[0]);
	var latY = parseFloat(thecent.split("-")[1]);
	

    marker = new AMap.Marker({
        map: map,
        position: [lngX, latY],
        icon: null,
        strokeOpacity: 0,
        offset: new AMap.Pixel(-26, -13),
        autoRotation: true
    });
	

    var cirran =  Math.random()*5;
    if(cirran>=0&&cirran<1){
        //一次偏移
        var lnglat = getslilngne(lngX,latY,radi);
        //二次偏移
        var lngla2t = getslilngne(lnglat.P,lnglat.O,radi2c);
        //三次偏移
        var lngla3t = getslilngne(lngla2t.P,lngla2t.O,radi3c);
        //四次偏移
        var lngla4t = getslilngne(lngla3t.P,lngla3t.O,radi4c);
        //五次偏移
        var lngla5t = getslilngne(lngla4t.P,lngla4t.O,radi5c);         	
    }else if(cirran>=1&&cirran<2){
        //一次偏移
        var lnglat = getslilnges(lngX,latY,radi);
        //二次偏移
        var lngla2t = getslilnges(lnglat.P,lnglat.O,radi2c);
        //三次偏移
        var lngla3t = getslilnges(lngla2t.P,lngla2t.O,radi3c);
        //四次偏移
        var lngla4t = getslilnges(lngla3t.P,lngla3t.O,radi4c);
        //五次偏移
        var lngla5t = getslilnges(lngla4t.P,lngla4t.O,radi5c);        	
    }else if(cirran>=2&&cirran<3){
        //一次偏移
        var lnglat = getslilngnw(lngX,latY,radi);
        //二次偏移
        var lngla2t = getslilngnw(lnglat.P,lnglat.O,radi2c);
        //三次偏移
        var lngla3t = getslilngnw(lngla2t.P,lngla2t.O,radi3c);
        //四次偏移
        var lngla4t = getslilngnw(lngla3t.P,lngla3t.O,radi4c);
        //五次偏移
        var lngla5t = getslilngnw(lngla4t.P,lngla4t.O,radi5c);        	
    }else if(cirran>=3&&cirran<4){
        //一次偏移
        var lnglat = getslilngws(lngX,latY,radi);
        //二次偏移
        var lngla2t = getslilngws(lnglat.P,lnglat.O,radi2c);
        //三次偏移
        var lngla3t = getslilngws(lngla2t.P,lngla2t.O,radi3c);
        //四次偏移
        var lngla4t = getslilngws(lngla3t.P,lngla3t.O,radi4c);
        //五次偏移
        var lngla5t = getslilngws(lngla4t.P,lngla4t.O,radi5c);        	
    }else if(cirran>=4&&cirran<5){
        //一次偏移
        var lnglat = getslilng(lngX,latY,radi);
        //二次偏移
        var lngla2t = getslilng(lnglat.P,lnglat.O,radi2c);
        //三次偏移
        var lngla3t = getslilng(lngla2t.P,lngla2t.O,radi3c);
        //四次偏移
        var lngla4t = getslilng(lngla3t.P,lngla3t.O,radi4c);
        //五次偏移
        var lngla5t = getslilng(lngla4t.P,lngla4t.O,radi5c);        	
    }
    var dis1 = Math.round(new AMap.LngLat(lngX, latY).distance(lnglat));
    var dis2 = Math.round(lnglat.distance(lngla2t));
    var dis3 = Math.round(lngla2t.distance(lngla3t));
    var dis4 = Math.round(lngla3t.distance(lngla4t));
    var dis5 = Math.round(lngla4t.distance(lngla5t));
    

    lineArr.push(new AMap.LngLat(lngX, latY));
    lineArr.push(lnglat); 
    
    lineArr2.push(lnglat);   
    lineArr2.push(lngla2t);
    
    lineArr3.push(lngla2t);
    lineArr3.push(lngla3t);

    lineArr4.push(lngla3t);
    lineArr4.push(lngla4t);    
    
    lineArr5.push(lngla4t);
    lineArr5.push(lngla5t);

    
    getSAFEcircle(lngX, latY, radi);
    
	getSAFEcircle(lnglat.P, lnglat.O, radi2c);	
    
	getSAFEcircle(lngla2t.P, lngla2t.O, radi3c);	
    
	getSAFEcircle(lngla3t.P, lngla3t.O, radi4c);	
    
	getSAFEcircle(lngla4t.P, lngla4t.O, radi5c);	
 
	getSAFEcircle(lngla5t.P, lngla5t.O, 5);	
	var overlaysListt = map.getAllOverlays('circle');
	 overlaysListt[0].show();
    var dd = 1;
    var dd1 = 1;
    var dd2 = 1;
    
    marker.on('moving',function(e){ 
    	if(new Date().getTime() - startTime > sttime&&new Date().getTime()-startTime<sttime+evetime){
    		if(radi>radi2c){
    			radi -= radiss;
    			 var overlaysList = map.getAllOverlays('circle');
		
     			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
    				
    				 for(var i = 6;i<overlaysList.length-2;i++){
    					 overlaysList[i].setMap(null);
    				 }
    				
    				 overlaysList[overlaysList.length-1].show();
    			}else{

    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
	   				/*  var overlaysList = map.getAllOverlays('circle'); */
	   				var o = map.getAllOverlays('marker');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			 } 
    		}else{

    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
	   				 var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
	   				 var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}	
    	}
    	
    	if(new Date().getTime() - startTime >= sttime+evetime&&new Date().getTime()-startTime<=sttime+2*evetime){ 		
    		if(radi>radi3c){
    			radi -= radiss;
    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
	   				 var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    			 getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
   				 var overlaysList = map.getAllOverlays('circle');
				 for(var i = 6;i<overlaysList.length-2;i++){
					 overlaysList[i].setMap(null);
				 }
				 overlaysList[overlaysList.length-1].show();
				 
    			}
    		}else{
   		
    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}	
    	}    	
    	
    	if(new Date().getTime() - startTime >= sttime+2*evetime&&new Date().getTime()-startTime<sttime+3*evetime){ 		
    		if(radi>radi4c){
    			radi -= radiss;
    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}else{
    		
    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}	
    	}
    	
    	if(new Date().getTime() - startTime >= sttime+3*evetime&&new Date().getTime()-startTime<sttime+4*evetime){ 		
    		if(radi>radi5c){
    			radi -= radiss;
    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}else{
    		
    			if(e.passedPath.length>2){
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
    				var overlaysList = map.getAllOverlays('circle');
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
    			}
    		}	
    	} 
    	
    	if(new Date().getTime() - startTime >= sttime+4*evetime){ 	
    		if(radi>5){
    			radi -= radiss;
    			if(e.passedPath.length>2){
    				var overlaysList = map.getAllOverlays('circle');
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				var overlaysList = map.getAllOverlays('circle');
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}else{    		
    			if(e.passedPath.length>2){
    				var overlaysList = map.getAllOverlays('circle');
    				getsolcircle(e.passedPath[2].P,e.passedPath[2].O,radi);
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}else{
    				var overlaysList = map.getAllOverlays('circle');
    				getsolcircle(e.passedPath[1].P,e.passedPath[1].O,radi);
					 for(var i = 6;i<overlaysList.length-2;i++){
						 overlaysList[i].setMap(null);
					 }
					 overlaysList[overlaysList.length-1].show();
    			}
    		}	
    	} 
    });
    map.setFitView();


 
	function startgame() {  
		var cListt = map.getAllOverlays('circle');		
    	if(new Date().getTime() - startTime > sttime&&new Date().getTime()-startTime<sttime+evetime){
    		if(sir<1){
    			sir++;	
    			overlaysListt[0].hide();
    			overlaysListt[1].show();
        		console.log("第一次开始");
        		var speed1 = dis1/thechtime*3600/1000;
        		marker.moveAlong(lineArr,speed1);
    		}
       		if(new Date().getTime() - startTime >= sttime+thechtime*1000&&new Date().getTime()-startTime<sttime+evetime){
       			
       			if(cListt[cListt.length-1].getRadius()>radi2c){
       				var ii = cListt[cListt.length-1].getRadius();     		
       				var iii = (cListt[cListt.length-1].getRadius()-radi2c)/100;
       		    	var interval = setInterval(function(){
       		    		var overlaysLis = map.getAllOverlays('circle');
       		    		if(ii < radi2c){
				    		overlaysListt[1].hide();
				    		overlaysListt[2].show();       		    		
       				    	clearInterval(interval);
       				    	return;
       			    	}
       			    	ii -=iii;
       					getsolcircle(overlaysLis[overlaysLis.length-1].getCenter().P,overlaysLis[overlaysLis.length-1].getCenter().O,ii);
	   					 for(var i = 6;i<overlaysLis.length-2;i++){
	   						 overlaysLis[i].setMap(null);
	   					 }
	   					 overlaysLis[overlaysLis.length-1].show();
       		    	}, 100);
       			}else{
       			 overlaysListt[1].hide();
	    		 overlaysListt[2].show();
       			}
       			
       		}	
    	}
		
		
		
    	if(new Date().getTime() - startTime >= sttime+evetime&&new Date().getTime()-startTime<=sttime+2*evetime){ 		
    		if(sirt<1){
    			sirt++;
/* 	    		overlaysListt[1].hide();
	    		overlaysListt[2].show(); */
	    		console.log("第二次开始");
	    		var speed2 = dis2/thechtime*3600/1000;
	    		marker.moveAlong(lineArr2,speed2);    		
    		}
       		if(new Date().getTime() - startTime >= sttime+evetime+thechtime*1000&&new Date().getTime()-startTime<=sttime+2*evetime){
       			if(cListt[cListt.length-1].getRadius()>radi3c){
       				var ii2 = cListt[cListt.length-1].getRadius();     		
       				var iii2 = (cListt[cListt.length-1].getRadius()-radi3c)/100;
       		    	var interval2 = setInterval(function(){
       		    		var overlaysLis = map.getAllOverlays('circle');
       		    		if(ii2 < radi3c){
				    		overlaysListt[2].hide();
				    		overlaysListt[3].show();         		    		
       				    	clearInterval(interval2);
       				    	return;
       			    	}
       			    	ii2 -=iii2;
       					getsolcircle(overlaysLis[overlaysLis.length-1].getCenter().P,overlaysLis[overlaysLis.length-1].getCenter().O,ii2);
	   					 for(var i = 6;i<overlaysLis.length-2;i++){
	   						 overlaysLis[i].setMap(null);
	   					 }
	   					 overlaysLis[overlaysLis.length-1].show();
       		    	}, 100);
       			}else{
		    		overlaysListt[2].hide();
		    		overlaysListt[3].show();       			
       			}
       			
       		}	    		
    	}    	
		
		
    	if(new Date().getTime() - startTime >= sttime+2*evetime&&new Date().getTime()-startTime<sttime+3*evetime){ 		
    		if(sirth<1){
    			sirth++;
/* 	    		overlaysListt[2].hide();
	    		overlaysListt[3].show(); */
	    		console.log("第三次开始");
	    		var speed3 = dis3/thechtime*3600/1000;
	    		marker.moveAlong(lineArr3,speed3);    			
    		}
       		if(new Date().getTime() - startTime >= sttime+2*evetime+thechtime*1000&&new Date().getTime()-startTime<=sttime+3*evetime){
       			if(cListt[cListt.length-1].getRadius()>radi4c){
       				var ii3 = cListt[cListt.length-1].getRadius();     		
       				var iii3 = (cListt[cListt.length-1].getRadius()-radi4c)/100;
       		    	var interval3 = setInterval(function(){
       		    		var overlaysLis = map.getAllOverlays('circle');
       		    		if(ii3 < radi4c){
				    		overlaysListt[3].hide();
				    		overlaysListt[4].show();         				    	
       				    	clearInterval(interval3);
       				    	return;
       			    	}
       			    	ii3 -=iii3;
       					getsolcircle(overlaysLis[overlaysLis.length-1].getCenter().P,overlaysLis[overlaysLis.length-1].getCenter().O,ii3);
	   					 for(var i = 6;i<overlaysLis.length-2;i++){
	   						 overlaysLis[i].setMap(null);
	   					 }
	   					 overlaysLis[overlaysLis.length-1].show();
       		    	}, 100);
       			}else{
		    		overlaysListt[3].hide();
		    		overlaysListt[4].show();       			       			
       			}
       			
       		}    		
    	}

    	if(new Date().getTime() - startTime >= sttime+3*evetime&&new Date().getTime()-startTime<sttime+4*evetime){ 		
    		if(sirf<1){
    			sirf++;
/* 	    		overlaysListt[3].hide();
	    		overlaysListt[4].show(); */
	    		console.log("第四次开始");
	    		var speed4 = dis4/thechtime*3600/1000;
	    		marker.moveAlong(lineArr4,speed4);   			
    		}
       		if(new Date().getTime() - startTime >= sttime+3*evetime+thechtime*1000&&new Date().getTime()-startTime<=sttime+4*evetime){
       			if(cListt[cListt.length-1].getRadius()>radi5c){
       				var ii4 = cListt[cListt.length-1].getRadius();     		
       				var iii4 = (cListt[cListt.length-1].getRadius()-radi5c)/100;
       		    	var interval4 = setInterval(function(){
       		    		var overlaysLis = map.getAllOverlays('circle');
       		    		if(ii4 < radi5c){
				    		overlaysListt[4].hide();
				    		overlaysListt[5].show();       		    		
       				    	clearInterval(interval4);
       				    	return;
       			    	}
       			    	ii4 -=iii4;
       					getsolcircle(overlaysLis[overlaysLis.length-1].getCenter().P,overlaysLis[overlaysLis.length-1].getCenter().O,ii4);
	   					 for(var i = 6;i<overlaysLis.length-2;i++){
	   						 overlaysLis[i].setMap(null);
	   					 }
	   					 overlaysLis[overlaysLis.length-1].show();
       		    	}, 100);
       			}else{
		    		overlaysListt[4].hide();
		    		overlaysListt[5].show();       			
       			}
       			
       		} 
    	} 

    	if(new Date().getTime() - startTime >= sttime+4*evetime){ 	
    		if(sirfi<1){
    			sirfi++;
/* 	    		overlaysListt[4].hide();
	    		overlaysListt[5].show(); */
	    		console.log("第五次开始");
	    		var speed5 = (dis5)/thechtime*3600/1000;
	    		marker.moveAlong(lineArr5,speed5);    		
    		}	
       		if(new Date().getTime() - startTime >= sttime+4*evetime+thechtime*1000&&new Date().getTime()-startTime<=sttime+5*evetime){
       			if(cListt[cListt.length-1].getRadius()>5){
       				var ii5 = cListt[cListt.length-1].getRadius();     		
       				var iii5 = (cListt[cListt.length-1].getRadius()-5)/100;
       		    	var interval5 = setInterval(function(){
       		    		var overlaysLis = map.getAllOverlays('circle');
       		    		if(ii5 < 5){
       				    	clearInterval(interval5);
       				    	return;
       			    	}
       			    	ii5 -=iii5;
       					getsolcircle(overlaysLis[overlaysLis.length-1].getCenter().P,overlaysLis[overlaysLis.length-1].getCenter().O,ii5);
	   					 for(var i = 6;i<overlaysLis.length-2;i++){
	   						 overlaysLis[i].setMap(null);
	   					 }
	   					 overlaysLis[overlaysLis.length-1].show();
       		    	}, 100);
       			}
       			
       		} 
    	}  
    	
    } 
    //websocket1端口存放地图数据
     var sock = new WebSocket('ws://192.168.199.142:8080');
    //websocket2端口取出玩家信息
     var sock2 = new WebSocket('ws://127.0.0.1:8011'); 
	 var show = document.getElementById("duration");
    //ajax轮询取出所有玩家位置信息并发送地图数据给nodejs
   
   
     setInterval(function() {
		//正数计时
		var time = new Date();  
		var t = time.getHours() + ":"+ time.getMinutes() + ":" + time.getSeconds();   		
		//倒数计时
		if(retime1>0){
			retime1 = retime1-1;
			show.value = "当前时间:"+t+"||毒区变化剩余:"+retime1;			
		}else{
			if(retime2>=0){
			 	if(retime2==0){
			 		retime2 = thechtime+inttime;
			 	}
			 	retime2 = retime2-1;
			 	show.value = "当前时间:"+t+"||毒区变化剩余:"+retime2;		
			 }   		
		} 
/* 		var sendcir = map.getAllOverlays('circle');
		var cent = sendcir[sendcir.length-1].getCenter().getLng()+"-"+sendcir[sendcir.length-1].getCenter().getLat( );
    	var sendredis =  sendcir[sendcir.length-1].getRadius();
    	var romid = document.getElementById("ghomeid").value;
		var sendmsg = {cent:cent,redis:sendredis,romid:romid};
		sock.send(sendmsg);*/
    	console.log("来人啦!"); 
    }, 1000);

	//返回玩家位置数据
	setInterval(function() {

		console.log("测试--");
	}, 2000);

    var hcircle = document.getElementById("ghavecircle").value;
    if(hcircle=="0"){
	    //开始游戏
	    setTimeout("startgame()", sttime);
		setTimeout("startgame()", sttime+thechtime*1000);
	    setTimeout("startgame()", sttime+evetime);
	    setTimeout("startgame()", sttime+evetime+thechtime*1000);
	    setTimeout("startgame()", sttime+2*evetime);
	    setTimeout("startgame()", sttime+2*evetime+thechtime*1000);
	    setTimeout("startgame()", sttime+3*evetime);
	    setTimeout("startgame()", sttime+3*evetime+thechtime*1000);
	    setTimeout("startgame()", sttime+4*evetime);
	    setTimeout("startgame()", sttime+4*evetime+thechtime*1000);     
    }
    if(hcircle=="1"){
    	getsolcircle(lngX, latY,radi);
    }


    function getsolcircle(xpos,ypos,radi){
        var editor={};
        editor._circle=(function(){
        var circle = new AMap.Circle({
                center: [xpos,ypos],// 圆心位置
                radius: radi, //半径
                strokeColor: "#8660DB", //线颜色
                strokeOpacity: 1, //线透明度
                strokeWeight: 1, //线粗细度
                fillColor: "#E7FCFD", //填充颜色
                fillOpacity: 0//填充透明度
            });
            circle.setMap(map);
        	return circle;
        })();     	
    }

    function getSAFEcircle(xpos,ypos,raddi){
        var editor={};
        editor._circle=(function(){
        var circle = new AMap.Circle({
                center: [xpos,ypos],// 圆心位置
                radius: raddi, //半径
                strokeColor: "#FF7935", //线颜色
                strokeOpacity: 1, //线透明度
                strokeWeight: 1, //线粗细度
                fillColor: "#E7FCFD", //填充颜色
                fillOpacity: 0//填充透明度
            });
            circle.setMap(map);
             circle.hide(); 
        	return circle;
        })();     	
    }
	function lookgp(){
		
	}   
	function gotoend(){
		if(window.confirm("确定结束该局游戏？")){
			window.location = "${ctx}/gamehomeinfo/gamehome/endredissave?roomid="+$("#ghomeid").val()+"&rstaus=0&iscaluc=true";
		}
	}
</script>

</body>
</html>