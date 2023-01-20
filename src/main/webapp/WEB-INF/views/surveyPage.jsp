<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>설문화면</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  </head>

  <body>
    <%@ include file="header_login.jsp" %>

    <main class="d-flex align-items-center mt-5" style="height: 40rem">
      <div class="container">
        <form action="/menu/insertSurvey">
          <div class="mb-3">
            <div class="border bg-primary bg-opacity-10 mb-1 p-1 rounded"><%= (i+1) %>. <%= questions_list.get("QUESTION") %></div>
            <div class="row">
              <div class="col">
                <input type="radio" class="form-check-input" name="Q<%= (i+1) %>" id="radio<%= (i+1) %>-<%= (j+1) %>" value="E<%= (j+1) %>" />
                <label for="radio<%= (i+1) %>-<%= (j+1) %>" class="form-check-label"> (<%= (j+1) %>)<%= answers_list.get("ANSWER") %></label>
              </div>
            </div>
            <div class="d-flex justify-content-center mt-5">
              <button type="submit" class="btn bg-primary bg-opacity-10">제출하기</button>
            </div>
          </div>
        </form>
      </div>
    </main>

    <%@ include file="footer.jsp" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
