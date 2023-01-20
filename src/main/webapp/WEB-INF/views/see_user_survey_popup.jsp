<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- 설문확인 페이지 -->
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>설문확인에러</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
			crossorigin="anonymous" />
		<!-- <link rel="stylesheet" href="./css/common.css" /> -->
		<link
			rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	</head>

	<body>
		<%@ include file="header_login.jsp" %>
		<main class="d-flex align-items-center" style="height: 40rem">
			<div class="container">
			
				<div>
				<table class="table table-striped">
						<thead>
						<tr class="bg-warning">
							<th colspan="2" class="text-center">설문확인</th>
						</tr>
						<tr class="bg-warning bg-opacity-25">
							<% String userName = (String) request.getAttribute("userName"); %>
							<th colspan="2" class="text-center"><%=userName%>님은 설문작성을 아직 하지 않으셨습니다.</th>
						</tr>
						</thead>
						<tbody>
						
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
		<script>
			// alert("<%=userName%>님은 설문작성을 아직 하지 않으셨습니다."); // alert창을 띄워서 설문작성 안했다고 알려줌.
			// window.location.href = '/indexLogined.jsp'; // alert창을 클릭하면 메인화면으로 이동
		</script>
	</body>
</html>
