<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html> 
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>우리동네 예체능</title>
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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
    <style>
    .bt_likeOff {
	border: none;
	padding: 0px;
	margin: 0px;
}
.search {
    margin-top: -25%;
}
td {width:200px;  border: 1px solid;}
h4{
color : #ff7f00;
}
ul{
   list-style:none;
   padding-left:0px;
}
a{
  color:#ffffff;
}
#abc {
	font-style: normal;
	font-size: 16px;
	color: orange;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
	var $test = $(".sub-slide>ul>li>button");
	$test.click(function(){
		var $sports = $(this).parent().siblings("#abc").text();
		var $gu = $(this).text();		
		console.log($sports);
		console.log($gu);
		
		$.ajax({
			url : 'searchmain.do',
			data : {sports : $sports, gu : $gu},
			type : 'post',
			success : function(data){
				console.log("search.do로 이동");
				location.href ="search.do";
			}
		})//ajax
	})//클릭
})
</script>
</head> 

<body  style="background-color: #F9FFFF">
<header>
     <jsp:include page="menu.jsp"></jsp:include>
</header>
<article>			
    <div id="hero" class="hero-section" style="height: 450px;">
        
        <div id="hero-carousel" class="hero-carousel carousel carousel-fade slide" data-ride="" data-interval="10000" style="height: 450px">
            
            <!-- <div class="figure-holder-wrapper" style="height: 450px">
              <div class="container">
                  <div class="row">
                      <div class="figure-holder" style="height: 450px">
					  
                        </div>//figure-holder
                  </div>//row
              </div>//container
          </div>//figure-holder-wrapper -->
            
         
         <!-- Wrapper for slides -->
         <div class="carousel-inner">
             
            <div class="item item-1 active" style="background-image: url('./bootstrap/assets/images/234.jpg'); height: 450px">
               <div class="item-content container" style="height: 450px">
                   <div class="item-content-inner" style="height: 450px; padding-top: 95px">
						<h1 style=" font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf; margin: 0px; margin-top: 70px; width: 350px; margin: auto;">"스포츠를 디자인하다"</h1>
						<h3 style=" font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf; margin: 0px; margin-top: 70px; width: 330px; margin: auto; color: white;">실시간매칭은=우리동네 예체능</h3>
						
						<div class="dropdown" style="height:50px; margin-top: 20px">
							<button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-align:center">
									당신이 원하는 지역을 찾아보세요!!
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" >
								<div class="sub-slide">
									<ul>
										<li id="abc">당구<li>
										<li style="color: black;"><button style="outline: none;opacity: 0.6;background-color:#000000;" >마포구</button><li><br>
										<li><button>구로구</button><li><br>
										<li><button>강남구</button><li><br>
										<li><button>강서구</button><li><br>
										<li><button>중구</button><li><br>
									</ul>
								</div>
								<div class="sub-slide">
									<ul>
										<li id="abc">배드민턴<li>
										<li><button>마포구</button><li><br>
										<li><button>구로구</button><li><br>
										<li><button>강남구</button><li><br>
										<li><button>강서구</button><li><br>
										<li><button>중구</button><li><br>
									</ul>
								</div>
								<div class="sub-slide">
									<ul>
										<li id="abc">테니스<li>
										<li><button>마포구</button><li><br>
										<li><button>구로구</button><li><br>
										<li><button>강남구</button><li><br>
										<li><button>강서구</button><li><br>
										<li><button>중구</button><li><br>
									</ul>
								</div>
								<div class="sub-slide">
									<ul>
										<li id="abc">볼링<li>
										<li><button>마포구</button><li><br>
										<li><button>구로구</button><li><br>
										<li><button>강남구</button><li><br>
										<li><button>강서구</button><li><br>
										<li><button>중구</button><li><br>
									</ul>
								</div>
								<div class="sub-slide">
									<ul>
										<li id="abc">탁구<li>
										<li><button>마포구</button><li><br>
										<li><button>구로구</button><li><br>
										<li><button>강남구</button><li><br>
										<li><button>강서구</button><li><br>
										<li><button>중구</button><li><br>
									</ul>
								</div>
							</ul>
						</div> <!-- drop down-->
					
					 
                </div><!--//item-content-inner-->
               </div><!--//item-content-->
            </div><!--//item-->
            
          
         </div><!--//carousel-inner-->

      </div><!--//carousel-->
    </div><!--//hero-->
    
    <div id="about" class="about-section">
        <div class="container text-center">
         <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf">인기 장소는 바로 여기!</h3>
            <h2 class="section-title" style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >Hot Service</h2>
                        
            <div class="items-wrapper row" style="width: 1300px; margin:  auto; margin-left: 10px">
                <div class="item col-sm-4 col-xs-12" style="width: 368px; height: 297px; display: inline-block; padding: 2px"> <!-- 첫번쨰 그림  -->
                            <img class="figure-image" src="./bootstrap/assets/images/main/111.jpg" alt="image" style="width: 100%; height: 100%;">
                </div><!--//item-->
                
                <div class="item col-sm-4 col-xs-12" style="width: 368px; height: 297px; display: inline-block; padding: 2px"> <!-- 두번쨰 그림  -->
                            <img class="figure-image" src="./bootstrap/assets/images/main/2.jpg" alt="image" style="width: 100%; height: 100%;">
                </div><!--//item-->
                
                
                <div class="item col-sm-4 col-xs-12" style="width: 368px; height: 297px; display: inline-block; padding: 2px">
                            <img class="figure-image" src="./bootstrap/assets/images/main/3.jpg" alt="image" style="width: 100%; height: 100%;">
                </div><!--//item-->
                
            </div><!--//items-wrapper-->
        </div><!--//container-->
        </div>
      <hr>
      <div class="container text-center" style="margin-bottom: 10px">
         <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >누가 잘하는지 겨뤄보자!!</h3>
            <h2 class="section-title" style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >This is Competition!</h2>
         <br>
         <div style="width: 100%">
			<ul style="width: 100%">
			<li style="width: 33%;height:100%;float: left;padding-left: 0px;padding-right: 5px;"><div style="border: 1px solid;"><button class="bt_likeOff" style="width: 100%;height:582px;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1"><img src="./bootstrap/assets/images/11.jpg" style="width: 100%;height:100%;" alt="image"></button></div></li>
			<li style="width: 33%;float: left;padding-left: 0px;padding-right: 5px;">
				<div style="border: 1px solid;margin-bottom: 5px"><button class="bt_likeOff" style="width: 100%;height:288px;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2"><img src="./bootstrap/assets/images/22.jpg" style="width: 100%;height:100%;" alt="image"></button></div>
				<div style="border: 1px solid;"><button class="bt_likeOff" style="width: 100%;height:288px;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal3"><img src="./bootstrap/assets/images/33.jpg" style="width: 100%;height:100%;" alt="image"></button></div>
			</li>
			<li style="width: 33%;height:100%;float: left;padding-left: 0px;padding-right: 5px;"><div style="border: 1px solid;"><button class="bt_likeOff" style="width: 100%;height:582px;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal4"><img src="./bootstrap/assets/images/44.jpg" style="width: 100%;height:582px;" alt="image"></button></div></li>
			</ul>
		 </div>
		 <!-- 모달!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 첫번쨰 모달! -->
			<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">대회 정보</h4>
      </div>
      <div class="modal-body"><!-- 들어가는 내용 부분!!!!!!!!!!  -->
       <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >구로구 동아 배드민턴장</h3>
              <h5 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >(나달,페더러 특별 참가)</h5>
       
       <hr>
       나달과 페더러가 테니스에서 배드민턴으로 종목 변경을!!?<br>
       구로구 동아 배드민턴장만의 특별한 토너먼트! <br><br>
       <h5>대회 기간 :2017-07-01 ~ 2017 - 08 - 01</h5><br>
       유의 사항 : 2017년 6월 28일부터 예선전을 진행 하오니<br> 참가를 희망하거나, 문의사항은
       <h5 style="color: red; display: inline-block;">고객센터 (1234-5678)</h5>로 연락 주시기 바랍니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
		 
		 
		 
		 
			<!-- 모달!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 두번째 모달! -->
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">대회 정보</h4>
      </div>
      <div class="modal-body"><!-- 들어가는 내용 부분!!!!!!!!!!  -->
       <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >강남구 오빠 당구장</h3>
              <h5 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >(상금이 무려 8000만원!)</h5>
       
       <hr>
       <h5>대회 기간 :2017-08-03 ~ 2017 - 09 - 01</h5><br>
       유의 사항 : 종목은 3쿠션이며, 개인 장비를 사용해도 무관합니다. <br> 참가를 희망하는 고객님께서는 
       <h5 style="color: red; display: inline-block;">고객센터 (1234-5678)</h5>로 연락 주시기 바랍니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
		
		
		<!-- 모달!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 세번쨰 모달! -->
			<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">대회 정보</h4>
      </div>
      <div class="modal-body"><!-- 들어가는 내용 부분!!!!!!!!!!  -->
       <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >마포구 홍대볼링장</h3>
              <h5 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >(김수현을 이겨라!!)</h5>
              <img src="./bootstrap/assets/images/666.jpg" style="width: 304px; height: 288px" >
       <hr>
      	 연기자겸 볼링 프로 자격증을 소지한 김수현(30)을 <br>
     	이길수 있는 진정한 볼링 고수를 찾는다! 
       <h5>대회 기간 :2017-07-07 ~ 2017 - 07 - 16</h5><br>
       유의 사항 : 볼링자격증을 소지한분은 토너먼트 16강부터 시작하게 됩니다.<br>
       해당 볼링장에는 주차장이 따로 마련되어있지 않으니 가급적 대중교통을 이용 바랍니다.<br>
       참가를 희망하는 고객님께서는 
       <h5 style="color: red; display: inline-block;">고객센터 (1234-5678)</h5>로 연락 주시기 바랍니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<!-- 모달!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 네번쨰 모달! -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">대회 정보</h4>
      </div>
      <div class="modal-body"><!-- 들어가는 내용 부분!!!!!!!!!!  -->
       <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >구로구 동아 배드민턴장</h3>
              <h5 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf" >(나달,페더러 특별 참가)</h5>
       
       <hr>
       <h5>대회 기간 :2017-07-01 ~ 2017 - 08 - 01</h5>
       유의 사항 : 2017년 6월 28일부터 예선전을 진행 하오니<br> 참가를 희망하는 고객님께서는 
       <h5 style="color: red; display: inline-block;">고객센터 (1234-5678)</h5>로 연락 주시기 바랍니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
		
		
		
		
		
            <!-- <div class="items-wrapper row">
               <div class="item col-sm-4 col-xs-12">
                  <div class="item-inner">
                     <div class="figure-holder">
						<div class="panel panel-default">
                         <div class="panel-heading">
                           <h3 class="panel-title">구로 당구대회</h3>
                         </div>
                         <div class="panel-body">
						 <img class="figure-image" src="./bootstrap/assets/images/4.jpg" alt="image"><br><br>
                            일시 : 2017.06.07 13:00~ <br>
							장소 : 구로디지털단지 볼링장    <br>
							참가비 : 10,000원         <br>
							신청 : http://www.js.com
                         </div>
                       </div>
                     </div>//figure-holder                  
                  </div>//item-inner
               </div>//item
			   
               <div class="item col-sm-4 col-xs-12">
                  <div class="item-inner">
                     <div class="figure-holder">
						<div class="panel panel-default">
                         <div class="panel-heading">
                           <h3 class="panel-title">구로 당구대회</h3>
                         </div>
                         <div class="panel-body">
						 <img class="figure-image" src="./bootstrap/assets/images/4.jpg" alt="image"><br><br>
                            일시 : 2017.06.07 13:00~ <br>
							장소 : 구로디지털단지 볼링장    <br>
							참가비 : 10,000원         <br>
							신청 : http://www.js.com
                         </div>
                       </div>
                     </div>//figure-holder                  
                  </div>//item-inner
               </div>//item
			   
               <div class="item col-sm-4 col-xs-12">
                  <div class="item-inner">
                     <div class="figure-holder">
						<div class="panel panel-default">
                         <div class="panel-heading">
                           <h3 class="panel-title">구로 당구대회</h3>
                         </div>
                         <div class="panel-body">
						 <img class="figure-image" src="./bootstrap/assets/images/4.jpg" alt="image"><br><br>
                            일시 : 2017.06.07 13:00~ <br>
							장소 : 구로디지털단지 볼링장    <br>
							참가비 : 10,000원         <br>
							신청 : http://www.js.com
                         </div>
                       </div>
                     </div>//figure-holder                  
                  </div>//item-inner
               </div>//item -->
        </div><!--//container-->
</article>
<br>
<br>
<br>
<br>
<br>
    <footer class="footer text-center">
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
