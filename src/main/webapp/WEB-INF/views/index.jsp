<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인화면</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <!-- <link rel="stylesheet" href="./css/common.css" /> -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                  <!-- <a href="/menu/surveyResultServlet" class="dropdown-item">전체 통계</a> -->
                  <!-- <a href="/menu/clientResultServlet" class="dropdown-item">회원별 통계</a> -->
                  <a href="/" onclick="loginAlert()" class="dropdown-item">설문 확인</a>
                  <a href="/" onclick="loginAlert()" class="dropdown-item">설문 삭제</a>
                </div>
              </div>
            </div>
            <div class="navbar-nav">
              <%-- <a href="/loginpage" class="nav-link">로그인/회원가입</a> --%>
                  <sec:authentication property="principal" var="userDetailsBean" />
                  <%-- 로그인이 필요한 상태 --%>
                  <sec:authorize access="isAnonymous()">
                      <a href="/loginpage" class="nav-link">로그인/회원가입</a>
                  </sec:authorize>
                  <%-- 로그인이 된 상태 --%>
                  <sec:authorize access="isAuthenticated()">
                      <span>${userDetailsBean.memberName}님 </span>
                      <a href="/logout" class="nav-link">로그아웃</a>
                  </sec:authorize>
            </div>
          </div>
        </div>
      </nav>
    </header>

    <main class="" style="background-color: rgba(248, 243, 242)">
      <div class="container">
        <div id="carouselControlId" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="w-100" src="/images/car1.png" alt="" />
            </div>
            <div class="carousel-item">
              <img class="w-100" src="/images/car2.png" alt="" />
            </div>
            <div class="carousel-item">
              <img class="w-100" src="/images/car3.png" alt="" />
            </div>
          </div>
          <button class="carousel-control-prev" data-bs-target="#carouselControlId" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" data-bs-target="#carouselControlId" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
      </div>
    </main>

    <footer class="border-top p-5 text-secondary" style="font-size: 0.8rem">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-2">
            <img src="./images/현대차량로고.png" width="50" alt="" />
          </div>
          <div class="col-12 col-md-8">
            <div>
              <span><a href="" class="text-decoration-none text-secondary border-end border-secondary pe-3">모바일 App</a></span>
              <span><a href="" class="text-decoration-none text-secondary border-end border-secondary ps-2 pe-3">저작권 안내</a></span>
              <span><a href="" class="text-decoration-none text-secondary border-end border-secondary ps-2 pe-3">개인정보 처리방침</a></span>
              <span><a href="" class="text-decoration-none text-secondary border-end border-secondary ps-2 pe-3">이용약관</a></span>
              <span><a href="" class="text-decoration-none text-secondary border-secondary ps-2 pe-3">프라이버시 센터</a></span>
            </div>
            <div class="mt-3">
              <span><a href="" class="text-decoration-none text-secondary border-end border-secondary pe-3">윤리경영 사이버 감사실</a></span>
              <span><a href="" class="text-decoration-none text-secondary border-end border-secondary ps-2 pe-3">영상정보처리기기 운영관리방침</a></span>
              <span><a href="" class="text-decoration-none text-secondary border-secondary ps-2 pe-3">사이트맵</a></span>
            </div>
            <div class="mt-3">
              <div>고객센터: 080-213-2312</div>
            </div>
          </div>
          <div class="col-12 col-md-2 d-flex align-items-center justify-content-center">
            <span class="material-symbols-outlined me-2"> home </span>
            <span class="material-symbols-outlined me-2"> settings </span>
            <span class="material-symbols-outlined me-2"> star </span>
            <span class="material-symbols-outlined"> favorite </span>
          </div>
          <div>아이디 : jinsu01 비밀번호 : 1234</div>
        </div>
      </div>
    </footer>
      <script>
      function loginAlert(){
        alert('로그인해주세요!');
      } 
      </script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
