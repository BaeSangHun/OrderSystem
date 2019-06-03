<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<!-- <link href="https://cdn.rawgit.com/YJSoft/Webfonts/0.1/BM_JUA.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/charts.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/icomoon/style.css">
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/statistics.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/charts.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/statistics.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/statistics&menti/commons.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/SeeMoreJournals.js"></script>


<title>���� � ��Ʈ</title>
<style>
</style>

</head>
<body>
	<!-- �׷����� ���� �ѱ�� ���� ������ȯ������ �ڹٽ�ũ��Ʈ �迭Ȥ�� json object�� ����,��ȯ���� -->
	<c:forEach var="energy" items="${metabolism}">
		<script>
			metabolism = {
				b : '${energy.bmetabolism}',
				e : '${energy.erequirement}'
			}
		</script>
	</c:forEach>
	<c:forEach var="weights" items="${weight}">
		<script>
			inputDate.push('${weights.start}');
			inputWeight.push('${weights.userWeight}');
		</script>
	</c:forEach>
	<c:forEach var="avg" items="${avgLb}">
		<c:choose>
			<c:when test="${avg.exerciseName eq '���帮��Ʈ'}">
				<script>
					dead.push('${avg.avgLb}');
					deadDate.push('${avg.start}');
				</script>
			</c:when>
			<c:when test="${avg.exerciseName eq '����Ʈ'}">
				<script>
					squat.push('${avg.avgLb}');
					squatDate.push('${avg.start}');
				</script>
			</c:when>
			<c:when test="${avg.exerciseName eq '�÷���ġ������'}">
				<script>
					bench.push('${avg.avgLb}');
					benchDate.push('${avg.start}');
				</script>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>

	</c:forEach>
	<script>
		dead.reverse();
		deadDate.reverse();
		squat.reverse();
		squatDate.reverse();
		bench.reverse();
		benchDate.reverse();
	</script>
	<c:forEach var="item" items="${overallAvg}">
		<c:if
			test="${item.exerciseName eq '�÷���ġ������' or item.exerciseName eq '���帮��Ʈ' or item.exerciseName eq '����Ʈ' or item.exerciseName eq 'Ǯ��' or item.exerciseName eq '�и��͸�������'}">
			<script>
				overallAvg.push('${item.avgLb}');
			</script>
		</c:if>
	</c:forEach>
	<div id="fullBox">
		<div class="menu-box">
			<div class="logo">
				<a href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					alt="logo">
					<p>TRAINERBOT</p></a>
			</div>
			<ul class="menu-bar">
				<li class="menu-icons"><a href="statistics"><i
						class="fas fa-chart-bar"></i>
						<p>����� ���</p></a></li>
				<li class="menu-icons"><a href="MyExerciseJournal"><i
						class="fas fa-book"></i>
						<p>����� �ۼ�</p></a></li>
				<li class="menu-icons"><a href="basicInformation"><i
						class="fas fa-user-edit"></i>
						<p>��������</p></a></li>
				<li class="menu-icons"><a href="mentiManagement"><i
						class="fas fa-users"></i>
						<p>��Ƽ ����</p></a></li>
				<li class="menu-icons"><a
					href="${pageContext.request.contextPath}/opo/webRtc"><i
						class="fas fa-comment-dots"></i>
						<p>ȭ��ä��</p></a></li>
				<li class="menu-icons"><a
					href="${pageContext.request.contextPath}/member/promotion"><i
						class="fas fa-address-card"></i>
					<p>Ʈ���̳� ��û</p></a></li>
			</ul>
		</div>
		<div id="wrapper">
			<div class="four-charts">
				<div id="lineChart dead"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="line-chart-daed"></canvas>

				</div>
				<div id="lineChart squat"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="line-chart-squat"></canvas>

				</div>
				<div id="lineChart bench"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="line-chart-bench"></canvas>

				</div>
				<div id="doughnutChart"
					style="position: relative; height: 25vh; width: 22vw">
					<canvas id="doughnut-chart"></canvas>
					
				</div>


			</div>
			<div id="another-chart">
				<div id="lineChart-weight"
					style="position: relative; height: 35vh; width: 54vw">
					<canvas id="line-chart-weight"></canvas>
				</div>
				<div id="radarChart"
					style="position: relative; height: 35vh; width: 35vw">
					<canvas id="radar-chart"></canvas>

				</div>
			</div>

			<div id="exercise-list-box">
				<div class="title">
					<span>�ֱ� � ����</span>
				</div>
				<div class="detail">
					<i class="far fa-plus-square"></i>
				</div>

				<table class="exercise-list table">
					<thead>
						<tr>
							<td>���</td>
							<td>��� �߷�<span style="font-size: 8px;">(������)</span></td>
							<td>�ݺ�ȸ��<span style="font-size: 8px;">(������)</span></td>
							<td>��Ʈ �հ�<span style="font-size: 8px;">(������)</span></td>
							<td>1RM<span style="font-size: 8px;">(������)</span></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${avgLb}" begin="0"
							varStatus="status">


							<script>
								/* ���� ��ȸ�� �ڹٽ�ũ��Ʈ �迭�� ����*/
								data = {
									date : '${item.start}',
									name : '${item.exerciseName}',
									lb : '${item.avgLb}',
									reps : '${item.sumReps}',
									set : '${item.doneSet}',
									oneRm : '${item.oneRm}'
								};
								copyArray.push(data);
							</script>


							<c:if test="${item.start == avgLb[0].start}">
								<c:if
									test="${item.exerciseName eq '�÷���ġ������' or item.exerciseName eq '���帮��Ʈ' or item.exerciseName eq '����Ʈ' or item.exerciseName eq 'Ǯ��' or item.exerciseName eq '�и��͸�������'}">
									<script>
										myAvg.push('${item.avgLb}');
									</script>
								</c:if>
								<tr class="percentRow">
									<td class="exTitle">${item.exerciseName}</td>
									<td class="avgLb">${item.avgLb}</td>
									<td class="sumReps">${item.sumReps}</td>
									<td class="doneSet">${item.doneSet}</td>
									<td class="oneRm">${item.oneRm}</td>

								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<script>
					var index = -1;
					var val = document.body.getElementsByClassName('exTitle');
					/*������ �迭�� ����� �и� */
					for (var q = 0; q < val.length; q++) {
						var filteredObj = copyArray.filter(function(item, i) {

							return item.name === val[q].innerText;

						});

						// 				var value = rateCal(comparison,curVal)
						/*����� �и��� �迭�� key������  ù��°���� �ι�°���� ������*/
						var keys = Object.keys(filteredObj[0]);
						var value;

						for (var j = 2; j < keys.length; j++) {

							/*������ �����Ʈ���� ���� �����Ͱ� �������� �������*/
							if (filteredObj.length <= 1)
								value = 'noData';

							else
								/*������ ������ ������ ����ϴ� �Լ� rateCal�� �Ѱ� �������� value ��ü�� ����Ű���� */
								value = rateCal(filteredObj[1][keys[j]],
										filteredObj[0][keys[j]]);

							var percent = document.createElement("span");
							percent.className = "percent";

							/*value�� ������ td�� appendChild����. value���� ���� ����ǥ��*/
							var percentRow = document.body
									.getElementsByClassName('percentRow');

							percentRow[q].getElementsByTagName('td')[j - 1]
									.appendChild(percent);
							if (value > 0) {
								percent.innerHTML = '('
										+ value
										+ "%"
										+ '<i class="fas fa-long-arrow-alt-up"></i>'
										+ ')';
								percent.classList.add('increase');
							} else if (value < 0) {
								percent.innerHTML = '('
										+ value
										+ "%"
										+ '<i class="fas fa-long-arrow-alt-down"></i>'
										+ ')';
								percent.classList.add('decrease');
							} else if (value == 'noData' || value == 0) {

								percent.innerHTML = '('
										+ '<i class="fas fa-minus"></i>' + ')';
								percent.classList.add('fixedRate');
							}

						}

					}
				</script>
			</div>
			<div id="toWrapper">
				<div class="toDo">
					<div class="title">
						<span>To Do List</span>
					</div>
					<div id="top_line">

						<div class="to_do_date">
							<i class="fas fa-angle-left" id="do_prev"></i><span
								class="moment"></span><i class="fas fa-angle-right" id="do_next"></i>
						</div>
					</div>
					<div class="to_do_table">
						<table class="to_do table">
							<tbody>
								<tr>
									<td><div class="checkboxes">
											<input id="a" type="checkbox" tabindex="1" /><label
												class="green-background" for="a"></label>
										</div></td>
									<td><div class="item_box">
											<div class="to_item">���帮��Ʈ</div>
											<p>���帮��Ʈ 60kg �߷����� 10ȸ�� 3��Ʈ</p>
										</div></td>
									<td class="parts">��</td>
									<td>
										<div class="progress-container">
											<span id="value" class="progress-value"
												style="background-color: #272a3d">1%</span>

											<div class="progress-bar">
												<div id="bar" class="progress-value multi" data-code="dbVal"
													style="width: 1%;"></div>
											</div>
										</div>
									</td>
									<td><i class="fas fa-edit"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="toEat">
					<div class="title">
						<span>To Eat List</span>
					</div>
					<div id="top_line">

						<div class="to_do_date">
							<i class="fas fa-angle-left" id="eat_prev"></i><span
								class="moment"></span><i class="fas fa-angle-right"
								id="eat_next"></i>
						</div>
					</div>
					<div class="to_do_table">
						<table class="to_eat table">
							<tbody>
								<tr>
									<td><div class="checkboxes">
											<input id="b" type="checkbox" tabindex="2" /><label
												class="green-background" for="b"></label>
										</div></td>
									<td><div class="item_box">
											<div class="to_item">�ٳ���100g</div>
											<p>�ٳ��� ����ũ�� 3��</p>
										</div></td>
									<td class="nutrient">ź��ȭ��,�ܹ���</td>
									<td class="kcal">250Kcal</td>
									<td>
										<div class="progress-container">
											<span id="value" class="progress-value"
												style="background-color: #272a3d">1%</span>

											<div class="progress-bar">
												<div id="bar" class="progress-value multi" data-code="dbVal"
													style="width: 1%;"></div>
											</div>
										</div>
									</td>
									<td><i class="fas fa-edit"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="more_exercise_list" class="more_exercise">
		<div class="content_square">
			<div class="list-head">
				<h3>���� � ����</h3>
			</div>
			<c:choose>
				<c:when test="">
					<%-- <c:forEach var="mel" items="${list}">
					<div>
						<ul>
							<li>${mel.exerciseDate}</li>
							<li>${mel.title}</li>
							
						</ul>
					</div>
				</c:forEach> --%>
				</c:when>
				<c:otherwise>
					<div class="nothing">���� � ������ �����ϴ�.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>