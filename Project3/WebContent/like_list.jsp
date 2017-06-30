<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var = "list" value = "${requestScope.list }"/>
<meta content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 website landing page for developers and startups">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
    <!-- <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    Global CSS
    <link rel="stylesheet" href="./bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css">   
    Plugins CSS
    <link rel="stylesheet" href="./bootstrap/assets/plugins/font-awesome/css/font-awesome.css">
    Theme CSS  
    <link id="theme-style" rel="stylesheet" href="./bootstrap/assets/css/styles.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
	
	$("button[name=delete]").click(function(){
		var $list_id = $(this).siblings("p").text();
		console.log($list_id);
		if(confirm("목록에서 삭제하시겠습니까?")){
			$.ajax({
				url : "likedelete.do",
				data : {list_id : $list_id},
				method : "post",
				success : function(data){
					
					$("body").html(data);
					
				}
			})//ajax	
		}else{
			alert("취소되었습니다.");
			return;
		}
		
		
		
	})//클릭
})//끝
</script>
<style>

body{
background-color : #f9fbff;
}
table {
 
width : 1000px;
margin : auto;
font-family:Arial, Helvetica, sans-serif;
}
tr td {
text-align: center;
text-shadow: 1px 1px 0px #fff;
}
td{
background-color: white;
border-bottom: 1px solid;
border-bottom-color: #e0e6ff;
}
th{
font-family:Arial, Helvetica, sans-serif;
background-color: #eaebec;/* #DCEEEB; */
text-shadow: 1px 1px 0px #fff;
}

tr {
height : 130px;
border-bottom: 1px solid;
border-bottom-color: silver; 
}
#index {
height : 50px;

}

#index>th{
text-align: center;

}

.list {
margin-bottom: 20px;
}
.list:hover{
background: #f2f2f2;	

}
#background {

background-color: #f9fbff;
width : auto;

}

#tableback {
 width : 1100px;
background-color: white;
margin : auto;
}
</style>

</head>
<body>
<header>
 <jsp:include page="menu.jsp"></jsp:include> 
</header>
<br>
<br>
<article style = "padding : 20px; height : 100%;">
<div id = 'background' >

<div id = "title"  style= "text-align: center;"> 
	<h1 style = "font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf;">나의 관심 목록</h1></div>
	<div id = "tableback">
		<br><br>
			<table>
			<tr id ='index'><th>이미지</th><th>지점이름</th><th>주소</th><th>가격</th><th>연락처</th><th>삭제</th></tr>
				
				<c:if test = "${empty list }">
					<tr><td colspan = 6>목록이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="l" items="${list}" varStatus = "status">
					<tr class = 'list'>
						<td><img src='${l["image_url"]}' height = '100px' wdith = '180px'></td>
						<td>${l["center_name"]}</td>
						<td>${l["gu"]} ${l["dong"]} ${l["adress"]}</td>
							<c:set var = "price" value = '${l["price"]}'/>
								<c:choose>
									<c:when test = '${price == 0 }'>
										<td>정보 없음</td>
									</c:when>
									<c:otherwise>
										<td><fmt:formatNumber value = "${price }" pattern="#,###" ></fmt:formatNumber>원</td>
									</c:otherwise>
								</c:choose>
							<c:set var = "call" value = '${l["call_no"] }'/>
								<c:choose>
									<c:when test = '${call == "NULL"}'>
										<td>정보 없음</td>
									</c:when>
									<c:otherwise>
										<td>${call }</td>
									</c:otherwise>	
								</c:choose>
								
						<td><p style = "display: none;">${l["list_id"]}</p> <button name = "delete" class="btn btn-default">목록에서 제거</button></td>
					</tr>
				</c:forEach>
			</table>
		<br><br>
	</div>
</div>
      </article>
      <br>
      <br>
      <br>
      <br>
      <footer class="footer text-center">
        <div class="container" style = "text-align: center;">
            <!--/* This template is released under the Creative Commons Attribution 3.0 License. Please keep the attribution link below when using for your own project. Thank you for your support. :) If you'd like to use the template without the attribution, you can check out other license options via our website: themes.3rdwavemedia.com */-->
            <small class="copyright">본 웹 페이지는 현재 FairPlay 팀에서 운영하고 있는 생활체육 검색 시스템이 적용 되어 있습니다. <br>
            								사업자등록번호 : 123-45-6789  통신판매업신고 : 제 1234-서울금천-12345호<br>
											서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차 401호 ㈜ 우리동네 예체능 (대표자 : 윤웅재)<br>
											고객센터 1234-5678 (평일 오전 8시 ~ 오후 8시 / 주말 및 공휴일 오전 9시 ~ 오후 6시)<br>
											 copyright ⓒ 2017. ALL RIGHTS RESERVED BY KITRI FairPlay</small>
            
        </div><!--//container-->
    </footer>
    <link id="theme-style" rel="stylesheet" href="./bootstrap/assets/css/styles.css">
</body>
</html>