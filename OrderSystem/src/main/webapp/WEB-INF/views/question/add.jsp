<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문작성페이지</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/Question/Question-add.css" rel="stylesheet">
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Question/question-add.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 600, // set editor height
			fontNames : [ '맑은고딕', 'Arial',
							'Arial Black',
							'Comic Sans MS',
							'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true, // set focus to editable area after initializing summernote
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
		//질문등록
		$("#questionSubmit").click(function(){
			var summernoteVal = $("#summernote").val(); 
			var imgChk;
				if($(summernoteVal).find("img").length > 0){
	// 				console.log(imgChk);
					imgChk =  true;
					$("#imgChk").val(imgChk);
									
				}
			var nameCheck = $("#questionName").val();
			var pointInfo = $('#pointSet').val();
			var HashTagVal = HashTagSave();
			$('#hash-tag-val').val(HashTagVal);
//				console.log(HashTagVal);
			if(nameCheck == null || nameCheck == ""){
				alert("제목을 입력하세요");
			} else if(nameCheck.length < 2){
				alert("제목은 2자 이상 입력하세요");
			} else if(summernoteVal == null || summernoteVal == "") {
				alert("내용을 입력하세요");
			} else if(pointInfo == 0) {
				alert("포인트설정 없이 답글을 채택하면 본인의 포인트차감없이\n답글이 채택된 분에게 10포인트를 드립니다");
				var reallyOK = confirm("이대로 질문 하시겠습니까?");
				if(reallyOK == true){
					$("#questionForm").submit();
				} else {
					return false;
				}
			} else if(pointInfo != null || pointInfo != 0){
				$.ajax({
					url:"${pageContext.request.contextPath}/question/userpoint",
					type:'GET',
					success:function(data){
						if(data > pointInfo){
							var really = confirm("이대로 등록 하시겠습니까?");
							if(really == true) {
								$("#questionForm").submit();
							} else {
								return false;
							}
						} else if (data == pointInfo) {
							var pointzero = confirm("이대로 등록시 본인의 포인트가 0이 됩니다. 괜찮겠습니까?");
							if(pointzero == true){
								$("#questionForm").submit();
							} else {
								return false;
							}
						} else {
							alert("포인트 설정은 본인의 포인트보다 크게 할 수 없습니다");
						}
					}
				});
			}
		});
		//해시태그 저장준비
		function HashTagSave(){
			var Tie = "";
			for(var i=0; i < exist.length; i++){
				if((i+1) != exist.length){
					Tie += exist[i] + ",";
				} else {
					Tie += exist[i];
				}
				
			}
			return Tie;
		}
		//작성취소
		$('.Go-back').click(function(){
			var really = confirm("작성을 취소하시면 현재 작성한 내용이 사라집니다. 괜찮겠습니까?");
			if(really == true){
				window.location.href="list";
			} else {
				return false;
			}
		});
		//해시태그등록준비
		var hashTag = "";
		var exist=[];
		var counter = 0;
		var Doppelganger = 0;
		//해시태그등록
		$('#hash-tag').on("keyup",function (e) {
//			console.log(e);
//			console.log(e.key);
// 			console.log(exist);

			if(e.key === "Enter" || e.key === " " || (new RegExp(/[^a-zA-Z가-힣]/)).test(e.key)) {
				Doppelganger = 0;
				for(var i=0; i < exist.length; i++){
					if(exist[i] === hashTag && exist[i] != "") {
						alert("같은 태그가 존재합니다.");
						hashTag = "";
						$('#hash-tag').val("");
						Doppelganger = 1;
					}
 				}
				if(hashTag == null || hashTag == ""){
					alert("태그내용을 입력하세요");
				} else if(hashTag.length > 7){
					alert("태그내용은 7자를 초과할 수 없습니다.");
				} else {
					if(Doppelganger == 0){
						exist[counter] = hashTag;
						$('#hash-tag-list').append('<li class="addTag">#'+hashTag+'<span class="delTag" idx="'+counter+'">X</span></li>');
						hashTag = "";
						$('#hash-tag').val("");
//	 					console.log(exist[counter]);
						counter++;
					}
//	 				console.log(exist);
				}
			} else {
				hashTag = $('#hash-tag').val();
//  				console.log(hashTag);
			}
		});
		//해시태그삭제
		$(document).on("click", ".delTag", function() {
			var Tagcode = $(this).attr("idx");
			exist[Tagcode] = "";
			$(this).parent().remove();
// 			console.log(exist);
		});

	});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '${pageContext.request.contextPath}/question/profileUpload',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				$(el).summernote('editor.insertImage',
						'${pageContext.request.contextPath}' + img_name);
			}
		});
	}
	
