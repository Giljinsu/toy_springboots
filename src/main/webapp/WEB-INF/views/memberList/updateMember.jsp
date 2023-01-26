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
    <%@ include file="../header_admin.jsp" %>
    <main class="d-flex align-items-center" style="height: 40rem">
      <div class="container">
        <div>
          <form action="${data.USER_ID == null ? '/memberlist/insertMulti' : '/memberlist/edit'}" method="post" enctype="multipart/form-data">
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
                <th>사진</th>
                <th></th>
              </tr>
            </thead>
            <tbody>

                <tr>
                    <%-- <c:forEach var="data" items="${memberDatas}" varStatus="status"> --%>
                    <c:set var="data" value="${memberDatas}"/>
                  <%-- <form action="${data.USER_ID == null ? '/memberlist/save': '/memberlist/edit'}"> --%>
                  
                  <td>
                  <input type="text" name="USER_ID" value="${data.USER_ID}" 
                  ${ data.USER_ID == null ? '': 'readonly'} />
                  </td>
                  <td><input type="text" name="USER_PW" value="${data.USER_PW}"></td>
                  <td><input type="text" name="USER_NAME" value="${data.USER_NAME}"></td>
                  <td><input type="text" name="USER_SEX" value="${data.USER_SEX}"></td>
                  <td><input type="text" name="AGE" value="${data.AGE}"></td>
                  <td><input type="text" name="PHONENUMBER" value="${data.PHONENUMBER}"></td>
                  <td><input type="text" name="EMAIL" value="${data.EMAIL}"></td>
                  <td>
                  <div style="width:100px;">
                  <label for="privileges">관리자?</label>
                  <input type="checkbox" class="form-check-input" name="PRIVILEGES" id="privileges"
                  ${data.PRIVILEGES == 'ADMIN' ? 'checked' : '' }
                  />
                  </div>
                  </td>
                  <td>
                  <div class="form-group form-row" style="width:100px">
                    <input type="file" name="userPic" class="form-control">
                  </div>
                  </td>
                  <td>
                  <div style="width:100px;">
                    <button class="btn btn-warning" name="USER_ID" value="${data.USER_ID}">
                    ${data.USER_ID == null ? '생성': '수정'}
                    </button>
                  </div>
                  </td>
                  
                    <%-- </c:forEach> --%>
                </tr>

              
            </tbody>
          </table>
          </form>
        
        </div>
      </div>
    </main>

    <%@ include file="../footer.jsp" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
