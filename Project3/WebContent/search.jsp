<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ee -->
<title>searching.jsp</title>
<!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 website landing page for developers and startups">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Global CSS -->
    <link rel="stylesheet" href="./bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="./bootstrap/assets/plugins/font-awesome/css/font-awesome.css">
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="./bootstrap/assets/css/styles.css">
	<!-- Search CSS -->
	<link rel="stylesheet" type="text/css" href="search.css?ver=1"> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script>		
		/********************검색버튼*************************/
		function search() {
			var $sport_name = document.getElementById("sport").value;
			var $gu = document.getElementById("gu").value;
			var $dong = $("select[id=select_dong]").val();
			console.log($sport_name);
			console.log($gu);
			console.log($dong);
			var url = "searchdetail.do";
			$.ajax({
				url : url,
				method : 'POST',
				data : {"sport_name" : $sport_name, "gu" : $gu, "dong" : $dong},
				success : function(responseData) {
					var data = responseData.trim(); //공백을 없애기위해
					if (data == '1') {
						alert("");
					}else {
						var $parentObj = $(".article");
						if ($parentObj.length == 0) { //article영역의 유무에 따라 출력
							$parentObj = $("body");
						}
						//$parentObj.remove(); //객체 자체를 지워버리기
						$parentObj.empty(); //객체는 있지만 기존내용 clear하고
						$parentObj.html(responseData.trim()); //검색결과 출력
						console.log("검색완료");
					}
				}
			});
			return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
		}
		
		
		/********************select바 '구' 선택 시 '동' 선택*************************/
		function myFunction(gu) {
			var $sport_name = document.getElementById("sport").value;
			var $gu = document.getElementById("gu").value;
			console.log($sport_name);
			console.log(gu);
			var url = "searchdong.do";
			$.ajax({url : url,
					method : 'POST',
					data : {"sport_name" : $sport_name, "gu" : gu},
						success : function(responseData) {
							var $parentObj = $("#div_dong");
							$parentObj.empty(); 
							var html = '&nbsp;&nbsp;';
							html += '<select class="form-control select_dong hierarchy" name="second" data-target="third" id="select_dong">';
							$.each(responseData, function(key, value) {
								html += '<option id="dong" value="'+value+'">'+ value + '</option>';
							});
							html += '</select>';
							document.getElementById("div_dong").innerHTML = html;
						}
			});
			return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
		}
		
		/********************좋아요버튼*************************/
		function like(center_id) {
			var $onId = "bt_likeOff"+center_id;
			var $offId = "bt_likeOn"+center_id;
		  	document.getElementById($onId).style.display = "none";
		  	document.getElementById($offId).style.display = "block";
		  	
		  	var url = "searchlike.do";
			$.ajax({url : url,
					method : 'POST',
					data : {"center_id" : center_id},
					success : function(data) {
						if(data == 1){
	                    	alert("관심목록 등록.")
	                    }else if (data == 2){
	                    	alert("이미 등록된 곳입니다.")
	                    }else{
	                    	alert("최대 5개까지만 등록 가능합니다.")
	                    }
					}
			});
			return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
		}
		
		/********************예약버튼*************************/
		function reserve(booking_site) {
			//alert(booking_site);
			var str = booking_site;
			var res = str.split(",");
			var $booking = res[0];
			var $book_site = res[1];
			if($booking == 0){
				alert("☎ 예약이 불가능합니다.");
			}else {
				location.href = "http://"+ $book_site;
			}
			return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
		}
	</script>
</head>

<body>  
<header>
<jsp:include page="menu.jsp"></jsp:include>
</header>  
<article style="padding:20px">
	<!-- ******EL****** --> 
<c:set var="sport" value="${requestScope.sports }"/>
<c:set var="sport_all" value="${requestScope.sport_name_all }"/>
<c:set var="gu" value="${requestScope.gu }"/>
<c:set var="gu_all" value="${requestScope.gu_all }"/>
<c:set var="dong" value="${requestScope.dong }"/>
<c:set var="dong_all" value="${requestScope.dong_all }"/>
<c:set var="list" value="${requestScope.list }"/>
<c:set var="latitude" value="${requestScope.latitude }"/>
<c:set var="longtitude" value="${requestScope.longtitude }"/>
<c:set var="like_list" value="${requestScope.like_list }"/>
<c:set var="size" value="${fn:length(list) }"/>


