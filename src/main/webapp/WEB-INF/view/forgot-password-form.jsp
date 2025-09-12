<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html lang="en">

    <head>

      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="">
      <meta name="author" content="">

      <title>Forgot Password</title>

      <!-- Bootstrap Css link -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

      <!-- Custom styles for this template-->
      <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

    </head>

    <body class="bg-gradient-primary">

      <div class="container">

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
                        <h3 class="h4 text-grey-900 mb-4">Reset Your Password</h3>
                        <c:if test="${message != null }">
                          <c:choose>
                            <c:when test="${message.contains('successfully')}">
                              <h6 class="h4 text-green-900 mb-4" style="color:green;">${message}</h6>
                            </c:when>
                            <c:otherwise>
                              <h6 class="h4 text-red-900 mb-4" style="color:red;">${message}</h6>
                            </c:otherwise>
                          </c:choose>
                        </c:if>
                      </div>
                      <form:form class="user" action="${pageContext.request.contextPath}/forgot-password/reset"
                        method="post" modelAttribute="forgotPassword">
                        <div class="form-group">
                          <form:input type="email" class="form-control form-control-user"
                            placeholder="Enter your registered email address" path="email" required="required" />
                        </div>
                        <div class="form-group">
                          <form:password class="form-control form-control-user" placeholder="Enter new password"
                            path="newPassword" required="required" />
                        </div>
                        <div class="form-group">
                          <form:password class="form-control form-control-user" placeholder="Confirm new password"
                            path="confirmPassword" required="required" />
                        </div>
                        <input type="submit" class="btn btn-primary btn-user btn-block" value="Reset Password" />
                        <hr>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary btn-user btn-block">
                          <i class="fas fa-arrow-left fa-fw"></i> Back to Login
                        </a>
                      </form:form>
                      <hr>
                      <div class="text-center">
                        <a class="small" href="${pageContext.request.contextPath}/register">Create an Account!</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div>

      </div>

      <!-- Bootstrap core JavaScript-->
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    </body>

    </html>