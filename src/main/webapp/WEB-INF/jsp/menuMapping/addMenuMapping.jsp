<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../libraries.jsp" %>

<style>
.chosen-container-single {
	width: 131px;
}
</style>

<div class="card">
		<hr>
		<form id="mainform" class="form-sample" method="POST">
			<p class="card-description">Add details</p>
			<div class="row">
				<div class="col-md-6">
				
						<label class="col-sm-3 col-form-label">Role</label>
						
							<select class="js-choice" name="role">
								<c:forEach items="${roles}" var="role">
									<option value="${role.id}">${role.roleName}</option>
								</c:forEach>
							</select>
						
					
				</div>
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Menus</label>
						<div class="col-sm-9">
							<select class="js-example-basic-single" multiple="multiple"
								name="menus" id="menus">
								<c:forEach items="${menus}" var="menu">
									<option value="${menu.id}">${menu.menuName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

			</div>

			<button type="button" id="submitButton" class="btn btn-primary mr-2">Submit</button>
			<button class="btn btn-light"
				onclick="loadFormPage('students','Student Data')">Cancel</button>
		</form>
	</div>





<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(".js-choice").chosen();
	$(document)
			.ready(
					function() {
						$("#submitButton")
								.click(
										function() {
											//	debugger;
											// Serialize the form data
											var formData = $("#mainform")
													.serialize();
											var contextPath = "http://localhost:8585";

											var values = $("#menus").val();
											debugger;
											$
													.ajax({
														type : "POST",
														url : contextPath
																+ "/role-menu-mapping/save", // Replace with your actual endpoint
														data : formData,
														success : function(data) {
															debugger;
															// Handle the success response, e.g., update the UI or show a message
															//	alert("POST request successful:", data);
															//	swal("Good job!", "You clicked the button!", "success");
															if (data.status === "error") {
																toastMessage(
																		"error",
																		data.message);
															}
															if (data.status === "success") {
																toastMessage(
																		"success",
																		'Mapping  Successfully!');
															}

															loadFormPage(
																	'role-menu-mapping/list',
																	'Role Menu Mapping List');
														},
														error : function(jqXHR,
																textStatus,
																errorThrown) {
															// Handle errors
															//	alert("POST request failed:", textStatus, errorThrown);
															loadFormPage(
																	'role-menu-mapping/list',
																	'Role Menu Mapping List');
														}
													});
										});
					});

	// In your Javascript (external .js resource or <script> tag)
	$(document).ready(function() {
		$('.js-example-basic-single').select2();
	});
</script>