<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ko>
<head>
	<meta charset="UTF-8">
	<title>남씨네 로그인</title>
     	<!-- Favicon-->
      <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
      <!-- Bootstrap icons-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
      <!-- Core theme CSS (includes Bootstrap)-->
      <link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">NAMCNE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">NOTICE</a></li>
                        <li class="nav-item"><a class="nav-link active" href="#!">ABOUT</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style='font-weight:bold;'>SHOP</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">전체 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">상의</a></li>
                                <li><a class="dropdown-item" href="#!">하의</a></li>
                                <li><a class="dropdown-item" href="#!">신발</a></li>
                                <li><a class="dropdown-item" href="#!">ACC</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
         <!-- Header-->
		 <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">남씨네</h1>
                    <p class="lead fw-normal text-white-50 mb-0">로그인 화면입니다.</p>
                </div>
            </div>
        </header>
		<!-- Section -->
		<section class="py-5">
			<div style="text-align:center; font-size:50px;" class="container px-4 px-lg-5 mt-5">
				<strong class="navbar-brand">NAMCNE</strong>
			</div>
			<div class="container px-4 px-lg-5 mt-5">
				<form method="POST" action="/loginOk" id="frmLogin">
				<table align=center>
					<tr><td>로그인 아이디</td><td><input type=text name=logid id=id></td></tr>
					<tr><td>비 밀 번 호</td><td><input type=password name=pwd id=pw></td></tr>
					<tr><td align=center colspan=2><input type=submit id=login value="로그인" class="btn btn-outline-dark">&nbsp;&nbsp;
					<input type=button id=goHome value="홈으로" class="btn btn-outline-dark"></td></tr>
					<tr><td align=center colspan=2><strong><u>아직 회원이 아니신가요?</u></strong>
					<input type=button id=goSignup value="회원가입" class="btn btn-outline-dark"></td></tr>
				</table>
				</form>
			</div>
			<div class="container px-4 px-lg-5 mt-5 py-5">
			</div>
		</section>
        <!-- Footer-->
        <footer class="py-5">
            <div class="container"><p class="m-0 text-center">Copyright &copy; NAMCNE Website 2023</p></div>
        </footer>
        <!-- JQuery core JS -->
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/loginScripts.js"></script>
</body>
</html>