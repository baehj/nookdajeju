<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content_hostMain {
	margin-top: 150px;
	margin-bottom: 100px;
    width: 100%;
	text-align: center;
	font-size: 20px; 
	font-weight: 600;
	font-family: 'nookda';
}

.hosttext {
	color: var(--point-color);
	text-decoration: underline;
	padding-right: 3px;
}

.content_hostMain {
	margin-top: 190px;
}

</style>
</head>
<body>

	<div class="content_hostMain">
		<!-- hostMenu -->
		<jsp:include page="hostMainMenu.jsp"></jsp:include>
		
		<!-- 내용 -->
		<div class="content_hostMain">
			<b class="hosttext">호스트</b><b>님 환영합니다.</b><br>
			<br>
			<br>
			<br>
		</div>
		
		<p> 🛠 코드 수정 중 🛠 </p>
		<!-- hostMenu2 -->
		<jsp:include page="hostMainMenu2.jsp"></jsp:include>
	</div>
	
</body>
</html>