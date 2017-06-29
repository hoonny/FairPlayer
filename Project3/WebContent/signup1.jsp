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

	var cnt = 0;
	<!--중복 확인!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
	   $("#dup").click(function() {
			var $email = $("input[name=email]").val();
			  $.ajax({ url : 'dupchkid.do',
	               method : 'post',
	               data :  {email:$email},
	               success : function(responseData){  
	            	 console.log(responseData);
	                if(responseData == 1){
	                	alert("사용 가능한 아이디 입니다.");
	                	cnt++;
	                }
	                else if(responseData == -1){
	                	alert("중복된 아이디 입니다. 다른 아이디를 사용해주세요.");
	                }
	                }         
	      });//ajax 
	      return false;
	   })//form.click
		   
		   

	
	
   <!--회원가입!!!!!!!!!!!-->
   $("#singup").click(function() {
		var $form = ("form");
	    var url = 'signup.do';
	    var $email = $("input[name=email]").val();
	    var $nick = $("input[name=nick]").val();
	    var $name = $("input[name=name]").val();
	    var $pwd = $("input[name=pwd11]").val();
	    var $repwd = $("input[name=repwd11]").val();
	    var $tel = $("select[name=tel]").val();
	    var $tel1 = $("input[name=tel1]").val();
	    var $tel2 = $("input[name=tel2]").val();
	    var $checkbox = $("input[type='checkbox']").val();

	    
	    
	    if ($pwd != $repwd){
	    	alert("비밀번호를 확인해주세요..");
	    	return false;
	    }
	    
	      $.ajax({ url : url,     
	               method : 'post',
	               data :  {email:$email, nick:$nick, pwd:$pwd, repwd:$repwd, tel:$tel, tel1:$tel1, tel2:$tel2, name:$name },
	               success : function(responseData){  
	                if(cnt>=1){
	            		if(responseData == 1){
	                		alert("회원가입 완료");
	                		location.href = "index.html";
	                	}
	                	else if(responseData == 2){
	                		alert("모든 입력사항을 기재해주세요.");
	                	}
	      			}else if (cnt==0){
	      				alert("중복확인을 해주세요.");
	      			}
	                
	               }
	      });//ajax 
	      return false;
	   })//form.click
    
		
	   $("#cancel").click(function() {
		   location.href = "index.html";	
	   });
})//window.load
</script>
    
    
  </head>
  <body>
    <!-- ******HEADER****** --> 
    <div> 
     <jsp:include page="menu.jsp"></jsp:include>
   </div>
      <article class="container">
        <div class="page-header" style="margin-top:80px;">
          <h1 style="width: 140px; margin: auto;" >회원가입</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method='post'>
            <div class="form-group">
              <label for="InputEmail">ID</label>
              <div class="input-group">
                 <input type="text" class="form-control" id="email" name="email" placeholder="ID(이메일)을 입력해 주세요" style="height: 44px" required>
                <span class="input-group-btn">
                  <button class="btn btn-success" style="height:44px" id="dup">중복확인(필수)<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
              </div>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="pwd11" name="pwd11" placeholder="비밀번호"/>
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="repwd11" name="repwd11" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요">
            </div>
             <div class="form-group">
              <label for="username">닉네임</label>
              <input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력해 주세요">
            </div>
            <div class="form-group" style="display: inline-block;">
              <label for="tel">전화번호</label>
              <select name=tel id="tel" style="text-align: center; width: 100px" attr="tel" class="form-control">
					<option value="02">02</option>
					<option value="032">032</option>
					<option value="031">031</option>
					<option value="010">010</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
				</select>
            </div> -
           <div class="form-group" style="display: inline-block;">
           	<input type="text" class="form-control" id="tel1" name="tel1" style="text-align: center; width: 150px" >
           </div> -
           <div class="form-group" style="display: inline-block;">
           	<input type="text" class="form-control" id="tel2" name="tel2" style="text-align: center; width: 150px" >
           </div> 

            <div class="form-group text-center">
              <button type="button" class="btn btn-info" id="singup" >회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" class="btn btn-warning" id="cancel" onclick="index.html">가입취소<i class="fa fa-times spaceLeft"></i></button>
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
