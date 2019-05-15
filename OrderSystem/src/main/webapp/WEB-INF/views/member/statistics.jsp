<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/charts.css">
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/style.css"></head> --%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/demo-files/demo.css"> --%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/charts.js"></script> 

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<title>���� � ��Ʈ</title>
<style>

</style>

</head>
<body>
<!-- �׷����� ���� �ѱ�� ���� ������ȯ������ �ڹٽ�ũ��Ʈ �迭Ȥ�� json object�� ����,��ȯ���� -->
<c:forEach var="energy" items="${metabolism}" >
	<script>
	metabolism={
		b:'${energy.bmetabolism}',
		e:'${energy.erequirement}'		
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
 		<c:when test="${avg.exerciseName eq '���帮��Ʈ'}" > 
		<script>
		
		dead.push('${avg.avgLb}');
		deadDate.push('${avg.start}');
		dead.reverse();
		deadDate.reverse();
	
		</script> 
		</c:when>
		<c:when test="${avg.exerciseName eq '����Ʈ'}">
 		<script> 
	
		squat.push('${avg.avgLb}');
		squatDate.push('${avg.start}');
		squat.reverse();
		squatDate.reverse();
		</script>			
		</c:when>
		<c:when test="${avg.exerciseName eq '�÷���ġ������'}">
		<script> 
	
		bench.push('${avg.avgLb}');
		benchDate.push('${avg.start}');
		bench.reverse();
		benchDate.reverse();
		
 		</script> 
		</c:when>
		<c:otherwise>

		</c:otherwise>
		</c:choose>

</c:forEach>
<c:forEach var="item" items="${overallAvg}">
	<c:if test="${item.exerciseName eq '�÷���ġ������' or item.exerciseName eq '���帮��Ʈ' or item.exerciseName eq '����Ʈ' or item.exerciseName eq 'Ǯ��' or item.exerciseName eq '�и��͸�������'}">
		<script>
	
		overallAvg.push('${item.avgLb}');
		console.log(overallAvg);
		
		</script>
	</c:if>
</c:forEach>
<div id="fullBox">
<div class="menu-box">
<div class="menu-bar">
	<div class="menu-icons"><a href="statistics"><i class="fas fa-chart-bar"></i></a></div>
	<div class="menu-icons"><a href="MyExerciseJournal"><i class="fas fa-book"></i></a></div>
	<div class="menu-icons"><a href="basicInformation"><i class="fas fa-user-edit"></i></a></div>
	<div class="menu-icons"><a href="mentiManagement"><i class="fas fa-users"></i></a></div>
	<div class="menu-icons"><a href="${pageContext.request.contextPath}/opo/webRtc"><i class="fas fa-comment-dots"></i></a></div>
</div>
</div>
<div id="wrapper">
<div class="four-charts">
	<div id="lineChart dead" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-daed"></canvas>

	</div>
	<div id="lineChart squat" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-squat" ></canvas>

	</div>
	<div id = "lineChart bench" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-bench"></canvas>

	</div>
	<div id = "doughnutChart" style="position: relative; height:25vh; width:22vw">
	<canvas id="doughnut-chart"></canvas>

	</div>
</div>
	<div id = "another-chart">
		<div id = "lineChart-weight" style="position: relative; height:35vh; width:54vw">
			<canvas id="line-chart-weight"></canvas>
		</div>
		<div id = "radarChart" style="position: relative; height:35vh; width:35vw">
			<canvas id="radar-chart"></canvas>

		</div>
	</div>
	
	<div id = "exercise-list-box">
		<h5>�ֱ� �����</h5>
		<div class="detail"><span>more</span><i class="fas fa-plus"></i></div>
		<table class="exercise-list">
			<tr>
			    <td>���</td>
			    <td>��� �߷�</td>
				<td>�ݺ�ȸ��</td>
				<td>��Ʈ �հ�</td>
				<td>1RM</td>
			</tr>
			
				<c:forEach var="item" items="${avgLb}" begin="0" varStatus="status">
					
				
					<script>
					/* ���� ��ȸ�� �ڹٽ�ũ��Ʈ �迭�� ����*/ 
						data = {
							date:'${item.start}',
							name:'${item.exerciseName}',
							lb:'${item.avgLb}',
							reps:'${item.sumReps}',
							set:'${item.doneSet}',
							oneRm:'${item.oneRm}'
						};
						copyArray.push(data);
	
					</script>		
					
								
			<c:if test="${item.start == avgLb[0].start}">
				<c:if test="${item.exerciseName eq '�÷���ġ������' or item.exerciseName eq '���帮��Ʈ' or item.exerciseName eq '����Ʈ' or item.exerciseName eq 'Ǯ��' or item.exerciseName eq '�и��͸�������'}">
					<script>
						myAvg.push('${item.avgLb}');
						console.log(myAvg);
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

		</table>
		<script>

			var index = -1;
			var val = document.body.getElementsByClassName('exTitle');
			/*������ �迭�� ����� �и� */
			for(var q=0;q<val.length;q++){
			var filteredObj = copyArray.filter(function(item, i){
						    
			    return item.name === val[q].innerText;
			  
			});
		
// 				var value = rateCal(comparison,curVal)
		/*����� �и��� �迭�� key������  ù��°���� �ι�°���� ������*/
				var keys = Object.keys(filteredObj[0]);

				for(var j=2;j<keys.length;j++) {
					/*������ ������ ������ ����ϴ� �Լ� rateCal�� �Ѱ� �������� value ��ü�� ����Ű���� */
					var value = rateCal(filteredObj[1][keys[j]],filteredObj[0][keys[j]]);
					
					var percent = document.createElement("span");
					percent.className ="percent";
					
					/*value�� ������ td�� appendChild����. value�� ������̸� ������ܰ� ���� �������̸� ������ܰ� û������ ǥ��*/
					var percentRow = document.body.getElementsByClassName('percentRow');
						
							percentRow[q].getElementsByTagName('td')[j-1].appendChild(percent);
							if(value >= 0) {
								percent.innerHTML = value + "%"+ '<i class="fas fa-long-arrow-alt-up"></i>';
								percent.classList.add('increase');
							}
							else if(value < 0) {
								percent.innerHTML = value + "%"+ '<i class="fas fa-long-arrow-alt-down"></i>';
								percent.classList.add('decrease');
							}
					
				}
					
				
			}
		</script>
	</div>
	<div class="toWrapper">
		<div class="toDo">
			<div><div class="title"><span>To do list</span></div><div class="edit_list"><i class="fas fa-edit"></i></div></div>
			<div class="">
			<table class>
				<tbody>
					<tr></tr>
				</tbody>
			</table>
			</div>
		</div>
		<div class="toEat">
			<div><div class="title"><span>To eat list</span></div><div class="edit_list"><i class="fas fa-edit"></i></div></div>
			<div class=""></div>
		</div>
	</div>
</div>
</div>

</body>
</html>