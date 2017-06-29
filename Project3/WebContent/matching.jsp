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
    <link rel="stylesheet" type="text/css" href="./bootstrap/css/jquery.selectlist.css">
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="./bootstrap/js/jquery.selectlist.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
<style>
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
		                var $parentObj = $("article");
		                if($parentObj.length == 0){ //article영역의 유무에 따라 출력
		                   $parentObj = $("body");
		                }
		                //$parentObj.remove(); //객체 자체를 지워버리기
		                $parentObj.empty(); //객체는 있지만 기존내용 clear하고
 		                $parentObj.html(responseData); //검색결과 출력
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
      	$.ajax({	url: url,
					method: 'POST',
					data:{"sport_name":$sport_name, "gu":$gu, "center_name":$center_name, "match_type":$match_type, "level":$level},
					success: function(responseData){	
    					var data = responseData.trim(); //공백을 없애기위해
    					if(data == '0'){
    						alert("이미 방이 존재합니다.");
    					} else{
    						location.href="matching.do";
    						window.open("http://localhost:8888/Project3/broadcast.html", "채팅방", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
    					}
    				} 
      	});
      	return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
    });
});

//-------------------방 입장 -------------------------------------
$(function(){
	var $btRoomIn = $("button[name=btn_room_In]");
	$btRoomIn.click(function(){
		console.log("방입장하기 클릭");
		var $room_id = $(this).parent().siblings(".roomno").text();

        console.log("room_id : "+$room_id);
		var url="roomin.do";		
		console.log(url);
      	$.ajax({	url: url,
					method: 'POST',
					data:{"room_id":$room_id},
					success: function(responseData){	
    					var data = responseData.trim(); //공백을 없애기위해
    					if(data == '0'){
    						alert("입장 할 수 없습니다.");
    					} else{
    						location.href="matching.do";
    						window.open("http://localhost:8888/Project3/broadcast.html", "채팅방", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
    					}
    				} 
      	});
      	return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
    });
});

</script>
</head> 

<body>
<header>
     <jsp:include page="menu.jsp"></jsp:include>
</header>

<article style="padding:20px;">
<div class="form-group">
<c:set var="sport" value="${requestScope.list_sport }"/>
<c:set var="gu" value="${requestScope.list_gu }"/>
  <form class="form-inline" style="margin:auto; width:500px; border:2px solid; padding:10px; border-color: #7f7f7f; border-radius: 10px;">
  <img src="./bootstrap/assets/images/icon_select.png" alt="image" style="width:40px; height:40px; vertical-align:middle;">
  <span><B>검색목록</B></span>
  <div class="form-group">
  &nbsp;&nbsp;
    <select class="form-control" id="sport_name">
    <c:forEach var="s" items="${sport}">
             <option value="${s}">${s}</option>
      </c:forEach>
    </select>
  </div>
<div class="form-group">&nbsp;&nbsp;&nbsp;
   <select class="form-control" id="gu">
      <c:forEach var="g" items="${gu}">
             <option value="${g}">${g}</option>
      </c:forEach>
   </select>
  </div>
  &nbsp;&nbsp;&nbsp;
  <div class="form-group">
  <button type="submit" name="btn_room_search">
  <span class="glyphicon glyphicon-search" aria-hidden="true">&nbsp;검색</span> 
  </button>
  </div>
</form>
</div>

<div class="form-group" style="margin:auto; width:500px; padding-bottom:20px;">
  <button type="submit" class="btn btn-info" style="float:left;" name="btn_room_refresh">
  <span class="glyphicon glyphicon-refresh" aria-hidden="true">&nbsp;새로고침</span> 
  </button>
  <button type="submit" style="float:right;">
  <span class="glyphicon glyphicon-plus" aria-hidden="true" data-toggle="modal" data-target="#myModal">&nbsp;방만들기</span> 
  </button>
  </div>
  
<hr>

<div id="div_roomlist" style="width:500px; margin:0 auto;">

<!-- 채팅방  -->
<c:set var = "roomlist" value = "${requestScope.roomInfo }"/>
<c:choose>
               <c:when test="${ empty requestScope.roomInfo }">
            
               <h3>해당되는 채팅방이 존재하지 않습니다.</h3>
               </c:when>
               <c:otherwise>
               
              

<c:forEach var = "room" items = "${roomlist }">
<form class="room">
  <div class="roomno">${room["room_id"]}</div>
  <div class="roomname">
      <div class="roomname_sub1">
                  ${room["center_name"]}
      </div>
      <div class="roomname_sub2">
                  ${room["gu"]} ${room["dong"]} ${room["adress"]}
      </div>
  </div>
  <div class="roomtype">${room["match_type"]}</div>
  <div class="roomtime">${room["level"]}</div>
  <div class="roombtn">
  <button type="submit" name="btn_room_In">입장</button>
  </div>
</form>
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
     
    <!-- Javascript -->          
    <script type="text/javascript" src="./bootstrap/assets/plugins/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="./bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./bootstrap/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="./bootstrap/assets/js/main.js"></script>  
</body>
</html> 
