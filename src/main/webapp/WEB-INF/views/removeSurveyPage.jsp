<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>통계삭제화면</title>
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
    <%@ include file="header_login.jsp" %>
    <% String result = (String)request.getAttribute("result");%>

    <main class="d-flex align-items-center" style="height: 40rem">
      <div class="container">
        <form action="/menu/removeSurveyPageServlet" onsubmit="return isempty()" method="post">
          <div class="container d-flex justify-content-center">
            <div class="input-group w-50">
              <label for="" class="input-group-text bg-secondary bg-opacity-50">비밀번호</label>
              <input id="password" type="password" name="password" class="form-control" />
              <%-- <button class="btn bg-secondary bg-opacity-50" type="submit">삭제</button> --%>
              <a href="#modalTarget2" data-bs-toggle="modal" class="btn bg-secondary bg-opacity-50">삭제</a>
              <div class="modal fade" id="modalTarget2">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header"></div>
                    <div class="modal-body">정말로 삭제하시겠습니까?</div>
                    <div class="modal-footer">
                      <button class="btn btn-secondary" data-bs-dismiss="modal">예</button>
                      <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">아니요</button>
                    </div>
                    </div>    
                  </div>
                </div>
              </div>
            </div>
            <%if(result==null) {%>
            <div class="text-center" style="color:red;" id="pwError"></div>
            <%} else {%>
            <div class="text-center" style="color:red;" id="pwError"><%=result%></div>
            <%}%>
          </div>
        </form>
    </main>

    <%@ include file="footer.jsp" %>
    <script>
      function isempty() {
        let password = document.querySelector("#password").value;
        if(password == "") {
          let pwError = document.querySelector("#pwError");
          pwError.innerHTML = "비밀번호를 입력해주세요";
          return false;
        }
        return true;
      }
    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
