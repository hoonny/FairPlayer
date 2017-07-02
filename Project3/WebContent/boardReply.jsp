<%@page import="java.util.List"%>
<%@page import="com.my.vo.RepBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>답글 달기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){

  $write = $("#write");

  $write.click(function(){
    alert("등록버튼 클릭");
        var $subject = $("input[name=subject]").val();
        var $content = $("textarea[name=content]").val();
    	var $password = $("input[type=password]").val();
    	var $no = $("input[name=subject]").attr("at");
        console.log($content+":"+$password+":"+$no);
        
        $.ajax({ url: "reply.do",
               method :'post',
               data: {subject:$subject, content:$content, password:$password, no:$no},
               success : function(responseData){
            	   $("body").empty();
            	   $("body").html(responseData);
               /* $parentObj.empty();
               $parentObj.html(responseData); */
               }//end success
        });//end ajax
        return false;
      })
 });


</script>
</head>
<body>
<header> 
     <jsp:include page="menu.jsp"></jsp:include>
</header>
   <br><br><br><br>
<form method="post" enctype="multipart/form-data">
<div class="container">

    <thead>
        <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf"> 답글달기 </h3>
    </thead>

<table class="table table-bordered" style="background-color: white; padding-top: 20px;">
    <%RepBoard  b= (RepBoard)request.getAttribute("msg"); %>
    <tbody>   
            <tr>
                <th>제목: </th>
                <td><input type="text"  name="subject" class="form-control" value="　　　ㄴ[RE:]<%=b.getSubject() %>"/ at=<%=b.getNo() %>></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="10" placeholder="답변 할 내용을 입력하세요. " name="content" class="form-control" style="height: 300px" ></textarea></td>
            </tr>
            <tr>
                <th>비밀번호: </th>
                <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control" style="width: 200px" name="password"/></td>
            </tr>
            <tr>
                 <td colspan="2">                    
                        <input type="button"  id="write"  value="등록"  class="pull-right"/>                     
                    	<input type="button" value="목록" class="pull-left" onclick="javascript:location.href='boardList.do'"/>
                </td>
            </tr>
    </tbody>
</table>
</div>
</form>
</body>
</html>


