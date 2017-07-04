<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String contextPath = request.getContextPath(); %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>실시간 매칭</title>
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
    <link rel="stylesheet" type="text/css" href="./bootstrap/css/room_style.css">
    <link rel="stylesheet" type="text/css" href="./bootstrap/css/jquery.selectlist.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="./bootstrap/js/jquery.selectlist.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
<style>
body{
background-color : #f9fbff;
}
  .room{
    width:100%;
    height:50px;
    border:2px solid;
    border-color:#147814;
    background-color:#4AB34A;
    margin-top:20px;
  }
  .roomno{
    width:10%;
    height:46px;
    line-height:46px;
    text-align:center;
    font-size:20px;
    color:black;
    font-weight:Bold;
    margin-left:5px;
    float:left;
  }
  .roomname{
    width:45%;
    text-align:center;
    font-size:10px;
    color:black;
    font-weight:Bold;
    float:left;
  }
  .roomname_sub1{
    width:100%;
    height:30px;
    line-height:30px;
    text-align:left;
    font-size:13px;
    color:black;
    font-weight:Bold;
  }
  .roomname_sub2{
    width:100%;
    height:15px;
    line-height:15px;
    text-align:left;
    font-size:10px;
    color:black;
    font-weight:Bold;
  }
  .roomtype{
    width:15%;
    height:46px;
    line-height:46px;
    text-align:center;
    font-size:20px;
    color:red;
    font-weight:Bold;
    float:left;
  }
  .roomtime{
    width:12%;
    height:46px;
    line-height:46px;
    text-align:center;
    font-size:20px;
    color:black;
    font-weight:Bold;
    float:left;
  }
  .roombtn{
    width:12%;
    height:20px;
    line-height:20px;
    text-align:center;
    float:right;
  }
  .div_selectBox{
    width:500px;
    height:70px;
    line-height:70px;
    background-color:red;
    float:left;
    margin:auto;
  }
  .makerooom{
  float:left;
  height:40px;
  line-height:40px;
  }
  
/* 버튼 스타일 */
  button {
 display: inline-block;
 outline: none;
 cursor: pointer;
 text-align: center;
 text-decoration: none;
 font: 14px/100% Arial, Helvetica, sans-serif;
 padding: .5em 2em .55em;
 text-shadow: 0 1px 1px rgba(0,0,0,.3);
 -webkit-border-radius: .5em;
 -moz-border-radius: .5em;
 border-radius: .5em;
 -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
 -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
 box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
 text-decoration: none;
}
.button:active {
 position: relative;
 top: 1px;
}

/* blue */
.blue {
	color: #d9eef7;
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
	background: -moz-linear-gradient(top,  #00adee,  #0078a5);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}
.blue:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e');
}
.blue:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));
	background: -moz-linear-gradient(top,  #0078a5,  #00adee);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee');
}

