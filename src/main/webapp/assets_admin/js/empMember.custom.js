$(function () {
	    if ($("#radial-chart").length) {
	        a = {
	            chart: {
	                height: 230,
	                type: "radialBar"
	            },
	            series: [chaebin],
	            colors: ["#696ffb"],
	            plotOptions: {
	                radialBar: {
	                    hollow: {
	                        margin: 0,
	                        size: "70%",
	                        background: "rgba(255,255,255,0.1)"
	                    },
	                    track: {
	                        dropShadow: {
	                            enabled: !0,
	                            top: 2,
	                            left: 0,
	                            blur: 4,
	                            opacity: .02
	                        }
	                    },
	                    dataLabels: {
	                        name: {
	                            offsetY: -10,
	                            color: "#adb5bd",
	                            fontSize: "13px"
	                        },
	                        value: {
	                            offsetY: 5,
	                            color: "#000",
	                            fontSize: "20px",
	                            show: !0
	                        }
	                    }
	                }
	            },
	            fill: {
	                type: "gradient",
	                gradient: {
	                    shade: "dark",
	                    type: "vertical",
	                    gradientToColors: ["#87D4F9"],
	                    stops: [0, 100]
	                }
	            },
	            stroke: {
	                lineCap: "round"
	            },
	            labels: ["Progress"]
	        };
	        (r = new ApexCharts(document.querySelector("#radial-chart"), a)).render()
	    }
	});

function clickRadio(num, q){
	$('#quality_'+num).val(q);
}

function passParcel(ds_num, emp, quality){ //택배번호, 다음직원번호, 택배품질
	
	var cn = $('#cn').val(); //현재 택배가 있는 간선지구분(start, via, end)
	var receiver = $('#receiver'+ds_num).val();
	var receiverLoaction = $('#receiveLocation'+ds_num).val();
	
	console.log(ds_num+","+emp+","+ quality+","+cn+","+receiver+","+receiverLoaction);
	
	$.ajax({
         url      	:"passParcel",
         method   	: "POST",
         data   	: {emp : emp,
        	 		   quality : quality,
        	 		   ds_num : ds_num,
        	 		   cn 	: cn,
        	 		  receiver	: receiver,
        	 		 receiverLoaction : receiverLoaction
	        		  },
         success  	: function(data){
        	 
        	 if (data == 1) {
				alert("넘기기 성공");
			}else if(data == 0){
				alert("고객전달 성공");
			} else {
				alert("실패");
			}
        	 $('#'+ds_num+'row').remove();
        	 
         }
	})
}