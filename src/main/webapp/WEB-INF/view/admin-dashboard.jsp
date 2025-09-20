<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html lang="en">

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Admin Dashboard - Online Book Store</title>

      <!-- Custom fonts for this template -->
      <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
      <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

      <!-- Custom styles for this template -->
      <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

      <!-- DataTables CSS -->
      <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"
        type="text/css">

      <!-- CSRF Token -->
      <meta name="_csrf" content="${_csrf.token}">
      <meta name="_csrf_header" content="${_csrf.headerName}">

      <style>
        .admin-card {
          border-left: 4px solid #1cc88a;
          background: linear-gradient(45deg, #f8f9fc, #ffffff);
        }

        .admin-card:hover {
          transform: translateY(-2px);
          box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
          transition: all 0.3s ease;
        }

        .stats-card {
          border-radius: 15px;
          padding: 1.5rem;
        }
      </style>
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
          <li class="nav-item active">
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
            System
          </div>

          <!-- Nav Item - Back to Customer View -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers">
              <i class="fas fa-fw fa-users"></i>
              <span>Customer View</span></a>
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
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Administrator</span>
                    <img class="img-profile rounded-circle"
                      src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80">
                  </a>
                  <!-- Dropdown - User Information -->
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/customers">
                      <i class="fas fa-users fa-sm fa-fw mr-2 text-gray-400"></i>
                      Customer View
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
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
              <h1 class="h3 mb-2 text-gray-800">Manage Books</h1>

              <!-- Messages -->
              <c:if test="${message != null}">
                <div class="alert alert-${messageType == 'success' ? 'success' : 'danger'} alert-dismissible fade show"
                  role="alert">
                  <i class="fas fa-${messageType == 'success' ? 'check-circle' : 'exclamation-triangle'}"></i>
                  ${message}
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              </c:if>


              <!-- Books Management Table -->
              <div class="card mb-4">
                <div class="card-header py-3">
                  <div class="d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">
                      <i class="fas fa-book-open"></i> All Books (${books.size()} total)
                    </h6>
                    <a href="${pageContext.request.contextPath}/admin/books/add" class="btn btn-success">
                      <i class="fas fa-plus"></i> Add New Book
                    </a>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th width="5%">Id</th>
                          <th width="25%">Book Name</th>
                          <th width="10%">Type</th>
                          <th width="20%">Detail</th>
                          <th width="10%">Quantity</th>
                          <th width="15%">Price</th>
                          <th width="15%">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="book" items="${books}" varStatus="status">
                          <tr>
                            <td>${status.index + 1}</td>
                            <td><strong>${book.name}</strong></td>
                            <td><span class="badge badge-info">${book.bookDetail.type}</span></td>
                            <td>${book.bookDetail.detail}</td>
                            <td>
                              <span
                                class="badge ${book.quantity > 10 ? 'badge-success' : book.quantity > 0 ? 'badge-warning' : 'badge-danger'}">
                                ${book.quantity} in stock
                              </span>
                            </td>
                            <td><strong>
                                <span>&#8377;</span>
                                <c:out value="${book.price}" />
                              </strong></td>
                            <td style="white-space: nowrap; color:green;">
                              <a href="${pageContext.request.contextPath}/admin/books/edit?bookId=${book.id}"
                                class="btn btn-sm btn-primary">
                                <i class="fas fa-edit"></i>
                              </a>
                              <button class="btn btn-sm btn-success" onclick="increaseQuantity(${book.id})">
                                <i class="fas fa-plus"></i>
                              </button>
                              <a href="${pageContext.request.contextPath}/admin/books/delete?bookId=${book.id}"
                                class="btn btn-sm btn-danger"
                                onclick="return confirm('Are you sure you want to delete \" ${book.name}\"?')">
                                <i class="fas fa-trash"></i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
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

      <!-- Bootstrap core JavaScript-->
      <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

      <!-- Core plugin JavaScript-->
      <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

      <!-- Custom scripts for all pages-->
      <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

      <!-- Page level plugins -->
      <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
      <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

      <!-- Custom admin scripts -->
      <script>
        // Sidebar toggle functionality
        $(document).ready(function () {
          $('#sidebarToggle, #sidebarToggleTop').on('click', function (e) {
            $("body").toggleClass("sidebar-toggled");
            $(".sidebar").toggleClass("toggled");
          });

          // Initialize DataTable with enhanced configuration
          if ($.fn.dataTable.isDataTable('#dataTable')) {
            $('#dataTable').DataTable().destroy();
          }
          $('#dataTable').DataTable({
            "pageLength": 25,
            "stateSave": true,
            "order": [[0, "asc"]],
            "columnDefs": [
              { "orderable": false, "targets": 6 } // Disable sorting on Actions column
            ]
          });
        });

        function increaseQuantity(bookId) {
          const quantity = prompt("Enter quantity to add:", "10");
          if (quantity && !isNaN(quantity) && quantity > 0) {
            // Get CSRF token
            var token = $('meta[name="_csrf"]').attr('content');
            var header = $('meta[name="_csrf_header"]').attr('content');

            var ajaxData = {
              bookId: bookId,
              quantity: quantity
            };

            var ajaxOptions = {
              url: '${pageContext.request.contextPath}/admin/books/increase-quantity',
              type: 'POST',
              data: ajaxData,
              success: function (response) {
                alert(response);
                location.reload();
              },
              error: function () {
                alert('Error increasing quantity');
              }
            };

            // Add CSRF token if available
            if (token && header) {
              ajaxOptions.beforeSend = function (xhr) {
                xhr.setRequestHeader(header, token);
              };
            }

            $.ajax(ajaxOptions);
          }
        }
      </script>

    </body>

    </html>