<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%-- header.jsp 붙히기 --%>
   <%@ include file="../includes/header.jsp" %>
   
   <%-- login template에서 container 복붙 --%>
   <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form action="/member/signup" method="post" class="user">
                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="id" 
                                        placeholder="ID">
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
                                    <input type="text" class="form-control form-control-user" name="name"
                                        placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="email"
                                        placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="phone"
                                        placeholder="Phone Number ex. 000-0000-0000">
                                </div>
                                <div class="form-group">
                                   <div class="custom-control custom-checkbox medium">
                                       <input type="radio" class="custom-control-input" name="gender" value="M" id="maleRadio" checked >
                                        <label class="custom-control-label" for="maleRadio">Male</label>
                           </div>
                           <div class="custom-control custom-checkbox medium">
                                       <input type="radio" class="custom-control-input" name="gender" value="F" id="femaleRadio">
                                        <label class="custom-control-label" for="femaleRadio">Female</label>
                           </div>
                                </div>
                                
                                <input type="submit" value="Register Account" class="btn btn-primary btn-user btn-block" />
                                <a href="/main" class="btn btn-info btn-user btn-block">
                                    Cancel
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="/member/login">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> <!-- .container -->
   
   
   
   
   
   
   <%-- footer.jsp 붙히기 --%>       
   <%@ include file="../includes/footer.jsp" %>  