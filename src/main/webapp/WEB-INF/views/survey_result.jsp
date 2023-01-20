<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>통계화면</title>
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

    <main class="d-flex align-items-center" style="height: 40rem">
      <div class="container">
        <div>
          <table class="table table-striped">
            <thead>
              <tr class="bg-warning">
                <th colspan="5" class="text-center">전체통계</th>
              </tr>
            </thead>
            <tbody>
              <%
                ArrayList entireStat = new ArrayList<>();
                entireStat = (ArrayList) request.getAttribute("entireStat");
                // System.out.println(entireStat);
                for(int i = 0;i<entireStat.size();i++) {
                  HashMap statRow = (HashMap) entireStat.get(i);
                  String question = (String) statRow.get("question");
                  ArrayList answers = (ArrayList) statRow.get("answers");
                  ArrayList answersCount = (ArrayList) statRow.get("answersCount");
              %>
                  <tr>
                    <th colspan="5" class="text-left"><%=question    %></th>
                  </tr>
                  
                  <tr>
                    <%
                      for (int j=0;j<answers.size();j++) { 
                    %>
                        <td class="text-center"><%=answers.get(j)%> : <%=answersCount.get(j)%></td>
                    <%
                      } 
                    %>
                  </tr>
              <%    
                }
              %>
            </tbody>
          </table>
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
