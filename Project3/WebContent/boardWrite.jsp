<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>신고 & 문의 게시판</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
var $form = $("form");
 var $write = $("#write");

  $form.submit(function(){
	    console.log("버튼 클릭");
        var url = 'boardWrite.do';
        var data = new FormData($form);
	
        console.log(data);
        
        
       if ($subject == "" ){
        	alert("제목을 입력해주세요.");
        	return false;
        } else  if ($content == "" ){
        	alert("내용을 입력해주세요..");
        	return false;
        } else  if ($password == "" ){
        	alert("비밀번호를 입력해주세요.");
        	return false;
        } 
        
        
        /* $.ajax({ url: url,
               method :'post',
               data: {subject:$subject, content:$content, password:$password, image:imageName},
               success : function(responseData){ */
                   $.ajax({
                       type: "POST",
                       enctype: 'multipart/form-data',
                       url: "boardWrite.do",
                       data: data,
                       processData: false,
                       contentType: false,
                       cache: false,
                       success: function (responseData) {
                    	console.log("성공");
                    	/*$("article").empty();
            	    $("article").html(responseData); */
            	    alert("성공");
            	   location.href="main.jsp";
               }//end success
        });//end ajax
        return false;
      })
 });


</script>
</head>
<body style="background-color: #F9FFFF">

<header> 
     <jsp:include page="menu.jsp"></jsp:include>
</header>
   <br><br><br><br>
   <article>
<form method="post" enctype="multipart/form-data" action="boardWrite.do">
<div class="container">

<table class="table table-bordered" style="background-color: white;">
    <thead>
        <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf"> 신고하기 </h3>
    </thead>
    
    <tbody>
    
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="subject" class="form-control"/ maxlength="20"></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="10" placeholder="내용을 입력하세요. " name="content" class="form-control" style="height: 300px" ></textarea></td>
            </tr>
            <tr>
                <th>첨부파일: </th>
                <td><input type="file" value="파일첨부" name="uploadfile"/></td>
            </tr>
            <tr>
                <th>비밀번호: </th>
                <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control" style="width: 200px" name="password"/></td>
            </tr>
            <tr>
                <td colspan="2">                    
                        <input type="submit"  id="write"  value="등록"  class="pull-right"/> 
                                            
                    <input type="button" value="목록" class="pull-left" onclick="javascript:location.href='boardList.do'"/>
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                </td>
            </tr>
             
    </tbody>
    
    
</table>
</div>
</form>
</article>
</body>
</html>


