<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <style type="text/css">
         .div {
            position: absolute;
            text-align: center;
         }
      </style>
      <script src='<c:url value="resources/js/jquery-3.2.1.js" />'></script>
      <script type="text/javascript">
      
         $(document).ready(function() {
            
            for (var i = 1; i <= ${Bproducttable.size()}; i++) {
               var x = (i - 1) % ${param.rows};
               var y = (i - 1) / ${param.rows};
               y = Math.floor(y);
               $('#div' + i).css("width", ((100/${param.rows})-1) + "%");
               $('#div' + i).css("height", "200px");
               $('#div' + i).css("margin-left", ((x * 25) - 1) + "%");
               $('#div' + i).css("margin-top", (y * 300) + "px");
            }
         });
         
         function check() {
            var rows = document.getElementById('rows').value;
            $('#Bcenter').load("Bmainlist?rows=" + rows);
         }
         
         
           
      </script>
   </head>
   <body>
   <div class="forDeleteDiv">
      	한줄 표시개수 : <input type="text" id="rows"><button onclick="javascript:check();">적용</button>
   </div><br><br>
      
      <c:forEach items="${nameset}" var="n" varStatus="vars">
         <c:set var="done" value="false" />
         <c:forEach items="${Bproducttable}" var="b" varStatus="varss">
            <c:if test="${nameset[vars.index] == Bproducttable[varss.index].productname}">
               <c:if test="${done == false}">
                  <a href="goBproductdetail?productname=${b.productname}&productcode=${b.productcode }">
                  <div id="div${vars.index + 1}" class="div">
                     <img src="${b.productimage }" style="width: 200px; height: 200px;"><br>
                     
                     상품명 : ${b.productname}<br>가격 : ${b.productprice}
                  </div></a>
                  <c:set var="done" value="true"/>
               </c:if>
            </c:if>
         </c:forEach>
         
      </c:forEach>
   </body>
</html>