<!-- **************************종복/구/동 선택창************************* -->  
<div class="form-group select_div" style="margin:auto;padding-bottom: 20px;">
<form class="form-inline" style="margin:auto; width:auto; border:2px solid; padding:10px; border-color: #7f7f7f; border-radius: 10px;">
  <img src="./bootstrap/assets/images/icon_select.png" alt="image" style="width:40px; height:40px; vertical-align:middle;">
  <div class="form-group">&nbsp;&nbsp;  
	<select class="form-control " id="sport">
		<c:if test="${sport != null }">
			<option id="sport_name">${sport } </option>
		</c:if>
		<c:forEach var="n" items="${sport_all}" varStatus="status">
		    <c:if test="${n != sport }">
		     	<option id="sport_name" value="<c:out value="${n}"/>"><c:out value="${n}"/></option>
		    </c:if>
		</c:forEach>
	</select>
  </div>
  <div class="form-group">&nbsp;&nbsp;
	<select class="form-control hierarchy" name="first" data-target="second" onchange="myFunction(this.value)" id="gu">
		<c:if test="${gu != null }">
			<option id="gu">${gu }</option>
		</c:if>
		<c:forEach var="g" items="${gu_all}" varStatus="status">
			<c:if test="${g != gu }">
		    	<option id="gu" value="${g}" value="<c:out value="${g}"/>"><c:out value="${g}"/></option>
		    </c:if>
		</c:forEach>
	</select>
  </div>
  <div class="form-group" id="div_dong">&nbsp;&nbsp;
	<select class="form-control select_dong hierarchy" name="second" data-target="third" id="select_dong">
		<c:if test="${dong != null }">
			<option id="dong" value="${dong }">${dong }</option>
		</c:if>
		<c:forEach var="d" items="${dong_all}" varStatus="status">
			<c:if test="${d != dong }">
				<option id="dong" value="${d}" value="<c:out value="${d}"/>"><c:out value="${d}"/></option>
			</c:if>
		</c:forEach>
	</select>
  </div>&nbsp;&nbsp;
  <div class="form-group">
	  <button type="button" class="blue" onclick="search()">
	  	<span class="glyphicon glyphicon-search" aria-hidden="true">&nbsp;검색</span> 
	  </button>
  </div>
</form>
</div>


<hr>

<!-- **************************센터목록 리스트************************* -->
<c:choose>
<c:when test="${size > 0 }">
   <div class="form-inline div_list container">
         
      <c:forEach var="p" items="${list}" varStatus = "status">  
      <c:if test="${p.center_id == null }">
      	<div id="search_none">
      		<img src="./bootstrap/assets/images/search_none.png">
    	</div>
      </c:if>
      <!-- <div class="row"> -->
      <div class="teduri col-sm-6 col-md-4 col-lg-3 mt-4">  
		<!-- <form class="form-inline center_list" style="width:100%;margin:auto;height:100%;"> -->
			<div class="thecard">
				<div class="card-img">
					<img src="${p.image_url }" style="width: 100%; max-width: 760px; vertical-align: middle;">
				</div>
				<div class="card-caption">
					<div>
					   	<button class="bt_likeOff" id="bt_likeOff${p.center_id }" type="button" value="${p.center_id }" onclick="like(this.value)">
							<img id="bt_likeOff2" src="./bootstrap/assets/images/bt_likeOff.png">
						</button>
						<button class="bt_likeOn" id="bt_likeOn${p.center_id }" type="button" value="${p.center_id }" style="display:none">
							<img src="./bootstrap/assets/images/bt_likeOn.png">
						</button>
					</div>
					<c:forEach var="l" items="${like_list}" varStatus = "status">
						<c:if test="${l.center_id == p.center_id}">
							<div>
								<button class="bt_likeOff" id="bt_likeOff${p.center_id }" type="button" value="${p.center_id }" style="display:none">
									<img id="bt_likeOff2" src="./bootstrap/assets/images/bt_likeOff.png">
								</button>
								<button class="bt_likeOn" id="bt_likeOn${p.center_id }" type="button" value="${p.center_id }" onclick="like(this.value)" style="display:block">
									<img src="./bootstrap/assets/images/bt_likeOn.png">
								</button>				
						    </div>
					    </c:if>
					</c:forEach>
					
					<!-- <span class="date">010-1234-5678</span> -->
					<div class="div_h"><h1 class = "center_name" >${p.center_name }</h1></div>
					<p style="font-weight: bold;">${p.gu } ${p.dong } ${p.adress }</p>
					<c:choose>
						<c:when test="${p.price == 0 }">
							<p style="font-weight: bold;">가격정보가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<p style="font-weight: bold;">기본요금 : ${p.price }원</p>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${p.call_no == null }">
							<p style="font-weight: bold;">전화번호 정보가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<p style="font-weight: bold;">Tel. ${p.call_no }</p>
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="center_id" value="${p.center_id }" readonly>
					<button class="bt_gps btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"  type="button" value="${p.sport_name},${p.center_name},${p.gu},${p.dong},${p.latitude},${p.longtitude}" id="btGps${p.center_id }" onclick="gpsMap(this.value)" style="background-color: white;border:none; outline: none;">
						<img src="./bootstrap/assets/images/btgps.png">
					</button>	
					<!-- ************************지도 Modal*************************** -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        </div>
					      <div class="modal-body" style="padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 15px">
					      	<div id="map" style="width: 100%; height: 500px;">로딩중</div>
					      </div>
					    </div>
					  </div>
					</div>				
					<button type="button" value="${p.booking},${p.booking_site}" class="btn btn-default" onclick="reserve(this.value)">예약</button>
				</div>		    
			</div>
		<!-- </form> -->
		</div>  
		<!-- </div> -->
      </c:forEach>  
	</div >  
