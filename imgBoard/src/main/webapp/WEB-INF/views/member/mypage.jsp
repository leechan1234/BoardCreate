<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <%-- header.jsp 붙히기 --%>
   <%@ include file="../includes/header.jsp" %>
   
   <%-- login template에서 container 복붙 --%>
    
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-lg-block bg-light">
                               <div class="p-5">
                                  <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Profile</h1>
                                    </div>
                                  <div class="row align-items-center mb-3">
                                       <div class="col mr-2">
                                           <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">ID</div>
                                           <div class="h5 mb-0 font-weight-bold text-gray-800">${member.id}</div>
                                       </div>
                                   </div>
                                   <div class="row align-items-center mb-3">
                                       <div class="col mr-2">
                                           <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Name</div>
                                           <div class="h5 mb-0 font-weight-bold text-gray-800">${member.name}</div>
                                       </div>
                                   </div>
                                   <div class="row align-items-center mb-3">
                                       <div class="col mr-2">
                                           <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Email</div>
                                           <div class="h5 mb-0 font-weight-bold text-gray-800">${member.email}</div>
                                       </div>
                                   </div>
                                   <div class="row align-items-center mb-3">
                                       <div class="col mr-2">
                                           <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Phone</div>
                                           <div class="h5 mb-0 font-weight-bold text-gray-800">${member.phone}</div>
                                       </div>
                                   </div>
                                   <div class="row align-items-center mb-3">
                                       <div class="col mr-2">
                                           <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Gender</div>
                                           <div class="h5 mb-0 font-weight-bold text-gray-800">
                                              <c:if test="${member.gender == 'M'}">Male</c:if>
                                              <c:if test="${member.gender == 'F'}">Female</c:if>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row align-items-center mb-3">
                                       <div class="col mr-2">
                                           <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Registration Date</div>
                                           <div class="h5 mb-0 font-weight-bold text-gray-800">
                                              <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${member.reg}"/>
                                           </div>
                                       </div>
                                   </div>
                                   
                                </div>
                            </div>
                            
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Mypage</h1>
                                    </div>
                                    <form class="user">
                                        <a href="/member/modify" class="btn btn-info btn-user btn-block">
                                          회원 정보 수정
                                      </a>
                                      <a href="/member/delete" class="btn btn-danger btn-user btn-block">
                                          회원 탈퇴
                                      </a>
                                      <a href="/main" class="btn btn-primary btn-user btn-block">
                                          메인
                                      </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Change Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/logout">Logout!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
       
   
   
   <%-- footer.jsp 붙히기 --%>       
   <%@ include file="../includes/footer.jsp" %>  
    