<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./css/commons.css" />
  </head>
  <body>
<header class="bg border-bottom">
			<nav class="navbar navbar-expand-sm fw-bold">
				<div class="container">
					<a href="/" class="navbar-brand">
						<img src="https://www.hyundai.com/static/images/hyu_logo_og_image.jpg" width="150" class="" alt="" />
					</a>
					<a href="#collapseId" class="navbar-toggler" data-bs-toggle="collapse">
						<span class="navbar-toggler-icon"></span>
					</a>
					<div class="collapse navbar-collapse d-flex-md justify-content-between" id="collapseId">
						<div class="navbar-nav">
							<a href="/" onclick="loginAlert()" class="nav-link">설문지 작성</a>
							<div class="dropdown">
								<a href="" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">설문 확인/삭제</a>
								<div class="dropdown-menu">
									<%-- <a href="/menu/surveyResultServlet" class="dropdown-item">전체 통계</a>
									<a href="/menu/clientResultServlet" class="dropdown-item">회원별 통계</a> --%>
									<a href="/" onclick="loginAlert()" class="dropdown-item">설문 확인</a>
									<a href="/" onclick="loginAlert()" class="dropdown-item">설문 삭제</a>
									<%-- <a href="./admin.jsp" class="dropdown-item">어드민 테스트용</a> --%>
								</div>
							</div>
						</div>
						<div class="navbar-nav">
							<a href="/loginpage" class="nav-link">로그인/회원가입</a>
						</div>
					</div>
				</div>
			</nav>
		</header>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
