<%@ include file="libraries.jsp"%>


<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
</head>

<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<img src="../../images/logo.svg" alt="logo">
							</div>
							<h4>New here?</h4>
							<h6 class="font-weight-light">Signing up is easy. It only
								takes a few steps</h6>
							<form action="/SaveRegistration" class="pt-3" method="POST">
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										name="refId" id="exampleInputRefId"
										placeholder="Enter Referrel Id">
								</div>

								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										name="uniqueId" id="exampleInputUniqueId"
										placeholder="Enter your unique Id" required="required">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										name="name" id="exampleInputName" placeholder="name"
										required="required">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-lg"
										name="username" id="exampleInputUsername1"
										placeholder="Enter Email" required="required">
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-lg"
										name="mobile" id="exampleInputEmail1" placeholder="Mobile"
										required="required">
								</div>
								<div class="form-group">
									<select class="form-control form-control-lg"
										id="exampleFormControlSelect2" name="country"
										required="required">
										<option value="">Country</option>
										<option value="usa">United States of America</option>
										<option value="uk">United Kingdom</option>
										<option value="india">India</option>
										<option value="germany">Germany</option>
										<option value="argentina">Argentina</option>
									</select>
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										name="password" id="exampleInputPassword1"
										placeholder="Password" required="required">
								</div>
								<div class="mb-4">
									<div class="form-check">
										<!-- 										<label class="form-check-label text-muted"> <input -->
										<!-- 											type="checkbox" class="form-check-input" name="terms" required="required"> -->
										<!-- 											I agree to all Terms & Conditions -->
										<!-- 										</label> -->
									</div>
								</div>
								<div class="mt-3">

									<button type="submit" id="submitButton"
										class="btn btn-primary mr-2">SIGN UP</button>
								</div>
								<div class="text-center mt-4 font-weight-light">
									Already have an account? <a href="login" class="text-primary">Login</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../../vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->

</body>

<script>
	$(document).ready(function() {
		$("#submitButton").click(function() {
			//	debugger;
			// Serialize the form data
			var formData = $("#mainform").serialize();
			var contextPath = "http://localhost:8585";
			debugger;
			$.ajax({
				type : "POST",
				url : contextPath + "/SaveRegistration", // Replace with your actual endpoint
				data : formData,
				success : function(data) {
					console.log(data);

					debugger;
					// Handle the success response, e.g., update the UI or show a message
					//	alert("POST request successful:", data);
					//	swal("Good job!", "You clicked the button!", "success");
					if (data.status === "error") {
						toastMessage("error", data.message);
						loadFormPage('register', '');
					}
					if (data.status === "success") {
						toastMessage("success", data.message);
						//loadFormPage('dashboard', '');
						window.location.href = '/main';
					}

				},
				error : function(jqXHR, textStatus, errorThrown) {
					// Handle errors
					//	alert("POST request failed:", textStatus, errorThrown);
					toastMessage("error", textStatus);
					loadFormPage('register', '');
				}
			});
		});
	});
</script>
<script src="theme/plugins/toastr/toastr.min.js"></script>
<script src="js/util.js"></script>

</html>
