<%@ page contentType="text/html; charset=UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <!--aa  -->
  <title>우리동네예체능 로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
  
     <script>
  $(function(){
   var $form = $('form');

    
    var itemValue = localStorage.getItem("savedId");
    console.log(itemValue);
    if(itemValue != null){
       $("input[name=id]").val(itemValue);
    }
   $form.submit(function(){   
       //window.localStorage.setItem() --쿠키대신해서 저장
       //checkbox가 선택되었을때
     
       
      var url="login.do";
         $.ajax({   url: url,
               method: 'POST',
               data: $form.serialize(),
               success: function(responseData){
                   var data = responseData.trim(); //공백을 없애기위해
                   if(data == '1'){
                      alert("로그인 성공");
                      location.href='main.jsp';
                   } else if(data == '2'){
                      alert("존재하지 않거나 비밀번호가 틀립니다."); 
                   } else{
                      alert(data);
                   }
                } 
         });
         return false; //기본이벤트(submit핸들러: method=get, action="")가 처리됨
    });        
  });
  </script>
  
</head>
<body>
<!-- ******HEADER****** --> 
    <header> 
     <jsp:include page="menu.jsp"></jsp:include>
   </header>
   
      <article class="container">
      <center>
        <div class="page-header" style="margin-top:100px; margin-bottom:30px;" >
          <h1 style=" margin: 30px; font-size: 54px" >우리동네   예체능</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
         <div class="form-group">
          <form method='post'>
           <div class="form-group">
              <!-- <label for="InputEmail">E-mail</label> -->
              <input type="text" class="form-control" id="id" name="id" style="height:60px;height:55px; width:85%; font-size:16px;" placeholder="이메일" />
              <!-- placeholder="아이디" class="int" maxlength="41" value="asdf" -->
             <label for="InputPassword1">                  </label>
              <input type="password" class="form-control" id="pwd" name="pwd"  style="height:50px;height:55px; width:85%; font-size:16px;" placeholder="비밀번호"/>
              <!-- <button type="button" class="btn btn-info" id="singup" >로그인<i class="fa fa-check spaceLeft"></i></button> -->
              <label for="InputPassword1">                  </label>
            <button type="submit" class="btn btn-primary btn-block btn-large" style="height:70px;width:85%; font-size: 30px" 
					value="로그인" >로그인</button>
			<br><br>
			 <a id="kakao-login-btn"></a>
					<script type='text/javascript'>
					    Kakao.init('a6f0053da34f1098359ce57a756639cb');
					    Kakao.Auth.createLoginButton({
					      container: '#kakao-login-btn',
					      success: function(authObj) {
					        Kakao.API.request({
					          url: '/v1/user/me',
					          success: function(res) {
					//       	   alert(JSON.stringify(res));
						          var $nickname = res.properties.nickname;
						          var $id = res.id;
					           location.href = "./login.do?nickname=" + $nickname + "&flag=1&id=" + $id;
					          },
					          fail: function(error) {
					            alert(JSON.stringify(error));
					          }
					        });
					      },
					      fail: function(err) {
					        alert(JSON.stringify(err));
					      }
					    });
					</script>
            </div>
          </form>
        </div>
        </div>
        

      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>