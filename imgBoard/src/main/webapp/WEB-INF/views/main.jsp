<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
    <%-- header.jsp 붙히기 --%>
   <%@ include file="includes/header.jsp" %>
   
   <%-- login template에서 container 복붙 --%>
   <div class="container">

      <h1 class="h3 mb-2 text-gray-800">Main page</h1>

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
                                        <h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
                                    </div>
                                    <form class="user">
                                        
                                        <c:if test="${sessionScope.sid == null}">
                                           <a href="/member/login" class="btn btn-primary btn-user btn-block mb-2">
                                               로그인
                                           </a>
                                           <div class="text-center">
                                              <a class="small" href="/member/signup">Create an Account!</a>
                                          </div>
                                       </c:if>
                                       <c:if test="${sessionScope.sid != null}">
                                           <a href="/member/logout" class="btn btn-primary btn-user btn-block mb-2">
                                               로그아웃
                                           </a>
                                           <a href="/member/mypage" class="btn btn-primary btn-user btn-block mb-2">
                                               마이페이지
                                           </a>
                                       </c:if>
                                       
                                        <hr> <br />
                                        <a href="/board/list" class="btn btn-info btn-user btn-block">
                                              게시판
                                        </a>
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
   <%@ include file="includes/footer.jsp" %>  