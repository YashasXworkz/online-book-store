<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <html lang="en">

      <head>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Edit Book - Admin Panel</title>

        <!-- Custom fonts for this template -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
          type="text/css">
        <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

      </head>

      <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

          <!-- Sidebar -->
          <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"
              href="${pageContext.request.contextPath}/admin">
              <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-user-shield"></i>
              </div>
              <div class="sidebar-brand-text mx-3">Admin Panel</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
              Book Management
            </div>

            <!-- Nav Item - Add New Book -->
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/books/add">
                <i class="fas fa-fw fa-plus-circle"></i>
                <span>Add New Book</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
              Security
            </div>

            <!-- Nav Item - Back to Customer -->
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/customers">
                <i class="fas fa-fw fa-user"></i>
                <span>Customer Panel</span></a>
            </li>

            <!-- Nav Logout button -->
            <li class="nav-item" onClick="return confirm('Do you really want to logout?')">
              <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-fw fa-sign-out-alt"></i>
                <span>Logout</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
              <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

          </ul>
          <!-- End of Sidebar -->

          <!-- Content Wrapper -->
          <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <!-- Topbar -->
              <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                  <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                  <div class="topbar-divider d-none d-sm-block"></div>

                  <!-- Nav Item - User Information -->
                  <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false">
                      <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin User</span>
                      <img class="img-profile rounded-circle"
                        src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/customers">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Customer Panel
                      </a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/logout" data-toggle="modal"
                        data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                      </a>
                    </div>
                  </li>

                </ul>

              </nav>
              <!-- End of Topbar -->

              <!-- Begin Page Content -->
              <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                  <h1 class="h3 mb-0 text-gray-800">
                    <i class="fas fa-edit"></i> Edit Book
                  </h1>
                  <a href="${pageContext.request.contextPath}/admin"
                    class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">
                    <i class="fas fa-arrow-left fa-sm text-white-50"></i> Back to Dashboard
                  </a>
                </div>

                <!-- Messages -->
                <c:if test="${message != null}">
                  <div
                    class="alert alert-${messageType == 'success' ? 'success' : 'danger'} alert-dismissible fade show"
                    role="alert">
                    <i class="fas fa-${messageType == 'success' ? 'check-circle' : 'exclamation-triangle'}"></i>
                    ${message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                </c:if>

                <!-- Edit Book Form -->
                <div class="card mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">
                      <i class="fas fa-book-open"></i> Edit Book Information
                    </h6>
                  </div>
                  <div class="card-body">
                    <form:form method="POST" action="${pageContext.request.contextPath}/admin/books/edit"
                      modelAttribute="book">
                      <form:hidden path="id" />
                      <form:hidden path="bookDetail.id" />

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="name" class="form-label">
                              <i class="fas fa-book"></i> Book Name *
                            </label>
                            <form:input type="text" class="form-control" path="name" placeholder="Enter book name"
                              required="true" />
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="bookDetail.type" class="form-label">
                              <i class="fas fa-tags"></i> Book Type *
                            </label>
                            <form:select class="form-control" path="bookDetail.type" required="true">
                              <form:option value="">Select Book Type</form:option>
                              <form:option value="Fiction">Fiction</form:option>
                              <form:option value="Non-Fiction">Non-Fiction</form:option>
                              <form:option value="Science">Science</form:option>
                              <form:option value="Technology">Technology</form:option>
                              <form:option value="Biography">Biography</form:option>
                              <form:option value="History">History</form:option>
                              <form:option value="Mystery">Mystery</form:option>
                              <form:option value="Romance">Romance</form:option>
                              <form:option value="Educational">Educational</form:option>
                              <form:option value="Others">Others</form:option>
                            </form:select>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="bookDetail.detail" class="form-label">
                          <i class="fas fa-info-circle"></i> Book Description *
                        </label>
                        <form:textarea class="form-control" path="bookDetail.detail" rows="4"
                          placeholder="Enter book description, summary, or details" required="true"></form:textarea>
                      </div>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="quantity" class="form-label">
                              <i class="fas fa-warehouse"></i> Quantity *
                            </label>
                            <form:input type="number" class="form-control" path="quantity" placeholder="Enter quantity"
                              min="0" required="true" />
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="price" class="form-label">
                              <i class="fas fa-rupee-sign"></i> Price (<span>&#8377;</span>) *
                            </label>
                            <form:input type="number" class="form-control" path="price" placeholder="Enter price"
                              min="0" step="0.01" required="true" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">
                          <i class="fas fa-save"></i> Update Book
                        </button>
                        <a href="${pageContext.request.contextPath}/admin" class="btn btn-secondary ml-3">
                          <i class="fas fa-times"></i> Cancel
                        </a>
                      </div>
                    </form:form>
                  </div>
                </div>

              </div>
              <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

          </div>
          <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
          <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
              <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
              </div>
            </div>
          </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <!-- Custom admin scripts -->
        <script>
          // Sidebar toggle functionality
          $(document).ready(function () {
            $('#sidebarToggle, #sidebarToggleTop').on('click', function (e) {
              $("body").toggleClass("sidebar-toggled");
              $(".sidebar").toggleClass("toggled");
            });
          });
        </script>

      </body>

      </html>