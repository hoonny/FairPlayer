<%@page import="com.my.vo.Customer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(function(){
   var $header = $("header");
   var $a = $header.find("a");
   $a.click(function(){
      var url = $(this).attr("href");
      $.ajax({ url: url,
    	  method : 'GET',
         success: function(responseData){
            if(url == 'logout.do'){
               location.href="main.jsp";       // 로그아웃 -> 메인으로
            } else if(url == 'login.jsp'){
            	location.href="login.jsp";     // 로그인 -> 로그인 화면
            } else if(url == 'signup.jsp'){
            	location.href="signup.jsp";    // 회원가입 -> 회원가입 화면
            } else if(url == 'search.do'){
            	location.href="search.do";     // 운동검색 -> 검색 화면
            } else if(url == 'matching.do'){
            	location.href="matching.do";   // 실시간매칭 -> 매칭 화면
            } else if(url == 'like_list.do'){
            	location.href="like_list.do";  // 관심목록 -> 관심 목록 화면 
            } else if(url == 'boardList.do'){
            	location.href="boardList.do";  // 신고게시판 -> 게시판 화면
            } else if(url == 'main.jsp'){
            	location.href="main.jsp";      // 홈 -> 메인 화면	
            } else if(url == 'customerupdate.do'){
            	location.href="customerupdate.do";  // 회원정보관리 - > 그 화면	
            }else{
            }
         }         
      });
      return false;
   });
});
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="./bootstrap/css/menu_styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="./bootstrap/js/menu_script.js"></script>
   
<!-- main.html에 포함될 페이지 -->
<!-- Navigation -->
<!--  -->
   <div id='cssmenu' style="position: fixed;top: 0px;width: 100%;z-index: 990;">
     <ul>
     <li class='active'><a href='main.jsp'>홈</a></li>
     <c:choose>
       <c:when test="${ empty sessionScope.loginInfo }">
       <li><a href='search.do'>운동검색</a></li>
       <li><a href='matching.do'>실시간매칭</a></li>
       <li><a href='boardList.do'>신고게시판</a></li>
       <li style="float:right;"><a href='signup.jsp'>회원가입</a></li>
       <li style="float:right;"><a href='login.jsp'>로그인</a></li>
       </c:when>
       <c:otherwise>
       <li><a href='search.do'>운동검색</a></li>
       <li><a href='matching.do'>실시간매칭</a></li>
       <li><a href='like_list.do'>관심목록</a></li>
       <li><a href='boardList.do'>신고게시판</a></li>
       <li style="float:right;"><a href='logout.do'>로그아웃</a></li>
       <li style="float:right;"><a href='customerupdate.do'>회원정보관리</a></li>
       </c:otherwise>
     </c:choose>                      
     </ul>
   </div>
    