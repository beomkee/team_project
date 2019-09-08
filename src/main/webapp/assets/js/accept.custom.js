var startNodeNum = 0;
var startNodeName = '';
var startNodeXpoint = '';
var startNodeYpoint = '';

var via1NodeNum = 0;
var via1NodeName = '';
var via1NodeXpoint = '';
var via1NodeYpoint = '';

var via2NodeNum = 0;
var via2NodeName = '';
var via2NodeXpoint = '';
var via2NodeYpoint = '';

var via3NodeNum = 0;
var via3NodeName = '';
var via3NodeXpoint = '';
var via3NodeYpoint = '';

var endNodeNum = 0;
var endNodeName = '';
var endNodeXpoint = '';
var endNodeYpoint = '';

var lon, lat;

var distance = 0;
var startToVia = 0;
var endToVia = 0;

var isRunGetVia = false;

//시작 간선지를 찾는 함수
function getStartNode(addr) {
	$.ajax({
		url : "getNodeDiv2",
		method : "POST",
		data : {},
		success : function(data) {
			console.log(data)
			allNodes = data;
			getXYpoint(addr);
			var count = 0;
			var max = data.length;
			distance = 42000000;
			var distanceget = setInterval(function() {
				getDistance(1, lon, lat, data[count].n_xy.split(",")[1], data[count].n_xy.split(",")[0], data[count].n_name, data[count].n_num);
				console.log(count+": "+distance);
				count++;
				if (count == max) {
					console.log("nearestNode: " + startNodeNum + "-" + startNodeName + "(" + distance + "m)");
					clearTimeout(distanceget);
					$("#startNode").val(startNodeName);
					$("#n_start").val(startNodeNum);
					 if (startNodeName != '' && endNodeName != '' && isRunGetVia == false) {
						 getViaNode();
					}
				}
			}, 500);
		}
	});
}

function getEndNode(addr) {
	$.ajax({
		url : "getNodeDiv2",
		method : "POST",
		data : {},
		success : function(data) {
			allNodes = data;
			getXYpoint(addr);
			var count = 0;
			var max = data.length;
			distance = 42000000;
			var distanceget = setInterval(function() {
				getDistance(2, lon, lat, data[count].n_xy.split(",")[1], data[count].n_xy.split(",")[0], data[count].n_name, data[count].n_num);
				console.log(count+": "+distance);
				count++;
				if (count == max) {
					console.log("nearestNode: " + endNodeName + "(" + distance + "m)");
					clearTimeout(distanceget);
					$("#endNode").val(endNodeName);
					$("#n_end").val(endNodeNum);
					if (startNodeName != '' && endNodeName != '' && isRunGetVia == false) {
						 getViaNode();
					}
				}
			}, 500);
		}
	});
}

//주소를 이용해 XY 좌표를 찾아주는 API이용
function getXYpoint(addr){
	$.ajax({
		method:"GET",
		url:"https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result",
		async:false,
		data:{
			"coordType" : "WGS84GEO",
			"fullAddr" : addr, 
			"appKey" : "9fbe3ae8-c33c-4b03-b618-77bab5761e9e",
		},

		success:function(response){
			prtcl = response;
			var prtclString = new XMLSerializer().serializeToString(prtcl);
		    xmlDoc = $.parseXML( prtclString ),
		    $xml = $( xmlDoc ),
		    $intRate = $xml.find("coordinateInfo");
			if($intRate[0].getElementsByTagName("lon").length>0){
				lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
		    	lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
			}else{
				lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
				lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
			}
		}
	});
}

