<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
</head>
<body>
	<div id="container">
		<header>
			~~님 환영합니다. 로그아웃 / 메뉴들
		</header>
		<section>
			<jsp:include page="/WEB-INF/view/${view }.jsp"></jsp:include>
		</section>
		<footer>
			회사 정보
		</footer>
	</div>
</body>
</html>