
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="col-lg-12 grid-margin stretch-card">
	<div class="card">
		<div class="card-body"
			style="background: radial-gradient(#004ae4, transparent);">
			<!-- 			<form id="mainform" class="form-sample"> -->
			<p class="card-description">
				<b>Update details</b>
			</p>

			<div class="row">
				<div class="col-md-8 stretch-card grid-margin">
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<form id="formBasicUpdate" class="form-sample">
										<div class="row">
											<div class="col-md-6">
												<label>Basic</label>
											</div>

											<div class="col-md-6">
												<label>LogID : ${user.uniqueId}</label> <br> <label>Name
													:${user.name}</label> <br> <br> <br>
											</div>
										</div>
										<!-- 									<p class="card-title text-black">Basic</p> -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Name</label>
													<div class="col-sm-9">
														<input type="text" name="name" value="${user.name}"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Email</label>
													<div class="col-sm-9">
														<input type="text" name="username" value="${user.email}"
															class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Address1</label>
													<div class="col-sm-9">
														<input type="text" name="address1"
															value="${user.address1}" class="form-control" />
													</div>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Address2</label>
													<div class="col-sm-9">
														<input type="text" name="address2"
															value="${user.address2}" class="form-control" />
													</div>
												</div>
											</div>

										</div>
										<div class="row">

											<div class="col-md-3">
												<div class="form-group row">
													<div class="col-sm-12">
														<select class="form-control form-control-lg"
															id="exampleFormControlSelect2" name="country"
															required="required">
															<c:if test="${not empty user.country}">
																<option value="${user.country}" selected>${user.country}</option>
															</c:if>
														</select>
													</div>
												</div>

											</div>
											<div class="col-md-4">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">State</label>
													<div class="col-sm-8">
														<select onchange="getDistrict()" class="form-control"
															name="state" id="state">
															<c:forEach items="${states}" var="state">
																<c:if test="${user.stateId eq state.id}">
																	<option value="${state.id}" selected>${state.name}</option>
																</c:if>
																<c:if test="${user.stateId ne state.id}">
																	<option value="${state.id}">${state.name}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>

											</div>
											<div class="col-md-5">
												<div class="form-group row">
													<label class="col-sm-5 col-form-label">District</label>
													<div class="col-sm-7">
														<select class="form-control" name="district" id="district">
															<c:forEach items="${districts}" var="dist">
																<c:if test="${user.districtId eq dist.id}">
																	<option value="${dist.id}" selected>${dist.name}</option>
																</c:if>
																<c:if test="${user.districtId ne dist.id}">
																	<option value="${dist.id}">${dist.name}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">City</label>
													<div class="col-sm-9">
														<input type="text" name="city" placeholder="city"
															value="${user.city}" class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Pincode</label>
													<div class="col-sm-8">
														<input type="text" name="pincode" placeholder="pincode"
															value="${user.pincode}" class="form-control" />
													</div>
												</div>
											</div>
										</div>


										<button type="button" id="submitBasicUpdate"
											onclick="onBasicUpadate('${user.id}')"
											class="btn btn-primary mr-2">Submit</button>
										<button class="btn btn-light">Cancel</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-black">Nominee Details</p>
									<form id="formNomUpdate" class="form-sample">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<div class="col-sm-12">
														<input type="text" name="firstName" value=""
															placeholder="Nominee Name" class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<div class="col-sm-12">
														<input type="text" name="LastName" value=""
															placeholder="Nominee relation" class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Advisor Name</label>
													<div class="col-sm-9">
														<input type="text" name="address1" value="${user.name}"
															class="form-control" />
													</div>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Adv mobile</label>
													<div class="col-sm-9">
														<input type="text" name="address1" value="${user.name}"
															class="form-control" />
													</div>
												</div>
											</div>

										</div>

										<button type="button" id="submitNomUpdate"
											onclick="onNomUpadate()" class="btn btn-primary mr-2">Submit</button>
										<button class="btn btn-light" type="reset">Cancel</button>
									</form>

								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-4 stretch-card grid-margin">
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title">Update Mobile</p>
									<form id="formMobileUpdate" class="form-sample">
										<div class="form-group row">
											<div class="col-sm-12">
												<input type="text" name="mobile" value="${user.mobile}"
													id="mobileInput" placeholder="Mobile Number"
													class="form-control" />
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-12">
												<input type="text" name="mobile"
													placeholder="Enter otp to varify" class="form-control"
													placeholder="Enter otp" />
											</div>
										</div>
										<button type="button" id="submitMobileUpdate"
											onclick="onMobileUpadate()" class="btn btn-primary mr-2">Verify
											Otp</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title">Update Pan</p>
									<form id="formPanUpdate" class="form-sample">
										<div class="form-group row">
											<div class="col-sm-12">
												<input type="text" name="pan" value="${user.panNumber}"
													placeholder="Enter your pan Number" class="form-control" />
											</div>
										</div>
										<button type="button" id="submitPanUpdate"
											onclick="onPanUpadate('${user.id}')"
											class="btn btn-primary mr-2">Submit</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title">GST Details</p>
									<form id="fromGstUpdate" class="form-sample">
										<div class="form-group row">
											<div class="col-sm-12">
												<input type="text" name="gst" value="${user.gstNumber}"
													placeholder="Enter GST Number" class="form-control" />
											</div>
										</div>
										<button type="button" id="submitGstUpdate"
											onclick="onGstUpadate('${user.id}')"
											class="btn btn-primary mr-2">Submit</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!--
			<div class="row">
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Name</label>
						<div class="col-sm-9">
							<input type="text" name="firstName" value="${user.name}"
								class="form-control" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Email</label>
						<div class="col-sm-9">
							<input type="text" name="LastName" value="${user.email}"
								class="form-control" />
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">City</label>
						<div class="col-sm-9">
							<input type="email" name="email" value="${user.city}"
								class="form-control" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Mobile Number</label>
						<div class="col-sm-9">
							<input type="number" name="mobile" value="${user.mobile}"
								class="form-control" />
						</div>
					</div>
				</div>
			</div>




			 <div class="row">
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
		 
			<button type="button" id="submitButton" class="btn btn-primary mr-2">Submit</button>
			<button class="btn btn-light"
				onclick="loadFormPage('students','Student Data')">Cancel</button>   -->
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--   update mobile  -->
<script>
	function getDistrict() {
		var pk = $("#state").val();
		var contextPath = "http://localhost:8585";
		// 		var data = new FormData();
		// 		data.append("pk", pk)
		$.ajax({
			type : "POST",
			url : contextPath + "/districts/" + pk,
			// 			data: data,
			// 			processData: false,
			contentType : false,
			cache : false,
			success : function(data) {
				debugger;
				console.log(data);
				var district = $("#district");
				if (data) {
					var str = '';
					str = '<option value="">--Select--</option>';
					$.each(data, function(i, dist) {
						if (dist.id === user.districtId) {
							str += '<option value="' + dist.id + '"selected>'
									+ dist.name + '</option>';
						} else {
							str += '<option value="' + dist.id + '">'
									+ dist.name + '</option>';
						}

					});
					district.html(str);
					district.chosen("destroy").chosen();
					district.trigger("chosen :updated");
					// 					custMasterLocationPk.siblings('.chosen-container').find('.chosen-single').removeClass("chosen-single");			  
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				toastMessage('error',
						"Something went wrong during getting custmer loction");
			}
		});
	}

	function onMobileUpadate() {
		toastMessage("success", 'Update Mobile Nuber')

	}

	function onPanUpadate(id) {
		debugger;
		// Serialize the form data
		var formData = $("#formPanUpdate").serialize();
		var contextPath = "http://localhost:8585";

		$.ajax({
			type : "POST",
			url : contextPath + "/users/pan-update/" + id, // Replace with your actual endpoint
			data : formData,
			success : function(data) {
				// Handle the success response, e.g., update the UI or show a message
				toastMessage("success", 'Pan Number Updated ..!')
				// 											loadFormPage('students','Student List')

			},
			error : function(jqXHR, textStatus, errorThrown) {
				// Handle errors
				console.error("POST request failed:", textStatus, errorThrown);
				// 											loadFormPage('students',
				// 													'Student List')

			}
		});
	}

	function onGstUpadate(id) {

		debugger;
		// Serialize the form data
		var formData = $("#fromGstUpdate").serialize();
		var contextPath = "http://localhost:8585";

		$.ajax({
			type : "POST",
			url : contextPath + "/users/gst-update/" + id, // Replace with your actual endpoint
			data : formData,
			success : function(data) {
				// Handle the success response, e.g., update the UI or show a message
				toastMessage("success", 'Gst Updated!')
				// 											loadFormPage('students','Student List')

			},
			error : function(jqXHR, textStatus, errorThrown) {
				// Handle errors
				console.error("POST request failed:", textStatus, errorThrown);
				// 											loadFormPage('students',
				// 													'Student List')

			}
		});
	}

	function onBasicUpadate(id) {
		debugger;
		// Serialize the form data
		var formData = $("#formBasicUpdate").serialize();
		var contextPath = "http://localhost:8585";

		$.ajax({
			type : "POST",
			url : contextPath + "/users/basic-update/" + id, // Replace with your actual endpoint
			data : formData,
			success : function(data) {
				// Handle the success response, e.g., update the UI or show a message
				toastMessage("success", 'Basic Details Updated!')
				// 											loadFormPage('students','Student List')

			},
			error : function(jqXHR, textStatus, errorThrown) {
				// Handle errors
				console.error("POST request failed:", textStatus, errorThrown);
				// 											loadFormPage('students',
				// 													'Student List')

			}
		});

	}
	function onNomUpadate() {
		toastMessage("success", 'Update Nominee Details')
	}

	// 	for otp generate  
	// 	<script>
	// 	$(document).ready(function() {
	// 	    // Select the input field by its ID
	// 	    const mobileInput = $('#mobileInput');

	// 	    // Add an event listener for input changes
	// 	    mobileInput.on('input', function() {
	// 	        // Get the value entered by the user
	// 	        const enteredMobile = mobileInput.val();
	//              debugger;
	// 	        // Make an AJAX call here
	// 	        $.ajax({
	// 	            type: 'POST', // or 'GET' depending on your requirements
	// 	            url: '/your-ajax-endpoint-url', // Replace with your actual URL
	// 	            data: {
	// 	                mobile: enteredMobile
	// 	            },
	// 	            success: function(response) {
	// 	                // Handle the AJAX response here
	// 	                console.log('AJAX response:', response);
	// 	            },
	// 	            error: function(error) {
	// 	                // Handle any AJAX errors here
	// 	                console.error('AJAX error:', error);
	// 	            }
	// 	        });
	// 	    });
	// 	});
</script>