<%@page import="com.my.vo.RepBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>수정하기</title>
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
        var url = 'boardModi1.do';
        var $subject = $("input[name=subject]").val();
        var $content = $("textarea[name=content]").val();
		var $no = $("#subject").attr('at');
	console.log($no);
        
        
        $.ajax({ url: url,
               method :'post',
               data: {subject:$subject, content:$content, no:$no},
               success : function(responseData){
            	   alert("수정완료되었습니다.");
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

<table class="table table-bordered" style="background-color: white;">
    <thead>
        <h3 style="font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf"> 글 수정 </h3>
    </thead>
    
    <tbody>
    <% RepBoard b=(RepBoard)request.getAttribute("msg"); %>
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="수정 할 제목을 입력하세요." id="subject" at ="<%=b.getNo() %>" name="subject" class="form-control"/ value="<%=b.getSubject() %>"></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="10" placeholder="수정 할 내용을 입력하세요. " name="content" class="form-control" style="height: 300px" ><%=b.getContent() %></textarea></td>
            </tr>
            <tr>
                <th>첨부파일: </th>
                <td> ※ 첨부파일은 수정할 수 없습니다.</td>
            </tr>
            <tr>
                <td colspan="2">                    
                        <input type="button"  id="write" onclick='write()' value="수정"  class="pull-right"/> 
                                            
                    <input type="button" value="목록" class="pull-left" onclick="javascript:location.href='boardList.jsp'"/>
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                </td>
            </tr>
             
    </tbody>
    
    
</table>
</div>
</form>
</body>
</html>