</c:when>
<c:otherwise>
<div class="form-inline div_list container">
	<div id="search_none" align="center" style="width: 100%;">
      	<img src="./bootstrap/assets/images/search_none.png">
    </div>
</div>
</c:otherwise>
</c:choose>
	<!-- **************************지도 리스트************************* -->
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d176cdd19165736594ab4a5e1c323d50"></script>
			<script>
			function gpsMap(sport_name_center_name_gu_dong_latitude_longtitude) {
				console.log(sport_name_center_name_gu_dong_latitude_longtitude);
				$('#map').empty();
				setTimeout(function(){
					var str = sport_name_center_name_gu_dong_latitude_longtitude;
					//alert(str);
					var res = str.split(",");
					var $sport_name = res[0];
					var $center_name = res[1];
					var $gu = res[2];
					var $dong = res[3];
					var $latitude = res[4];
					var $longtitude = res[5];

					console.log("위도: " + $latitude + ", 경도: " + $longtitude);

					var container = document.getElementById('map');
					var options = {
						center : new daum.maps.LatLng($latitude,$longtitude),
						level : 3
					};
					var map = new daum.maps.Map(container, options);
					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng($latitude,$longtitude); 

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					var iwContent = '<div style="padding:5px;">'+$center_name+'<br><a href="http://map.daum.net/link/map/'+$center_name+','+$latitude+','+$longtitude+'" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/'+$center_name+','+$latitude+','+$longtitude+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new daum.maps.LatLng($latitude,$longtitude); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);

				},2000) 
			}
			</script>
</article>

<br>
<br>
<br>
<br>
<br>
    <footer class="footer text-center" style="position: absolute;top: 1700px;width: 100%;">
        <div class="container">
            <!--/* This template is released under the Creative Commons Attribution 3.0 License. Please keep the attribution link below when using for your own project. Thank you for your support. :) If you'd like to use the template without the attribution, you can check out other license options via our website: themes.3rdwavemedia.com */-->
            <small class="copyright">본 웹 페이지는 현재 FairPlay 팀에서 운영하고 있는 생활체육 검색 시스템이 적용 되어 있습니다. <br>
            								사업자등록번호 : 123-45-6789  통신판매업신고 : 제 1234-서울금천-12345호<br>
											서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차 401호 ㈜ 우리동네 예체능 (대표자 : 윤웅재)<br>
											고객센터 1234-5678 (평일 오전 8시 ~ 오후 8시 / 주말 및 공휴일 오전 9시 ~ 오후 6시)<br>
											 copyright ⓒ 2017. ALL RIGHTS RESERVED BY KITRI FairPlay</small>
            
        </div><!--//container-->
    </footer>  
<!-- **************************지도 리스트************************* -->		

	<!-- Javascript -->
	<script type="text/javascript"
		src="./bootstrap/assets/plugins/jquery-1.12.3.min.js"></script>
	<script type="text/javascript"
		src="./bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="./bootstrap/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>
	<script type="text/javascript" src="./bootstrap/assets/js/main.js"></script>
	
	
</body>
</html>