<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>나의 운동 차트</title>
<style>
</style>

<script>
	var myManager = '${mentiProfile.username}';
	var userPoint = "${userPoint}";
	var contextPath = '${pageContext.request.contextPath}';
	window.onload = function() {
		var userPoint = '${userPoint}';
	
	}
</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<%@ include file="../gnb/nav.jsp"%>
<%-- <%@ include file="LastExerciseJournal.jsp"%> --%>
<%@ include file="../gnb/sidebar.jsp"%>
<body>
	<!-- 그래프에 값을 넘기기 위해 쿼리반환값들을 자바스크립트 배열혹은 json object로 복사,변환해줌 -->
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
			<c:when test="${avg.exerciseName eq '데드리프트'}">
				<script>
					dead.push('${avg.avgLb}');
					deadDate.push('${avg.start}');
				</script>
			</c:when>
			<c:when test="${avg.exerciseName eq '스쿼트'}">
				<script>
					squat.push('${avg.avgLb}');
					squatDate.push('${avg.start}');
				</script>
			</c:when>
			<c:when test="${avg.exerciseName eq '플랫벤치프레스'}">
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
			test="${item.exerciseName eq '플랫벤치프레스' or item.exerciseName eq '데드리프트' or item.exerciseName eq '스쿼트' or item.exerciseName eq '풀업' or item.exerciseName eq '밀리터리프레스'}">
			<script>
				overallAvg.push('${item.avgLb}');
			</script>
		</c:if>
	</c:forEach>
	<div id="fullBox">

		<div id="wrapper">
			<div class="four-charts">
				<div id="lineChart dead"
					style="position: relative; height: 30vh; width: 22vw">
					<canvas id="line-chart-daed"></canvas>

				</div>
				<div id="lineChart squat"
					style="position: relative; height: 30vh; width: 22vw">
					<canvas id="line-chart-squat"></canvas>

				</div>
				<div id="lineChart bench"
					style="position: relative; height: 30vh; width: 22vw">
					<canvas id="line-chart-bench"></canvas>

				</div>
				<div id="doughnutChart"
					style="position: relative; height: 30vh; width: 22vw">
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
					<span>최근 운동 일지</span>
				</div>
				<div class="detail">
					<i class="far fa-plus-square"></i>
				</div>

				<table class="exercise-list table-t">
					<thead>
						<tr>
							<td>운동명</td>
							<td>평균 중량<span style="font-size: 8px;">(증가율)</span></td>
							<td>반복회수<span style="font-size: 8px;">(증가율)</span></td>
							<td>세트 합계<span style="font-size: 8px;">(증가율)</span></td>
							<td>1RM<span style="font-size: 8px;">(증가율)</span></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${avgLb}" begin="0"
							varStatus="status">


							<script>
								/* 쿼리 조회값 자바스크립트 배열로 복사*/
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
									test="${item.exerciseName eq '플랫벤치프레스' or item.exerciseName eq '데드리프트' or item.exerciseName eq '스쿼트' or item.exerciseName eq '풀업' or item.exerciseName eq '밀리터리프레스'}">
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
					/*복사한 배열을 운동별로 분리 */
					for (var q = 0; q < val.length; q++) {
						var filteredObj = copyArray.filter(function(item, i) {

							return item.name === val[q].innerText;

						});

						// 				var value = rateCal(comparison,curVal)
						/*운동별로 분리한 배열의 key값별로  첫번째값과 두번째값을 가져옴*/
						var keys = Object.keys(filteredObj[0]);
						var value;

						for (var j = 2; j < keys.length; j++) {

							/*가져온 운동리스트에서 이전 데이터가 존재하지 않을경우*/
							if (filteredObj.length <= 1)
								value = 'noData';

							else
								/*가져온 값들을 비율을 계산하는 함수 rateCal에 넘겨 비율값을 value 객체가 가리키게함 */
								value = rateCal(filteredObj[1][keys[j]],
										filteredObj[0][keys[j]]);

							var percent = document.createElement("span");
							percent.className = "percent";

							/*value를 적합한 td에 appendChild해줌. value값에 따른 상태표시*/
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
						<table class="to_do table-t">
							<tbody class="to-do-body">
								<c:choose>
									<c:when test="${doList.size() > 0 }">
										<c:forEach var="item" items="${doList}" varStatus="status">

											<tr>
												<td><div class="checkboxes">
														<input id="dChk${status.index}" type="checkbox"
															tabindex="1" class="check-list" /><label
															class="green-background" for="dChk${status.index}"></label>
													</div></td>
												<td><div class="item_box">
														<div class="to_item">${item.doName}</div>
														<p class="to_item_contents">${item.doName}&nbsp;${item.doLb}kg 중량으로 ${item.doReps}회씩 ${item.doSet}세트</p>
													</div></td>
												<td class="parts">${item.doPart}</td>
												<td>
													<div class="progress-container-t">
														<span id="value" class="progress-value-t"
															style="background-color: #272a3d">0%</span>

														<div class="progress-bar-t">
															<c:set var="Numb" value="${item.doGoal}"></c:set>
															<fmt:parseNumber var="i" value="${Numb}"
																integerOnly="true"></fmt:parseNumber>
															<c:choose>

																<c:when test="${i ne 0}">
																	<div id="bar" class="progress-value-t multi"
																		data-code="${item.doLb/i * 100}" style="width: 0%;"></div>
																</c:when>
																<c:otherwise>
																	<div id="bar" class="progress-value-t multi"
																		data-code="0" style="width: 0%;"></div>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</td>
												<td><i class="fas fa-edit"></i></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>

									</c:otherwise>

								</c:choose>

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
						<table class="to_eat table-t">
							<tbody class="to-eat-body">
								<c:choose>
									<c:when test="${eatList.size() > 0}">
										<c:forEach var="item" items="${eatList}" varStatus="status">
											<tr>
												<td><div class="checkboxes">
														<input id="eChk${status.index}" type="checkbox"
															tabindex="2" class="check-list" /><label
															class="green-background" for="eChk${status.index}"></label>
													</div></td>
												<td><div class="item_box">
														<div class="to_item"><span class="eat-time">${item.eatTime}</span>${item.eatName}</div>
														<p class="to_item_contents">${item.eatName}  ${item.eatCount}개   ${item.eatGram}gram</p>
														<p>${item.eatEtc}</p>
													</div></td>
												<td class="nutrient">${item.eatNutrient}</td>
												<td class="kcal">${item.eatKcal}kcal</td>
												<td>
													<div class="progress-container-t">
														<span id="value" class="progress-value-t"
															style="background-color: #272a3d">0%</span>
														<div class="progress-bar-t">
															<div id="bar" class="progress-value-t multi"
																data-code="${item.eatKcal/item.needKcal * 100}"
																style="width: 0%;"></div>
														</div>
													</div>
												</td>
												<td><i class="fas fa-edit"></i></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<script>
				
			</script>
			<div id="manager-info">
<!-- 				<div class="title" style="margin-bottom: 10px;">트레이너 프로필</div> -->
					<div class="manager-photo">
						<img
							src="${pageContext.request.contextPath}/upload/${mentiProfile.upFilename}"
							onError="javascript:this.src='/kopo/resources/images/icon/default-profile-icon.jpg'"
							class="psa">
					</div>
				<div class="manager-content">

					<div class="manager-profile">
						<div class="trainer-name">
							${mentiProfile.name}<span class="small-id">${mentiProfile.username}</span></div>
						<div class="sub-info">
							 #${mentiProfile.sex}&nbsp;  &nbsp; #${mentiProfile.region}</div>
						<div class="trainer-tier">
							${mentiProfile.tier}</div>
						<div>${mentiProfile.career}</div>	
						<div>
							<p>저는 여러분들의 곁에서 항상 최선을다해 성실히 하겠습니다.</p>
<!-- 							<img -->
<%-- 								src="${pageContext.request.contextPath}/resources/images/grade/${mentiProfile.tier}-tier-bg-none.png"> --%>
						</div>
						<div class="manager-score">
							<div class="rate">
								<input type="radio" id="star5" name="rate" value="5" /> <label for="star5" title="text">5 stars</label> 
								<input type="radio" id="star4" name="rate" value="4" /> <label for="star4"title="text">4 stars</label> 
								<input type="radio" id="star3" name="rate" value="3" /> <label for="star3" title="text">3stars</label> 
								<input type="radio" id="star2" name="rate" value="2" /> <label for="star2" title="text">2 stars</label> 
								<input type="radio" id="star1" name="rate" value="1" /> <label for="star1"title="text">1 star</label>
							</div>
						</div>
					</div>
					<div class="profile-right">
						<div>
							<div class="reservation btn-t" id="reservation">화상채팅 예약</div>
						</div>					


					</div>

				</div>

			</div>
		</div>
</body>
</html>