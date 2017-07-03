<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var = 'c' value = '${requestScope.customer }'/>
<meta charset="UTF-8">
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

    
<title>회원정보관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });

    $("#signout").click(function(){
			var url = $(this).attr("a");
    		var $email = $("#emailvalue").text();
    	$.ajax({
    		url : "signout.do",
    		method : 'post',
    		data : {email : $email},
    		success : function(data){
    			alert("탈퇴되었습니다.");
				location.href = "/main.jsp"
    		}
    	})//ajax
    })
});
</script>
<style>    
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

</style>
</head>
<body style="background-color: #f9fbff">
	<header style = "height : 50px;"> 
	     <jsp:include page="menu.jsp"></jsp:include>
	</header>
	<article>
		
		
		<div id = "title"  style= "text-align: center; "> 
  <h1 style = "font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf;">회원정보</h1></div>
		
		
		<div class="container">
      <div class="row" style="height : 350px;">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 " style = "margin-top: 0;">

       <br>

      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">회원정보관리</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> 

                 </div>
                
                
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>이메일:</td>
                        <td id = "emailvalue">${c.email }</td>
                      </tr>
                      <tr>
                        <td>이름:</td>
                        <td>${c.customer_name }</td>
                      </tr>
                      <tr>
                        <td>닉네임:</td>
                        <td>${c.nickname }</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>연락처:</td>
                        <td>${c.call_no }</td>
                      </tr>
                        <tr>
                        <td>포인트:</td>
                        <td>${c.point }</td>
                      </tr>
                    </tbody>
                  </table>
                  
                  <a href="changepwd.jsp" class="btn btn-primary" id = "changepwd">비밀번호 변경</a>
                  <a href="changenick.jsp" class="btn btn-primary" id = "changenick">닉네임 변경</a>
                  <a href="signout.do" class="btn btn-primary" id = "signout">회원탈퇴</a>
                </div>
              </div>
            </div>
                  <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="#" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
      </div>
    </div>
		

	</article>
	<footer>
	</footer>
</body>
</html>