/* orange */
.orange {
	color: #fef4e9;
	border: solid 1px #da7c0c;
	background: #f78d1d;
	background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
	background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
}
.orange:hover {
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
	background: -moz-linear-gradient(top,  #f88e11,  #f06015);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
}
.orange:active {
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
	background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
}
/* white */
.white {
  color: #606060;
  border: solid 1px #b7b7b7;
  background: #fff;
  background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
  background: -moz-linear-gradient(top,  #fff,  #ededed);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
}
.white:hover {
  background: #ededed;
  background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
  background: -moz-linear-gradient(top,  #fff,  #dcdcdc);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');
}
.white:active {
  color: #999;
  background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));
  background: -moz-linear-gradient(top,  #ededed,  #fff);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');
}
/* rosy */
.rosy {
  color: #fae7e9;
  border: solid 1px #b73948;
  background: #da5867;
  background: -webkit-gradient(linear, left top, left bottom, from(#f16c7c), to(#bf404f));
  background: -moz-linear-gradient(top,  #f16c7c,  #bf404f);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f16c7c', endColorstr='#bf404f');
}
.rosy:hover {
  background: #ba4b58;
  background: -webkit-gradient(linear, left top, left bottom, from(#cf5d6a), to(#a53845));
  background: -moz-linear-gradient(top,  #cf5d6a,  #a53845);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#cf5d6a', endColorstr='#a53845');
}
.rosy:active {
  color: #dca4ab;
  background: -webkit-gradient(linear, left top, left bottom, from(#bf404f), to(#f16c7c));
  background: -moz-linear-gradient(top,  #bf404f,  #f16c7c);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#bf404f', endColorstr='#f16c7c');
}

/* green */
.green {
  color: #e8f0de;
  border: solid 1px #538312;
  background: #64991e;
  background: -webkit-gradient(linear, left top, left bottom, from(#7db72f), to(#4e7d0e));
  background: -moz-linear-gradient(top,  #7db72f,  #4e7d0e);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#7db72f', endColorstr='#4e7d0e');
}
.green:hover {
  background: #538018;
  background: -webkit-gradient(linear, left top, left bottom, from(#6b9d28), to(#436b0c));
  background: -moz-linear-gradient(top,  #6b9d28,  #436b0c);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#6b9d28', endColorstr='#436b0c');
}
.green:active {
  color: #a9c08c;
  background: -webkit-gradient(linear, left top, left bottom, from(#4e7d0e), to(#7db72f));
  background: -moz-linear-gradient(top,  #4e7d0e,  #7db72f);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#4e7d0e', endColorstr='#7db72f');
}

/* pink */
.pink {
  color: #feeef5;
  border: solid 1px #d2729e;
  background: #f895c2;
  background: -webkit-gradient(linear, left top, left bottom, from(#feb1d3), to(#f171ab));
  background: -moz-linear-gradient(top,  #feb1d3,  #f171ab);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#feb1d3', endColorstr='#f171ab');
}
.pink:hover {
  background: #d57ea5;
  background: -webkit-gradient(linear, left top, left bottom, from(#f4aacb), to(#e86ca4));
  background: -moz-linear-gradient(top,  #f4aacb,  #e86ca4);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f4aacb', endColorstr='#e86ca4');
}
.pink:active {
  color: #f3c3d9;
  background: -webkit-gradient(linear, left top, left bottom, from(#f171ab), to(#feb1d3));
  background: -moz-linear-gradient(top,  #f171ab,  #feb1d3);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f171ab', endColorstr='#feb1d3');
}
</style>
<script>
//-------------------방 로드 -------------------------------------
$(function(){
	var $btRoomSearch = $("button[name=btn_room_search]");
	$btRoomSearch.click(function(){	
		var $sport_name = document.getElementById("sport_name").value;
	    var $gu = document.getElementById("gu").value;
        console.log($sport_name + ":" + $gu);
		var url="roomload.do";		
		console.log(url);
      	$.ajax({	url: url,
					method: 'POST',
					data:{"sport_name":$sport_name, "gu":$gu},
					success: function(responseData){
						var data = responseData.trim();
		                var $parentObj = $("#div_room_list");
		                if(data == '0'){
    						alert("로그인 후 이용해주세요.");
    					} else{
    						if($parentObj.length == 0){ //article영역의 유무에 따라 출력
    			                   $parentObj = $("body");
    			                }
    			                //$parentObj.remove(); //객체 자체를 지워버리기
    			                $parentObj.empty(); //객체는 있지만 기존내용 clear하고
    	 		                $parentObj.html(responseData); //검색결과 출력
    			             }
		                }
      	});
      	return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
    });
});

//-------------- 지역별 업체명 찾기 ----------------------------
function guFunction(gu) {
    var $sport_name = document.getElementById("sport_center").value;
    var $gu = document.getElementById("gu_center").value;
    console.log($sport_name);
    console.log($gu);
    var url = "searchcenter.do";
    $.ajax({url : url,
          method : 'POST',
          data : {"sport_name" : $sport_name, "gu" : $gu},
             success : function(responseData) {
                var $parentObj = $("#div_center");
                $parentObj.empty(); 
                var html = '<span style="float:left;"><B>상호 : </B></span>';
                html += '&nbsp;&nbsp;';
                html += '<select class="form-control" id="name_center">';
                $.each(responseData, function(key, value) {
                   html += '<option value="'+value+'">'+ value + '</option>';
                });
                html += '</select>';
                document.getElementById("div_center").innerHTML = html;
             }
          });
    return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
 }	
 
//-------------------방 생성 -------------------------------------
$(function(){
	var $btRoomMake = $("button[name=btn_room_make]");
	$btRoomMake.click(function(){
		console.log("방생성하기 클릭");
		var $sport_name = $("select[id=sport_center]").val();
		var $gu = $("select[id=gu_center]").val();
		var $center_name = $("select[id=name_center]").val();
		var $match_type = $("select[id=match_type]").val();
		var $level = $("input[name=options]:checked").val();

        console.log($sport_name + ":" + $gu + ":" + $center_name + ":" + $match_type + ":" + $level);
		var url="roommake.do";		
		console.log(url);
		
		var popup = window.open("about:blank", "채팅방", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
		if(popup == null){
			alert("팝업 차단기능 혹은 팝업차단 프로그램이 동작중입니다. 팝업 차단 기능을 해제한 후 다시 시도하세요.");
		} else {
			$.ajax({	url: url,
				method: 'POST',
				data:{"sport_name":$sport_name, "gu":$gu, "center_name":$center_name, "match_type":$match_type, "level":$level},
				success: function(responseData){	
					var data = responseData.trim(); //공백을 없애기위해
					if(data == '0'){
						alert("이미 방이 존재합니다.");
					} else{
						location.href="matching.do";
						window.open("http://192.168.12.25:8889/Project3/broadcast.html", "채팅방", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
					}
						
				} 
  	});
		}
      	return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
    });
});

//-------------------방 입장 -------------------------------------
$(function(){
	var $btRoomIn = $("button[name=btn_room_In]");
	$btRoomIn.click(function(){
		console.log("방입장하기 클릭");
		var $room_no = $(this).parent().siblings().children(".shape-text").text();
		var $room_id = $room_no.trim();
        console.log("room_id : "+$room_id);
		var url="roomin.do";		
		console.log(url);
      	$.ajax({	url: url,
					method: 'POST',
					data:{"room_id":$room_id},
					success: function(responseData){	
						var popup = window.open("about:blank", "채팅방", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
    					var data = responseData.trim(); //공백을 없애기위해
    					if(data == '0'){
    						alert("입장 할 수 없습니다.");
    					} else{
    						if(popup == null){
    							alert("팝업 차단기능 혹은 팝업차단 프로그램이 동작중입니다. 팝업 차단 기능을 해제한 후 다시 시도하세요.");
    						} else{
    						location.href="matching.do";
    						window.open("http://192.168.12.25:8889/Project3/broadcast.html", "채팅방", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
    						}}
    				} 
      	});
      	return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
    });
});

</script>
</head> 

<body>
<header style="margin-bottom:70px;">
     <jsp:include page="menu.jsp"></jsp:include>
</header>

<article>
<div id = "title"  style= "text-align: center; "> 
  <h1 style = "font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf;">실시간 매칭</h1></div>


<div class="form-group">
<c:set var="sport" value="${requestScope.list_sport }"/>
<c:set var="gu" value="${requestScope.list_gu }"/>
<c:set var="sport_name" value="${requestScope.sport_name }"/>
<c:set var="gu_name" value="${requestScope.gu }"/>
  <form class="form-inline" style="margin:auto; width:500px; border:2px solid; padding:10px; border-color: #7f7f7f; border-radius: 10px;">
  <img src="./bootstrap/assets/images/icon_select.png" alt="image" style="width:40px; height:40px; vertical-align:middle;">
  <span><B>검색목록</B></span>
  <div class="form-group">
  &nbsp;&nbsp;
    <select class="form-control" id="sport_name">
    <c:if test="${sport_name != null }">
             <option id="sport_name">${sport_name } </option>
             </c:if>
    <c:forEach var="s" items="${sport}">
            <c:if test="${s != sport_name }">
              <option id="sport_name" value="<c:out value="${s}"/>"><c:out value="${s}"/></option>
          </c:if>
      </c:forEach>
    </select>
  </div>
<div class="form-group">&nbsp;&nbsp;&nbsp;
   <select class="form-control" id="gu">
    <c:if test="${gu_name != null }">
             <option id="gu_name">${gu_name } </option>
             </c:if>
      <c:forEach var="g" items="${gu}">
             <c:if test="${g != gu_name }">
              <option id="gu_name" value="<c:out value="${g}"/>"><c:out value="${g}"/></option>
          </c:if>
      </c:forEach>
   </select>
  </div>
  &nbsp;&nbsp;&nbsp;
  <div class="form-group">
 <button type="submit" name="btn_room_search" class="blue">
  <span class="glyphicon glyphicon-search" aria-hidden="true">&nbsp;검색</span> 
  </button>
  </div>
</form>
</div>

<div class="form-group" style="margin:auto; width:500px; padding-bottom:20px;">
  <button type="submit" style="float:right;" class="orange">
  <span class="glyphicon glyphicon-plus" aria-hidden="true" data-toggle="modal" data-target="#myModal">&nbsp;방만들기</span> 
  </button>
  </div>
  
<hr>

<div id="div_roomlist" style="width:700px; margin:0 auto; font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf;">
<!-- 채팅방  -->
<c:set var = "roomlist" value = "${requestScope.roomInfo }"/>
<c:choose>
               <c:when test="${ empty requestScope.roomInfo }">
            
               <h3 style="text-align:center;">해당되는 채팅방이 존재하지 않습니다.</h3>
               </c:when>
               <c:otherwise>            
<!--                <div class="bs-calltoaction bs-calltoaction-warning">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">Its a Call To Action</h1>
                            <div class="cta-desc">
                                <p>Describe the action here.</p>
                                <p>Describe the action here.</p>
                                <p>Describe the action here.</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-warning">Go for It!</a>
                        </div>
                     </div>
                </div> -->
            <c:forEach var = "room" items = "${roomlist }">
			<div class="col-md-12" style="margin-bottom:10px;">
				<div class="offer offer-primary">
					<div class="shape">
						<div class="shape-text">
							${room["room_id"]}						
						</div>
					</div>
					<div class="offer-content">
						<h4 class="lead">
							${room["center_name"]}
						</h4>
                        <p>${room["gu"]} ${room["dong"]} ${room["adress"]}</p>				
						<p style="float:left;">
                           매칭 타입 :  ${room["match_type"]} <br>
                           실력&수준 :  ${room["level"]}
						</p>
                         <button type="submit" name="btn_room_In" class="white" style="float:right;">입장</button>
					</div>
				</div>
			</div>
        </c:forEach>
 </c:otherwise>
 </c:choose>
               
</div>             

<!-- 방만들기 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">방 만들기</h4>
      </div>
      <div class="modal-body">
      <form class="form-inline" style="margin:auto; width:500px; padding:10px;"> 
        <div class="form-group">
         <span><B>종목 : </B></span> &nbsp;
          <select class="form-control" id="sport_center">
            <c:forEach var="s" items="${sport}">
               <option value="${s}">${s}</option>
            </c:forEach>
          </select>
        </div>
        &nbsp;&nbsp;
        <div class="form-group">
        <span><B>지역 : </B></span> &nbsp;&nbsp;
           <select class="form-control" id="gu_center" onchange="guFunction(this.value)">
              <c:forEach var="g" items="${gu}">
              <option value="${g}">${g}</option>
              </c:forEach>
           </select>
        </div>
      </form>
      
      
      <form class="form-inline" style="margin:auto; width:500px; padding:10px;"> 
        <div class="form-group" id="div_center">
         <span><B>상호 : </B></span> &nbsp;&nbsp;
         <select class="form-control" id="name_center">
                              <option>상호명</option>
                              </select>
      </div>  
      </form>
       <form class="form-inline" style="margin:auto; width:500px; padding:10px;"> 
      <div class="form-group">
         <span><B>매칭 타입 : </B></span> &nbsp;&nbsp;
          <select class="form-control" id="match_type">
              <option>1vs1</option>
              <option>2vs2</option>
              <option>3vs3</option>
              <option>4vs4</option>
              <option>5vs5</option>
          </select>
      </div>
      </form>
      <form class="form-inline" style="margin:auto; width:500px; padding:10px;">
      <div class="form-group">
      <span><B>실력/수준 : </B></span> &nbsp;&nbsp;
      <div class="btn-group" data-toggle="buttons" id="level">
        <label class="btn btn-primary active">
          <input type="radio" name="options" id="row" autocomplete="off" value="하" checked>하
        </label>
        <label class="btn btn-primary">
          <input type="radio" name="options" id="mid" autocomplete="off" value="중">중
        </label>
        <label class="btn btn-primary">
          <input type="radio" name="options" id="high" autocomplete="off" value="상">상
        </label>
      </div>
    </div>  
        </form>
         </div> <!-- modal body END -->  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" name="btn_room_make">생성</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</article>	
         <footer class="footer text-center" style="position: absolute; top: 90%; width: 100%;">
        <div class="container">
            <!--/* This template is released under the Creative Commons Attribution 3.0 License. Please keep the attribution link below when using for your own project. Thank you for your support. :) If you'd like to use the template without the attribution, you can check out other license options via our website: themes.3rdwavemedia.com */-->
            <small class="copyright">본 웹 페이지는 현재 FairPlay 팀에서 운영하고 있는 생활체육 검색 시스템이 적용 되어 있습니다. <br>
                            사업자등록번호 : 123-45-6789  통신판매업신고 : 제 1234-서울금천-12345호<br>
                      서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차 401호 ㈜ 우리동네 예체능 (대표자 : 윤웅재)<br>
                      고객센터 1234-5678 (평일 오전 8시 ~ 오후 8시 / 주말 및 공휴일 오전 9시 ~ 오후 6시)<br>
                       copyright ⓒ 2017. ALL RIGHTS RESERVED BY KITRI FairPlay</small>
            
        </div><!--//container-->
    </footer>
    <!-- Javascript -->          
    <script type="text/javascript" src="./bootstrap/assets/plugins/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="./bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./bootstrap/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="./bootstrap/assets/js/main.js"></script>  
</body>
</html> 