</script>
<script src="https://unpkg.com/vue"></script>	

</head>
<header>
<jsp:include page="../gnb/head.jsp" flush="true" />

</header>
<body>
<div class="container">
	<div><a class="subtitle">질문하기</a></div>
	<div class="innerbox">
	<form action="add" method="post" enctype="multipart/form-data" id="questionForm">
		<!-- <sec:csrfInput /> -->
		<div class="naming-box" id="naming-box">
			<img src="${pageContext.request.contextPath}/resources/images/icon/add-search.png" class="searchimg">
			<label> 제목 </label> <input v-model="t" type="text" name="questionName" class="naming" id="questionName">
			<a class="char-limit">({{ tl }}/80자)</a>
		</div>
		<script>
			var titleCheck = new Vue({
				el:'#naming-box',
				data: {
					t:'',
					tl:0,
					to:''
				},
				watch: {
					t: function(v) {
						this.tl = Number(v.length);
						if(this.tl > 80) {
							alert("더 이상 입력하실 수 없습니다.");
							this.to = v.substr(0, 80);
							/* console.log(this.to); */
							this.t = this.to;
						}
					}
				}
			});
		</script>
		<div class="hash-tag" id="hashTag">
			<input type="hidden" value="" name="hashTag" id="hash-tag-val">
			<input type="text" id="hash-tag" v-model="typing" placeholder="#해시태그를 입력하세요">
			<ul id="hash-tag-list">
			</ul>
		</div>
		<div id="content-box">
			<textarea name="questionContent" id="summernote" cols="120" rows="50" value=""></textarea>
		</div>
		<div class="point_buttons" id="point_buttons">
			<ul class="point_bar">
				<li class="point-set" id="zero" value="0">
					<button type="button" class="chart-menti btn-collection menti-btn">
						<span>0 point</span>
					</button></li>
				<li class="point-set" id="ten" value="10">
					<button type="button" class="chart-menti btn-collection menti-btn">
						<span>10 point</span>
					</button></li>
				<li class="point-set" id="twenty" value="30">
					<button type="button" class="chart-menti btn-collection menti-btn">
						<span>30 point</span>
					</button></li>
				<li class="point-set" id="thirty" value="50">
					<button type="button" class="chart-menti btn-collection menti-btn">
						<span>50 point</span>
					</button></li>
				<li class="point-set" id="forty" value="70">
					<button type="button" class="chart-menti btn-collection menti-btn">
						<span>70 point</span>
					</button></li>
				<li class="point-set" id="fifty" value="100">
					<button type="button" class="chart-menti btn-collection menti-btn">
						<span>100 point</span>
					</button></li>
			</ul>
		</div>
		<div class="point-box">
			<div class="point-setting-complete" id="point-set">
				<button type="button" class="chart-menti btn-collection menti-btn">
					<span>포인트 설정</span>
				</button>
			</div>
			<div class="point-input"><div id="pointExplanation"><span>채택한 답변자에게 추가 포인트를 드립니다</span></div></div>
			<input type="hidden" name="pointSet" id="pointSet" value="0">
		</div>
		
		<div>
			<input type="hidden" name="imgChk" id="imgChk" value="false">
		</div>
		<div class="buttons">
<!-- 			<input type="submit" value="등록하기"> -->
			<button type="button" id="questionSubmit">등록하기</button>
			<a><div class="Go-back">작성취소</div></a>
		</div>
		
	</form>
	</div>
</div>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>