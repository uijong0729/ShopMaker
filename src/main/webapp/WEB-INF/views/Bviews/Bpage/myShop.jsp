<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bfooter.css?ver=3"/>
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bheader.css"/>
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bpagemain.css"/>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
		</script>
	</head>
	<body>
		<div>
			${headerContent}
		</div>
		<div>
			${body}
		</div>
		<div class="forVerticalAlign">
			${footer}
		</div>
	</body>
</html>