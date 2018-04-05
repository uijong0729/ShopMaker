<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>문의사항 작성</title> 
<script src="/bigstar/resources/js/jquery-3.2.1.min.js"> 
</script> 
<script> 
$(document).ready(function(){ 
    
   $('#cancle').on('click', function(){ 
      self.close(); 
   }); 
    
    
   $('#confirm').on('click', function(){ 
       
      var qtitle = document.getElementById('qtitle').value; 
      var qcontent = document.getElementById('qcontent').value; 
      var qvisible = $('#qvisible').prop("checked"); 
       
      if(qvisible == true) 
      { 
         qvisible = "1";    
      } 
      else 
      { 
         qvisible = "0"; 
      }  
       
      var membercode = document.getElementById('membercode').value; 
       
      //제목검사 
      if(qtitle.length >= 1) 
      { 
         //내용검사 
         if(qcontent.length >= 1) 
         { 
            $.ajax({ 
               url: 'writeQna', 
               type: 'post', 
               data:{qtitle: qtitle, qcontent: qcontent, qvisible: qvisible, membercode: membercode}, 
               dataType: 'text', 
               success: function(result) 
               { 
                  //alert(result); 
                  opener.location.reload(); 
                  self.close(); 
               } 
       
                
            }); 
             
         } 
         else 
         { 
            alert('내용은은 한 글자 이상이어야 합니다.'); 
         }//내용 
      } 
      else 
      { 
         alert('제목은 한 글자 이상이어야 합니다.'); 
      }//제목 
       
   }); 
    
}); 
</script> 
 
 <style type="text/css">
 .button
		{
			border-radius:34px;
			border:5px solid rgba(255, 255, 255, 0.07);
			color:#fff ;
			font-size:10px;
			margin-top:15px;
			text-shadow: 0px 1px 0px rgba(255, 255, 255, 0.15);
			cursor:pointer;
			display:inline-block;
			display:inline-block;
			padding:5px 10px;
			background: black repeat scroll 0% 0% ;
			border-radius:20px;
			box-shadow: 0px 0px 1px rgba(255, 255, 255, 0.3) inset, 0px 2px 0px rgba(255, 255, 255,0.1) inset;
		}
 		th {
	 		background: black;
	  		border-bottom: 1px solid #364043;
	  		color: #fff;
	  		font-size: 0.85em;
	  		font-weight: 600;
	  		padding: 0.5em 1em;
	  		text-align: left;
	  		text-align: center;		
		}
		
		td {
			background: gray;
			color: #fff;    
	    	text-align: center;
		}
 </style>
 
 
</head> 
<body> 
 
 
<form id="qnaForm" action="writeQna" method="post"> 
	
	   <table> 
	      <tr> 
	         <th>문의 제목</th> 
	         <td><input width="100%" id="qtitle" name="qtitle"></td> 
	      </tr> 
	      <tr> 
	         <th>하실 말씀</th> 
	         <td><textarea name="qcontent" id="qcontent" cols="40" rows="10" style="resize: none;"></textarea></td> 
	      </tr> 
	      <tr> 
	         <th>비밀글여부</th> 
	         <td><input id="qvisible" name="qvisible" type="checkbox"></td> 
	      </tr> 
	   </table> 
	    
		<div style="margin-left: 20%;">
			   <div id="confirm" class="button borderIb">확인</div> 
			   <div id="cancle" class="button borderIb">취소</div> 
		</div>
   <input id="membercode" name="membercode" type="hidden" value="${Amember.membercode }"> 
    
</form> 
 
</body> 
</html>