<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>회원 가입</title>

    <!-- Bootstrap -->
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="./bootstrap/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="./bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">
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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(function(){
		var $chk = 0;
	   $("#cancel").click(function() {
		   location.href = "index.html";	
	   });
	   
	   $("#dup").click(function(){
		   var $nickname = $("#nickname").val();
		   $.ajax({
			   url : "chknick.do",
			   type : "post",
			   data : {nickname : $nickname},
			   success : function(data){
					if(data == 1){
						$chk = 1;
						alert("사용가능한 닉네임입니다.");
					}else{
						alert("이미 사용중인 닉네임입니다.");
					} 
			   }
		   })//ajax
		   return false;
	   })//중복확인
	   
	   $("#changenick").click(function(){
		 var $nickname = $("#nickname").val();
		 if($chk == 0){
			 alert("중복확인을 해주세요");
		 }else{
			 
			 $.ajax({
				url : 'changenick.do',
				type : 'post',
				data : {nickname : $nickname},
				success : function(data){
					alert("변경 완료되었습니다.");
					location.href = "customerupdate.do"
				}
			 })//ajax
			 
		 }//if절
	   })//클릭
	   
	   
})//window.load
</script>
    
    
  </head>
  <body>
    <!-- ******HEADER****** --> 
    <header> 
     <jsp:include page="menu.jsp"></jsp:include>
   </header>
      <article class="container">
        <div class="page-header" style="margin-top:80px;">
          <h1 style="width: 250px; margin: auto; font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf;" >닉네임 변경</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method='post'>
            <div class="form-group">
              <label for="InputEmail">닉네임</label>
              <div class="input-group">
                 <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해 주세요" style="height: 44px" required>
                <span class="input-group-btn">
                  <button class="btn btn-success" style="height:44px" id="dup">중복확인(필수)<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
              </div>
            </div>
          
            <div class="form-group text-center">
              <button type="button" class="btn btn-info" id="changenick" >변경<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" class="btn btn-warning" id="cancel" onclick="index.html">변경취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
