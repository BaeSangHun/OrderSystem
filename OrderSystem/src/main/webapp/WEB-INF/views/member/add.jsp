<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입</title>
<script>
var obj;
	$(document).ready(function(){
		//유효성검사				
		$("#SignUp").click(function(){
			obj = document.fr;
			
			if(obj.username.value.length <8 || obj.username.value.length > 10){
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
			}else if(obj.username.value.length == 0){
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>아이디를 입력해주세요</span>");
			}else if(/^[^a-z]|^a-z0-9]+|^([a-z]+|[0-9]+)$/.test(obj.username.value)){
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
			}else{
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/idChk",
					data:{
						"username":obj.username.value
					},
					success:function(data){
						if(data == 0){
							document.getElementById("idchk").innerHTML = ("<span style='color:green;'>사용 가능한 아이디 입니다.</span>");
								
								if(obj.password.value.length <8 || obj.password.value.length >10){
									document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
								}else if(obj.password.value.length == 0){
									document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>비밀번호를 입력해주세요</span>");
								}else if(/^[^a-z]|^a-z0-9]+|^([a-z]+|[0-9]+)$/.test(obj.password.value)){
									document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
								}else{
									document.getElementById("pwchk").innerHTML = ("");
								}
							
								if(obj.repassword.value.length > 0){
									if(obj.password.value.length > 0 && repassword.value.length > 0){
										if(obj.password.value == obj.repassword.value){
											
// 											document.getElementById("rePwchk").innerHTML = ("<span style='color:green;'>비밀번호가 일치합니다.</span>");
											alert("회원 가입이 완료 되었습니다.");
											obj.submit();
										}else{
											document.getElementById("rePwchk").innerHTML = ("<span style='color:red;'>비밀번호를 확인 해주세요</span>");
										}
									}
									
								}else{
									obj.repassword.value = "";
									document.getElementById("rePwchk").innerHTML = ("<span style='color:red;'>비밀번호를 다시 입력해주세요</span>");
								}
							}else{
							document.getElementById("idchk").innerHTML = ("<span style='color:red;'>이미 사용중인 아이디 입니다.</span>");
						}
					}
				});
			}	
		});

	});
	
	
		
	
		//아이디 공백 검사 및 중복체크
		function userNameChk(){
			
			obj = document.fr;
			if(obj.username.value.length <8 || obj.username.value.length > 10){
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
			}else if(/^[^a-z]|^a-z0-9]+|^([a-z]+|[0-9]+)$/.test(obj.username.value)){
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
			}else if(obj.username.value.length > 0){
				
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/idChk",
					data:{
						"username":obj.username.value
					},
					success:function(data){
						if(data == 0){
							document.getElementById("idchk").innerHTML = ("<span style='color:green;'>사용 가능한 아이디 입니다.</span>");
						}else{
							document.getElementById("idchk").innerHTML = ("<span style='color:red;'>이미 사용중인 아이디 입니다.</span>");
						}
					}
				});	
			}else{
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>아이디를 입력해주세요</span>");
			}
		}
		
		//비밀번호 공백 검사
		function userPasswordChk(){
			obj = document.fr;
			if(obj.password.value.length <8 || obj.password.value.length >10){
				document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
			}else if(obj.password.length > 0){
				document.getElementById("pwchk").innerHTML = ("");
			}else if(/^[^a-z]|^a-z0-9]+|^([a-z]+|[0-9]+)$/.test(obj.password.value)){
				document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>첫글자 영문 숫자 조합의 8~10자로 구성해주세요</span>");
			}else if(obj.password.length == 0){
				document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>비밀번호를 입력해주세요</span>");			
			}else{
				document.getElementById("pwchk").innerHTML = ("");
			}
		}
		
		//비밀번호 확인 검사
		function userRePasswordChk(){
			if(repassword.value.length > 0){
				if(obj.password.value == obj.repassword.value){
// 					document.getElementById("rePwchk").innerHTML = ("<span style='color:green;'>비밀번호가 일치합니다.</span>");
				}else{
					document.getElementById("rePwchk").innerHTML = ("<span style='color:red;'>비밀번호를 확인 해주세요</span>");
				}
			}else{
				document.getElementById("rePwchk").innerHTML = ("<span style='color:red;'>비밀번호를 재 입력 해주세요</span>");
			}
		}
		
</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
        <div id="sinup_container" >
<!--                 <h1> -->
<!--                     THE RIGHT -->
<!--                     <br> -->
<!--                     EXERCISE FOR ME -->
<!--                 </h1> -->
                <div class="singup_content_box">
                <div class="singup-title-img-box">
                <img src="${pageContext.request.contextPath}/resources/images/nopain-nogain.png" alt="nopain-nogain"/>
                </div>
<!--                     <div class="choosebox"> -->
<!--                         <h2>CHOOSE JOIN</h2> -->
<!--                         <img src="graybox.PNG" class="graybox"> -->
<!--                         <span class="graybox"></span> -->
<!--                         <ul> -->
<!--                             <li>Member</li> -->
<!--                            <li>Trainer</li> -->
<!--                         </ul> -->
<!--                     </div> -->
                    <div class="joinbox">
                        <h2>JOIN</h2>
                        <form action="add" method="post" name="fr">
                            <ul class="join_uls">
                                <li>
                                    <ul>
                                        <li><label>User ID</label></li>
                                        <li><input type="text" id="username" name="username" onblur="userNameChk()"></li>
                                        <li><span id="idchk"></span></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Password</label></li>
                                        <li><input type="password" id="password" name="password" onblur="userPasswordChk()"></li>
                                        <li><span id="pwchk"></span></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Confirm Password</label></li>
                                        <li><input type="password" id="repassword" name="repassword" onblur="userRePasswordChk()"></li>
                                        <li><span id="rePwchk"></span></li>
                                    </ul>
                                </li>
<!--                                 <li> -->
<!--                                     <ul> -->
<!--                                         <li><label>Nick Name</label></li> -->
<!--                                         <li><input type="text"></li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <ul> -->
<!--                                         <li><label>Email</label></li> -->
<!--                                         <li><input type="text"></li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
                                <li>              
                                    <input type="button" id="SignUp" value="JOIN">        
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
    </body>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</html>