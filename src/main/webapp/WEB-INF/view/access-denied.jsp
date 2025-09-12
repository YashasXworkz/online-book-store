<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Access Denied - Online Book Store</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body class="bg-light">
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body text-center">
            <h1 class="text-danger">403</h1>
            <h3 class="text-dark mb-4">Access Denied</h3>
            <p class="text-muted">You don't have permission to access this resource.</p>
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Go to Home</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>