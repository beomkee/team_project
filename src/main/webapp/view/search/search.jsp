<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>창식맨</title>
<script>	
// 2. API 사용요청
var endX, endY ;
function getRoot(){

//도착지 좌표
$.ajax({
	method:"GET",
	url:"https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", 
	async:false,
	data:{
		"coordType" : "WGS84GEO",
		"fullAddr" : "서울특별시 관악구 봉천동 1673-10", 
		"appKey" : "05d93f1f-6203-482f-89f0-ba7626c327fe",
	},
	
	success:function(response){
		prtcl = response;
		
		var prtclString = new XMLSerializer().serializeToString(prtcl);
		xmlDoc = $.parseXML( prtclString ),
		$xml = $( xmlDoc ),
		$intRate = $xml.find("coordinate");
			  		    
		var lon, lat;
		if($intRate[0].getElementsByTagName("lon").length>0){//구주소
			lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
		   	lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
		}else{//신주소
			lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
			lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
		}

		// 검색 결과
		endX = lon
		endY = lat
		console.log("endPoint : " + endX + ", " + endY)
	}
});

var map = new Tmap.Map({
	  div:'map_div',
	  width : "500px",
	  height : "579px",
	});
	map.setCenter(new Tmap.LonLat("127.21481221072919", "37.40395887944509").transform("EPSG:4326", "EPSG:3857"), 10);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점으로 설정합니다.

	var routeLayer = new Tmap.Layer.Vector("route");// 백터 레이어 생성
	var markerLayer = new Tmap.Layer.Markers("point");//마커 레이어 생성
	var markerWaypointLayer = new Tmap.Layer.Markers("waypoint");// 마커 레이어 생성

	map.addLayer(routeLayer);//맵에 레이어 추가
	map.addLayer(markerLayer);//map에 마커 레이어 추가
	map.addLayer(markerWaypointLayer);//map에 마커 레이어 추가

	// 간선지1
	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
	var marker_s = new Tmap.Marker(new Tmap.LonLat("${rootnode.startY}", "${rootnode.startX}").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가

	// 최종 도착
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);
	var marker_e = new Tmap.Marker(new Tmap.LonLat(endX, endY).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가

	// 간선지2
	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png />', size, offset);
	var marker = new Tmap.Marker(new Tmap.LonLat("${rootnode.viaY}", "${rootnode.viaX}").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerWaypointLayer.addMarker(marker);//마커 레이어에 마커 추가
	
	// 간선지3
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_2.png' />", size, offset);
	marker = new Tmap.Marker(new Tmap.LonLat("${rootnode.endY}", "${rootnode.endX}").transform("EPSG:4326", "EPSG:3857"), icon);
	markerWaypointLayer.addMarker(marker);
	var headers = {}; 
	headers["appKey"]="05d93f1f-6203-482f-89f0-ba7626c327fe";//AppKey(서버키)
	headers["Content-Type"]="application/json";
	$.ajax({
			method:"POST",
			headers : headers,
			url:"https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=xml",//다중 경유지안내 api 요청 url
			async:false,
			data:JSON.stringify({
				"startName" : "출발지", //출발지 명칭  
				//출발지 위경도 좌표
				"startX" : "${rootnode.startY}",
				"startY" : "${rootnode.startX}",
				"startTime" : "201708081103",//출발 시간(YYYYMMDDHHMM)
				"endName" : "목적지", //목적지 명칭
				//목적지 위경도 좌표입니다.
				"endX" : endX,
				"endY" : endY,
				//경유지 목록 입니다. 
				"viaPoints" : 
					[
						 {
							 "viaPointId" : "test01",//경유지 id
							 "viaPointName" : "nmae01",//경유지 명칭
							  //경유지의 위경도 좌표입니다.
							 "viaX" : "${rootnode.viaY}",
							 "viaY" : "${rootnode.viaX}" 
						 },
						 {
							 "viaPointId" : "test01",//경유지 id
							 "viaPointName" : "nmae01",//경유지 명칭
							  //경유지의 위경도 좌표입니다.
							 "viaX" : "${rootnode.endY}",
							 "viaY" : "${rootnode.endX}" 
						 }
						],
				"reqCoordType" : "WGS84GEO", //요청 좌표 타입
				"resCoordType" : "EPSG3857",
				"searchOption": 0//경로 탐색 옵션 
			}),
			//데이터 로드가 성공적으로 완료되었을 때 발생하는 함입니다.
			success:function(response){
				prtcl = response;
				// 결과 출력
				var innerHtml ="";
				var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
			    xmlDoc = $.parseXML( prtclString ),
			    $xml = $( xmlDoc ),
		    	$intRate = $xml.find("Document");
		    	
		    	var tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
		    	var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
		    	var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	

		    	$("#result").text(tDistance+tTime+tFare);
				
				prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
				
				routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
				
				//표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
				//벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
				routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
			        function onBeforeFeatureAdded(e) {
				        	var style = {};
				        	switch (e.feature.attributes.styleUrl) {
				        	case "#pointStyle":
					        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png";//렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
					        	style.graphicHeight = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
					        	style.graphicOpacity = 1;//외부 이미지 파일의 투명도 (0-1)입니다.
					        	style.graphicWidth = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
				        	break;
				        	default:
					        	style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
					        	style.strokeOpacity = "1";//stroke의 투명도(0~1)
					        	style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
				        	};
			        	e.feature.style = style;
			        }
				
				routeLayer.addFeatures(prtcl);//레이어에 도형을 등록합니다.
				
				map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경
			},
			//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
}

$(document).ready(function() {
	getRoot();
  }); 
</script>
</head>
<body >
      <div class="breadcrumb-area services-breadcrumb-bg">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <div class="breadcrumb-txt">
                     <span>배송 조회</span>
                     <h1>빠르고 안전한 배송</h1>
                  <div class="quote-form-section">
                     <span class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;송장번호 조회</span>
                     <!-- searchForm start -->
                     <form method="post" action="search">
                        <div class="row">
                        <div class="col-lg-1">&nbsp;</div>
                           <div class="col-lg-8">
                              <div class="form-element"><input name="w_num" type="text" placeholder="운송장 번호를 입력하세요." ></div>
                           </div>
                           <div class="col-lg-3">
                              <div class="form-element"><input type="submit" value="조회"></div>
                           </div>
                        </div>
                     </form>
                     <!-- searchForm end -->                     
                  </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="breadcrumb-overlay"></div>
      </div>
      <!-- searched number -->
          <div style="margin-top:100px;">
            <div class="container">
              <div class="row">
                <div class="col-xl-12">
                  <span class="title">조회결과</span>
                  <h2 class="subtitle">
                    ${waybill.w_num }  <!-- 송장번호 EL -->
                  </h2>
                </div>
              </div>
              <table style="width:100%;text-align: center">
                <tr style="font-size:20px;background-color:#E6FFFF;border-bottom:1px gray solid;border-top:1px #58BED3 solid;">
                <th height="55px" style="border-right:1px #D5D5D5 solid;">운송장 번호</th>
                <th style="border-right:1px #D5D5D5 solid;">보내는 분</th>
                <th style="border-right:1px #D5D5D5 solid;">받는 분</th>
                <th>상품 정보</th>
                </tr>
                <tr style="font-size:15px;border-bottom:1px #D5D5D5 solid;">
                <td height="150px" style="border-right:1px #D5D5D5 solid;">${waybill.w_num}</td>
                <td style="border-bottom:1px #D5D5D5 solid;border-right:1px #D5D5D5 solid;">${waybill.sender_nm }</td>
                <td style="border-right:1px #D5D5D5 solid;">${waybill.receiver_nm}</td>
                <td>${waybill.w_div}</td>
                </tr>
              </table>
            </div>
          </div>
            
      <!-- searched number end-->          
      <!-- search section start    -->
      <div class="faq-section">
         <div class="container">
               <div class="row">
                  <div class="col-lg-6">
                  <!-- 지도 -->
                      <div id="map_div"></div>
                  </div>
                  <div class="col-xl-6">
                     <span class="title">배송현황</span>
                     <h2 class="subtitle">${waybill.sender_add.substring(0, waybill.sender_add.indexOf("시")+1)} - ${waybill.receiver_add.substring(0, waybill.receiver_add.indexOf("시")+1)}</h2>
          <!-- accordion start -->
                  <div class="accordion" id="accordionExample">
                     <div class="card wow fadeInUp" data-wow-duration="1s">
                        <div class="card-header" id="headingOne">
                           <h2 class="mb-0">
                              <button class="btn btn-link collapsed btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              ${rootnode.startName}                         
                              </button>
                           </h2>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                           <div class="card-body">
                             내일도착예정 // 9000원 // 의류 // 상
                           </div>
                        </div>
                     </div>
                     <div class="card wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
                        <div class="card-header" id="headingTwo">
                           <h2 class="mb-0">
                              <button class="btn btn-link collapsed btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                ${rootnode.viaName}
                              </button>
                           </h2>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                           <div class="card-body">
                                                         내일도착예정 // 9000원 // 의류 // 상  
                           </div>
                        </div>
                     </div>
                     <div class="card wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
                        <div class="card-header" id="headingThree">
                           <h2 class="mb-0">
                              <button class="btn btn-link collapsed btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              ${rootnode.endName}
                              </button>
                           </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                           <div class="card-body">
                                                         내일도착예정 // 9000원 // 의류 // 상
                           </div>
                        </div>
                     </div>
                     <div class="card wow fadeInUp" data-wow-duration="1s" data-wow-delay=".6s">
                        <div class="card-header" id="headingFour">
                           <h2 class="mb-0">
                              <button class="btn btn-link collapsed btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                             ${waybill.receiver_add}
                              </button>
                           </h2>
                        </div>
                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                           <div class="card-body">
                                            내일도착예정 // 9000원 // 의류 // 상
                           </div>
                        </div>
                     </div>
                  </div>
                  </div>
               </div>
            </div>
         </div>
         
<!-- Tmap api -->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=05d93f1f-6203-482f-89f0-ba7626c327fe"></script>

</body>
</html> 