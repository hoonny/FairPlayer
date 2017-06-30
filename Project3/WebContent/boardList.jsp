<%@page import="com.my.vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.my.vo.RepBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 & 문의하기</title>
<style type="text/css">
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
        padding-top: -1px;
        margin: 0px;
}
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
        !important
}

    #mainWrapper{
        width:610px;
        margin: auto;
        !important
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
        !important
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
        height: 30px;
        line-height: 30px;
        font-size: 13px;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:9pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    
    #ulTable > li > ul > li > a { 
        
        font-size:10pt;
        vertical-align:baseline;
        text-align: center;
        font-weight: bold;
        text-decoration: none;
}    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/


    #divPaging {
    	text-align : center;
        clear:both; 
        margin: auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        
        width: 100%;
        margin: auto;
        text-align: center;
        
}
   #divPaging > div > table{
        
        width: 150px;
        margin: auto;
        text-align: center;
       
}

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px; 

}

    .left {
        text-align : left;
}
#viewsup:hover {
        text-align : left;
        text-shadow: 1px 1px 1px black;
}

/* .k1:hover{
 background-color: red;
} */
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){ 

	//글쓰기 버튼 클릭했을떄
	$form = $("form");
	
      $("#write").click(function(){    //폼태그의 글쓰기 버튼이 클릭되면 실행해!
        
    	  var url = 'boardWrite.jsp';
    
        $.ajax({ url: url,
               method :'post',
               success : function(responseData){
               var data = responseData.trim();
               //$parentObj.empty();
               //$parentObj.html(responseData);
            location.href="boardWrite.jsp";
               }//end success
        });//end ajax
        return false;
      })
      
      //제목 클릭 했을때
      var $body = $("body");
      $("li>ul>li>a").click(function(){    
   	   var $no = $(this).attr('at');
   	   console.log($no);
       $.ajax({ url: 'boardView.do',
           data: 'no='+$no,   
           type: 'post',
           success : function(responseData){
				data = responseData.trim()
				$body.empty();
				$body.html(data);
           }
       });//end ajax
     return false;
     }); 
      
      
      $form.submit(function(){    
          
    	  var $select = $("#selSearchOption option:selected").val();
    	  var $input = $("#txtKeyWord").val();
    	  console.log($select + $input);

    	  $.ajax({ url: 'boardSearch.do',
              data: {select:$select, input:$input},   
              type: 'post',
              success : function(responseData){
   				data = responseData.trim()
   				$body.empty();
   				$body.html(data);
              }
          });//end ajax
        return false;
        }); 
      
      $(".paging").click(function(){
    	  
    	  var $page = $(this).text();
    	  console.log($page)
    	  $.ajax({
    		  url : 'boardList.do',
    		  data : {page : $page},
    		  type : 'post',
    		  success : function(data){
    			  $("body").empty();
                  $("body").html(data.trim());
    		  }
    		  
    	  })//ajax
      })//클릭
  });



</script>

</head>
<body style="background-color: #F9FFFF">
<header> 
     <jsp:include page="menu.jsp"></jsp:include>
</header>
   <br><br><br>
   <article style="width: 700px; margin-left: ">
   <form method="post">
   <div id="mainWrapper">
        
        
        <ul>
            <!-- 게시판 제목 -->
            <li style=" line-height: 35px; float:left; font-size: 20pt; width:100%; font-family: 배달의민족 도현; src: ./bootstrap/fonts/BMDOHYEON_ttf.ttf; background-color:#F9FFFF ">신고 & 문의하기</li>
            <div style="background-color: white;">
            <div style="background-color:#F9FFFF "></div>
            <!-- 게시판 목록  -->
            <br><br><br>
            <li>
                <ul id ="ulTable"  >
                    <li style="background-color:#F9FFFF;" >
                        <ul style="margin-top: 20px">
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                    <%List<RepBoard> list = (List)request.getAttribute("msg");%>
                    
                    <%for(RepBoard b : list){ %>
                    
                    <li id="tablekk">
                        <ul>
                            <li   style="height: 27px; line-height: 28px;  text-align: center;" class="k1"><%=b.getRepboard_no() %></li>
                            <%if (b.getParent_no() == 0  ){ %>  
                            <li  class="left" style="height: 27px; line-height: 28px; text-align: center;" class="k2"><a class="k2" href="" style="color: black;" at="<%=b.getRepboard_no()%>" id="viewsup"><%=b.getSubject() %></a></li>
                             <%} else { %>
							<li  class="left" style="height: 27px; line-height: 28px; text-align: center;" class="k2"><a class="k2" href="" style="color: #AE905E;" at="<%=b.getRepboard_no()%>" id="viewsup"><%=b.getSubject() %></a></li>                           
                            <%} %>
                            <li  style="height: 27px; line-height: 28px; text-align: center;" class="k4"><%=b.getDate() %></li>
                            <li style="height: 27px; line-height: 28px; text-align: center;" class="k5"><%=b.getNickname() %></li>
                            <li  style="height: 27px; line-height: 28px ;text-align: center;" class="k6"><%=b.getViews() %></li>
                        </ul>  
                    </li>
                         <%} %>           
                </ul>
            </li>
	
            <!-- 게시판 페이징 영역 -->
            <br>
            <li>
            <br>
                <div id="divPaging">
                <%int count = (int)request.getAttribute("count"); %>
                    <div>
                    <table>
	                    <tr>
	                    	<th>◀</th>
	                    <%for (int i = 1 ; i <= count; i++) {%>
	                    	<td class = "paging"><a href = #><%=i %></a></td>
	                    <%} %>
	                    	<th>▶</th>
	                    </tr>
                    </table>
                    </div>
                    
                </div>
                <%String log = (String)request.getAttribute("log"); %>
                <%if (log =="1") { %>
                <input type="button" value="글쓰기" id="write">
                <%}else if (log =="2") { %>
                	글쓰기는 로그인이 필요합니다	
                <%} %>
            </li>
                           
            
            <!-- 검색 폼 영역 -->
            <li id='liSearchOption'>
                <div style="height: 60px; margin-top: 10px">
                    <select id='selSearchOption' >      
                    	<option value='닉네임'>닉네임</option>            
                        <option value='제목'>제목</option>
                        <option value='내용'>내용</option>
                    </select>
                    <input type="text" id='txtKeyWord'/>
                    <input type='submit' value='검색' id="select"/>
                </div>
                </li>
                </div>
        </ul>
    </div>
    <br><br><br><br>
     </form>
    </article>
</body>
</html>