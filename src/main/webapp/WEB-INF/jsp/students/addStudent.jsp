
<!-- <div class="col-lg-12 grid-margin stretch-card"> -->
<!-- 	<div class="card"> -->
<!-- 		<div class="card-body"> -->
			<h4>Add Student+</h4>
			<hr>
			<form id="mainform" class="form-sample" method="POST">
				<p class="card-description">Add all details</p>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">First Name</label>
							<div class="col-sm-9">
								<input type="text" name="firstName" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Last Name</label>
							<div class="col-sm-9">
								<input type="text" name="lastName" class="form-control" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Email</label>
							<div class="col-sm-9">
								<input type="email" name="email" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Mobile Number</label>
							<div class="col-sm-9">
								<input type="number" name="mobile" class="form-control" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Course</label>
							<div class="col-sm-9">
								<input type="text" name="course" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">LinkReferralCode</label>
							<div class="col-sm-9">
								<input type="text" name="linkReferralCode" class="form-control" />
							</div>
						</div>
					</div>
				</div>

				<!-- <div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Gender</label>
							<div class="col-sm-9">
								<select class="form-control" name="gender">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Date of Birth</label>
							<div class="col-sm-9">
								<input class="form-control" placeholder="dd/mm/yyyy" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Category</label>
							<div class="col-sm-9">
								<select class="form-control">
									<option>Category1</option>
									<option>Category2</option>
									<option>Category3</option>
									<option>Category4</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Membership</label>
							<div class="col-sm-4">
								<div class="form-check">
									<label class="form-check-label"> <input type="radio"
										class="form-check-input" name="membershipRadios"
										id="membershipRadios1" value="" checked> Free
									</label>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-check">
									<label class="form-check-label"> <input type="radio"
										class="form-check-input" name="membershipRadios"
										id="membershipRadios2" value="option2"> Professional
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<p class="card-description">Address</p>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Address 1</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">State</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Address 2</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Postcode</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">City</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Country</label>
							<div class="col-sm-9">
								<select class="form-control">
									<option>America</option>
									<option>Italy</option>
									<option>Russia</option>
									<option>Britain</option>
								</select>
							</div>
						</div>
					</div>
				</div>
		 -->
				<button type="button" id="submitButton" class="btn btn-primary mr-2">Submit</button>
				<button class="btn btn-light"
					onclick="loadFormPage('students','Student Data')">Cancel</button>
			</form>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->





<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $("#submitButton").click(function () {
    //	debugger;
        // Serialize the form data
        var formData = $("#mainform").serialize();
        var contextPath = "http://localhost:8585";
			debugger;
			$.ajax({
				type : "POST",
				url : contextPath + "/students/save", // Replace with your actual endpoint
				data : formData,
				success : function(data) {
					debugger;
					// Handle the success response, e.g., update the UI or show a message
				//	alert("POST request successful:", data);
				//	swal("Good job!", "You clicked the button!", "success");
				toastMessage("success", 'Student Added!')
					loadFormPage('students', 'Student List');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					// Handle errors
				//	alert("POST request failed:", textStatus, errorThrown);
					loadFormPage('students', 'Student List');
				}
			});
		});
	});
</script>