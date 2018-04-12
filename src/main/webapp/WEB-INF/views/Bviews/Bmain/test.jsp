<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="/bigstar/resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
		</script>
		<style type="text/css">
			#testtest {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<header>
			<%@ include file="../Bheader.jsp" %>
		</header>
		<div id="testtest">
			${test}
		</div>
	</body>
</html>