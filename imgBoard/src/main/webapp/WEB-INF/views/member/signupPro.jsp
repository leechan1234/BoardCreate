<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%-- header.jsp 붙히기 --%>
   <%@ include file="../includes/header.jsp" %>
   <c:if test="${result != 1}">
   		<script>
   			alert("회원 가입 처리 실패..");
   			history.go(-1);
   		</script>
   </c:if>
   
   
   <%-- login template에서 container 복붙 --%>
   <div class="container">

      <h1 class="h3 mb-2 text-gray-800">Signup Pro</h1>

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Thanks for signing up, <br /> ${member.name}!</h1>
                                        <p class="mb-2"> Your account has been created. </p>
                                    </div>
                                    <br />
                                    <form class="user">
                                        
                                       
                                        <a href="/member/login" class="btn btn-primary btn-user btn-block mb-2">
                                            로그인
                                        </a>
                                        <a href="/main" class="btn btn-info btn-user btn-block mb-2">
                                            메인
                                        </a>
                                       
                                        <%-- 3초후 메인으로 이동 
                                        <meta http-equiv="refresh" content="3;url=http://localhost:8080/main" >
                                        --%>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- .container -->
   
   
   
   
   
   
   <%-- footer.jsp 붙히기 --%>       
   <%@ include file="../includes/footer.jsp" %>  