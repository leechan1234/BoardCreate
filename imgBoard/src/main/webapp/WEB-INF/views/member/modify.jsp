<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
    <%-- header.jsp 붙히기 --%>
   <%@ include file="../includes/header.jsp" %>
   
   <%-- login template에서 container 복붙 --%>
   <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-password-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Modify Your Account</h1>
                            </div>
                            <form action="/member/modify" method="post" class="user">
                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="id" value="${member.id}" 
                                        placeholder="ID" readonly>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            name="pw" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            name="pwCh" placeholder="Repeat Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="name" value="${member.name}"
                                        placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="email" value="${member.email}"
                                        placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="phone" value="${meber.phone}"
                                        placeholder="Phone Number ex. 000-0000-0000">
                                </div>
                                <div class="form-group">
                                      <input type="text" class="form-control form-control-user" name="gender" value="Male" readonly>
                                   <c:if test="${member.gender == 'M'}">
                                      <input type="text" class="form-control form-control-user" name="gender" value="Male" readonly>
                                   </c:if>
                                   <c:if test="${member.gender == 'F'}">
                                      <input type="text" class="form-control form-control-user" name="gender" value="Female" readonly>
                                   </c:if>
                                </div>
                                
                                <input type="submit" value="Modify Account" class="btn btn-danger btn-user btn-block" />
                                <a href="/member/mypage" class="btn btn-info btn-user btn-block">
                                    Cancel
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> <!-- .container -->
   
   
   
   
   
   
   <%-- footer.jsp 붙히기 --%>       
   <%@ include file="../includes/footer.jsp" %>  