//거리 계산 해주는 API이용
function getDistance(divs, startX, startY, endX, endY, nodeName, nodeNum){
	$.ajax({
		method:"GET",
		url:"https://apis.openapi.sk.com/tmap/routes/distance?version=1&format=xml",
		async:false, 
		data:{
			"startX" : startX,
			"startY" : startY,
			"endX" : endX,
			"endY" : endY,
			"reqCoordType" : "WGS84GEO",
			"appKey" : "9fbe3ae8-c33c-4b03-b618-77bab5761e9e"
		},
		success:function(response){
			prtcl = response;
			var prtclString = new XMLSerializer().serializeToString(prtcl);
		    xmlDoc = $.parseXML( prtclString ),
		    $xml = $( xmlDoc ),
		    $intRate = $xml.find("distanceInfo");
			var distances = $intRate[0].getElementsByTagName("distance")[0].childNodes[0].nodeValue;
			if (distances*1 < distance*1) {
				distance = distances;
				if (divs == 1) {
					startNodeNum = nodeNum;
					startNodeName = nodeName;
					startNodeXpoint = endY;
					startNodeYpoint = endX;
				} else if(divs == 2) {
					endNodeNum = nodeNum;
					endNodeName = nodeName;
					endNodeXpoint = endY;
					endNodeYpoint = endX;
				}
			}
			if (divs == 3) {
				startToVia = distances;
			}
			if (divs == 4) {
				endToVia = distances;
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function getViaNode(){
	isRunGetVia = true;
	$.ajax({
		url : "getNodeDiv2",
		method : "POST",
		data : {},
		success : function(data) {
			var count = 0;
			var count2 = 0;
			var max = data.length;
			var dis1 = 4200000;
			var dis2 = 4200000;
			var dis3 = 4200000;
			var distanceget = setInterval(function() {
				console.log(count);
				if (data[count].n_name != startNodeName && data[count].n_name != endNodeName) {
					getDistance(3, startNodeYpoint, startNodeXpoint, data[count].n_xy.split(",")[1], data[count].n_xy.split(",")[0], data[count].n_name, data[count].n_num);
					getDistance(4, endNodeYpoint, endNodeXpoint, data[count].n_xy.split(",")[1], data[count].n_xy.split(",")[0], data[count].n_name, data[count].n_num);
					console.log("node: "+data[count].n_name+"\ntotal:"+(startToVia*1 + endToVia*1));
					if ((startToVia*1 + endToVia*1) < dis1) {
						dis1 = (startToVia*1 + endToVia*1);
						via2NodeNum = via1NodeNum;
						via2NodeName = via1NodeName;
						via2NodeXpoint = via1NodeXpoint;
						via2NodeYpoint = via1NodeYpoint;
						via1NodeNum = data[count].n_num;
						via1NodeName = data[count].n_name;
						via1NodeXpoint = data[count].n_xy.split(",")[0];
						via1NodeYpoint = data[count].n_xy.split(",")[1];
					} else if ((startToVia*1 + endToVia*1) < dis2) {
						dis2 = (startToVia*1 + endToVia*1);
						via3NodeNum = via2NodeNum;
						via3NodeName = via2NodeName;
						via3NodeXpoint = via2NodeXpoint;
						via3NodeYpoint = via2NodeYpoint;
						via2NodeNum = data[count].n_num;
						via2NodeName = data[count].n_name;
						via2NodeXpoint = data[count].n_xy.split(",")[0];
						via2NodeYpoint = data[count].n_xy.split(",")[1];
					} else if ((startToVia*1 + endToVia*1) < dis3) {
						dis3 = (startToVia*1 + endToVia*1);
						via3NodeNum = via2NodeNum;
						via3NodeName = via2NodeName;
						via3NodeXpoint = via2NodeXpoint;
						via3NodeYpoint = via2NodeYpoint;
						via2NodeNum = data[count].n_num;
						via2NodeName = data[count].n_name;
						via2NodeXpoint = data[count].n_xy.split(",")[0];
						via2NodeYpoint = data[count].n_xy.split(",")[1];
					}
					count2++;
					console.log("rank: "+via1NodeName+","+via2NodeName+","+via3NodeName);
				}
				count++;
				if (count == max) {
					clearTimeout(distanceget);
					$("#via1").text(via1NodeName+" 경유 "+ dis1 + "m");
					$("#via2").text(via2NodeName+" 경유 "+ dis2 + "m");
					$("#via3").text(via3NodeName+" 경유 "+ dis3 + "m");
					$('#viaNodes').css("display", "block");
					$('#viaBlank').css("display", "none");
//					$("#via1").text("대전물류센터 경유 35565m");
//					$("#via2").text("대구물류센터 경유 42654m");
//					$("#via3").text("강남물류센터 경유 94564m");
//					via3NodeNum = 5;
//					via3NodeName = "대전물류센터";
//					via3NodeXpoint = "36.334398";
//					via3NodeYpoint = "127.432112";
//					via2NodeNum = 7;
//					via2NodeName = "대구물류센터";
//					via2NodeXpoint = "35.875885";
//					via2NodeYpoint = "128.596129";
//					via1NodeNum = 2;
//					via1NodeName = "강남물류센터";
//					via1NodeXpoint = "37.498165";
//					via1NodeYpoint = "127.028308";
					isRunGetVia = false;
				}
			}, 1000);
		}
	})
}



//도로명 주소 API
function goPopup(div) {
	var pop = window.open("/teamProject/popup/jusoPopup.jsp?div="+ div, "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
//	if (div == 1) {
//		jusoCallBack1("서울특별시 서초구 반포대로 3", "","06711");
//	} else if(div == 2){
//		jusoCallBack2("부산광역시 동구 중앙대로196번길 10","","48821");
//	}
}

function jusoCallBack1(roadAddrPart1, addrDetail, zipNo) {
	$("#roadAddrPart1").val(roadAddrPart1);
	$("#addrDetail1").val(addrDetail);
	$("#zipNo1").val(zipNo);
	getStartNode(roadAddrPart1);
//	$("#startNode").val("강북물류센터");
//	$("#n_start").val(3);
//	startNodeNum = 3;
//	startNodeName = "강북물류센터";
//	startNodeXpoint = '37.555442';
//	startNodeYpoint = '126.936119';
	
//	if (startNodeName != '' && endNodeName != '' && isRunGetVia == false) {
//		 getViaNode();
//	}
}

function jusoCallBack2(roadAddrPart1, addrDetail, zipNo) {
	$("#roadAddrPart2").val(roadAddrPart1);
	$("#addrDetail2").val(addrDetail);
	$("#zipNo2").val(zipNo);
	getEndNode(roadAddrPart1);
//	$("#endNode").val("부산물류센터");
//	$("#n_end").val(9);
//	endNodeNum = 9;
//	endNodeName = "부산물류센터";
//	endNodeXpoint = '35.115069';
//	endNodeYpoint = '129.042064';
//	
//	if (startNodeName != '' && endNodeName != '' && isRunGetVia == false) {
//		 getViaNode();
//	}
}


function rootSearch(i) {
	if (map != '') {
		map.destroy();
	}
	var d = new Date();
	var t = '';
	t += d.getFullYear();
	if ((d.getMonth()+'').length == 1) {
		t = t +'0'+ (d.getMonth()+1);
	} else {
		t += (d.getMonth()+1);
	}
	if ((d.getDate()+'').length == 1) {
		t = t +'0'+ (d.getDate());
	} else {
		t += (d.getDate());
	}
	t += d.getHours();
	if ((d.getMinutes()+'').length == 1) {
		t = t +'0'+ (d.getMinutes());
	} else {
		t += (d.getMinutes());
	}
	var viaX = '';
	var viaY = '';

	switch (i) {
	case 1:
		viaX = via1NodeXpoint;
		viaY = via1NodeYpoint;
		$('#n_via').val(via1NodeNum*1);
		break;
	case 2:
		viaX = via2NodeXpoint;
		viaY = via2NodeYpoint;
		$('#n_via').val(via2NodeNum*1);
		break;
	case 3:
		viaX = via3NodeXpoint;
		viaY = via3NodeYpoint;
		$('#n_via').val(via3NodeNum*1);
		break;
	}
	
	getXYpoint($('#roadAddrPart2').val());
	initTmap(startNodeXpoint, startNodeYpoint, viaX, viaY, endNodeXpoint, endNodeYpoint, lon, lat, t);
	avgDelevery();
	$('#rootSearch').css("display", "none");
	$('#rootSearchResult').css("display", "block");
}

function avgDelevery(){
	$.ajax({
		type : "POST",
		url : "avgDelevery",
		data : {startNodeNum: startNodeNum,
			endNodeNum : endNodeNum
		},
		success : function(data) {
			$('#avgdate').val(data + "일");
			var today = new Date();
			var year = today.getFullYear() + "";
			year = year.substring(2);
			var month =  today.getMonth()+1;
			var day = today.getDate()+(data*1);
			$('#duedate').val(year+"/"+month+"/"+day);
		}
 });
}

function chargeCal(){
	 document.getElementById('id01').style.display='none';
	 var x = $('#x').val();
	 var y = $('#y').val();
	 var z = $('#z').val();
	 var w = $('#w').val()*1;
	 var a = $('#a option:selected').val();
	 var totalLength = (x*1)+(y*1)+(z*1);
	 $.ajax({
			type : "POST",
			url : "chargeCal",
			data : {totalLength: totalLength,
				weight : w,
				area : a
			},
			success : function(data) {
				$('#w_weight').val(w);
				$('#weight').val(data.c_size);
				$('#charge').val(data.c_charge);
				$('#c_num').val(data.c_num);
			}
	 });
}
