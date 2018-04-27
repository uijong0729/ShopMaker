<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>

<style type="text/css">

th
{
  font-size: 12px;
  height: 35px;
  vertical-align: middle;
  letter-spacing: 2px;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

th:hover
{
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}

</style>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<script>

</script>

</head>
<body>

	<h2 style="display: inline-block; box-shadow: 2px 2px 1px 1px gray;">회원 리스트</h2>
	
	<div style="text-align: center;">
		<div style="display: inline-block; border: 1px solid silver; border-radius: 5px; border-bottom-width: thin; box-shadow: 4px 4px 2px 2px gray;">
			<c:if test="${bCountList >= 1}">
				<table>
					<tr style="margin-bottom: 5px;">
						<th style="width: 120px; margin: 8px;">아이디</th>
						<th style="width: 120px; margin: 8px;">성명</th>
						<th style="width: 170px; margin: 8px;">전화번호</th>
						<th style="width: 300px; margin: 8px;">주소</th>
					</tr>
				<c:forEach var="list" items="${bCustomerList}">
					<tr style="margin: 8px; margin-bottom: 10px;">
						<td style="width: 120px; margin: 8px;">${list.customerid }</td>
						<td style="width: 120px; margin: 8px;">${list.customername }</td>
						<td style="width: 170px; margin: 8px;">${list.customerhp }</td>
						<td style="width: 300px; margin: 8px;">${list.customeraddress }</td>
					</tr>
				</c:forEach>
					
				</table>
			</c:if>
				
			<c:if test="${bCountList == 0}">
				회원 리스트가 없습니다.
			</c:if>
		</div>
	</div>

<!-- ${list.customerid }
		
		<c:if test="${list.customeraddress != '값이 없습니다' }">
			${list.customeraddress }
		</c:if>
		
		<c:if test="${list.customerhp != '값이 없습니다' }">
			${list.customerhp }
		</c:if>
		
		<c:if test="${list.customername != '값이 없습니다' }">
			${list.customername }
		</c:if> -->

</body>
</html>