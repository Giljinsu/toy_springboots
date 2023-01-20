<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<!-- 설문확인 페이지 -->
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>설문확인</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
			crossorigin="anonymous" />
		<%-- <link rel="stylesheet" href="./css/common.css" /> --%>
		<link
			rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	</head>

	<body>
		<%@ include file="header_login.jsp" %>

		<main class="d-flex align-items-center" style="height: 40rem">
			<div class="container d-flex justify-content-center">
				<div class="col-8">
					<table class="table table-striped">
						<thead>
						<tr class="bg-warning">
							<th colspan="2" class="text-center">설문확인</th>
						</tr>
						<tr class="bg-warning bg-opacity-25">
							<% String userName = (String) request.getAttribute("userName"); %>
							<th colspan="2" class="text-center"><%=userName%>님은 설문에 다음과 같이 답하셨습니다.</th>
						</tr>
						</thead>
						<tbody>
						<%
							ArrayList entireStat = new ArrayList<>();
							ArrayList userAnswerList = new ArrayList<>();
							entireStat = (ArrayList) request.getAttribute("entireStat");  // 전체통계 페이지에서 썼던 함수및 화면 재활용하기. 질문리스트를 뽑기 위해서.
							userAnswerList = (ArrayList) request.getAttribute("userAnswerList"); //user가 답변한 내용 불러오기
							for(int i = 0;i<entireStat.size();i++) {
								HashMap statRow = (HashMap) entireStat.get(i);
								String question = (String) statRow.get("question");
						%>
							<tr>
								<td colspan="" class="text-center"><%=question%></td>
								<td class="text-center"><%=userAnswerList.get(i)%></td>
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
			crossorigin="anonymous"></script>
	</body>
</html>
