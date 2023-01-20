<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./css/commons.css" />
  </head>
  <body>
    <%@ include file="../header_notlogin.jsp" %>
    <% String result = (String)request.getAttribute("result");%>
    <form class="" onsubmit="return validateForm()" action="/loginpage/login" method="post">
      <!-- 링크 추가 필요 지금은 현재페이지에서 값을 가지고 주소에 출력 -->
      <div class="container">
        <div class="text-center m-3">
          <div>
            <span><img src="../docs/현대차량로고.png" width="100" alt="" /> </span>
            <span class="fs-2">로그인</span>
            <!-- 이미지 링크 수정해야 보임 -->
          </div>

          <!-- 여기부터 id pw  -->
          <div class="row mt-5">
            <div class="col-12 d-flex justify-content-center mb-2">
              <div>
                <input type="text" id="id" class="form-control" name="USER_ID" placeholder="Id" />
              </div>
            </div>

            <div class="col-12 d-flex justify-content-center">
              <div>
                <input type="password" id="password" class="form-control" name="USER_PW" placeholder="Password" />
              </div>
            </div>
            <div class="col" style="color : red;" id="errorLogin">
            <c:if test="${empty dbUerData}">
              아이디 또는 비밀번호를 확인해주세요.
            </c:if>
            </div>

            <div class="col-12 d-flex justify-content-center mt-5">
              <div class ="row" style="width:15rem">
                <button type="submit" class="btn bg-warning col me-3">로그인</button>
    </form>
                <form class="d-inline col ps-0 pe-0" action="/loginpage/joinpage" method="post">
                  <button class="btn btn-warning" style="width:100%" name="idnotDup" value="false" type="submit">회원가입</button>
                </form> 
              </div>
            </div>
          </div>
        </div>
      </div>
    <%@ include file="../footer.jsp" %>
    <script src="/js/logPageScript.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
