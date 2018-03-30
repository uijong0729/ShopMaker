<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html> 
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/EUIJONGLEE.css?ver=1" /> 
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
 
</head> 
<body> 
 
<form id="qnaForm" action="writeQna" method="post"> 
   <table> 
      <tr> 
         <th>문의 제목</th> 
         <td><input id="qtitle" name="qtitle"></td> 
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
    
   <div id="confirm" class="button borderIb">확인</div> 
   <div id="cancle" class="button borderIb">취소</div> 
    
   <input id="membercode" name="membercode" type="hidden" value="${Amember.membercode }"> 
    
</form> 
 
</body> 
</html>