<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원리스트</title>
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
    <%@ include file="header_admin.jsp" %>
    <main class="d-flex align-items-center" style="height: 50rem">
      <div class="container">
        <div>
          <c:set var="_pagination" value="${memberListDatas.paginations}" />
          <span>총 갯수 : ${_pagination.totalCount}</span>
          <table class="table table-striped">
            <thead>
              <tr  class="text-center bg-info bg-warning">
                <th colspan="10" >회원리스트</th>
              </tr>
              <tr colspan="8" class="bg-warning bg-opacity-25">
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>성별</th>
                <th>나이</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>권한</th>
                <th>삭제</th>
                <th>수정</th>
              </tr>
            </thead>
            <tbody>

                <c:forEach var="data" items="${memberListDatas.userData}">
                <tr>
                  <td>${data.USER_ID}</td>
                  <td>${data.USER_PW}</td>
                  <td>${data.USER_NAME}</td>
                  <td>${data.USER_SEX}</td>
                  <td>${data.AGE}</td>
                  <td>${data.PHONENUMBER}</td>
                  <td>${data.EMAIL}</td>
                  <td>${data.PRIVILEGES}</td>
                  <td>
                    <form action="/memberlist/delete">
                      <button class="btn btn-warning" name="USER_ID" value="${data.USER_ID}">삭제하기</button>
                    </form>
                  </td>
                  <td>
                    <form action="/memberlist/update">
                      <button class="btn btn-warning" name="USER_ID" value="${data.USER_ID}">수정</button>
                    </form>
                  </td>
                </tr>
                </c:forEach>
            </tbody>

          </table>
          <nav aria-label="Page navigation example">	
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
          <%-- for(int i=0 ; i<9; i++) --%>
          <c:forEach var="i" begin="${_pagination.blockStart}" end="${_pagination.blockEnd}">
            <li class="page-item"><a class="page-link" href="/memberlist/${i}">${i}</a></li>
          </c:forEach>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
          <form action="/memberlist/create">
            <button class="btn btn-warning ">회원추가</button>
          </form>
        </div>
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
