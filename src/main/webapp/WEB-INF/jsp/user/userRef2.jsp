
<%-- <%@ include file="../main.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
table {
	width: 100%;
}

td {
	width: 13.33%; /* Distribute width evenly for three cells */
}
</style>
<div class="col-lg-12 grid-margin stretch-card">
	<div class="card">
		<div class="card-body">
			<h4></h4>
			<p class="card-title">Direct Seller - Select Position</p>

			<div class="row">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body" id="parentCard"
							style="background: linear-gradient(45deg, black, transparent);">
							<div class="col-md-12"
								style="background: white; text-align: center;">
								<label id="parentLabel"style="margin: 20px">LogID : ${user.uniqueId}</label> <br>
								<a id="parentAnchor" href="#" style="size: 100px;"><b>&uarr;</b></a> <br>
								<!-- 								<button type="button" id="submitNomUpdate" style="margin: 10px" -->
								<!-- 									onclick="onNomUpadate()" class="btn btn-primary mr-2">View User</button> -->
								<button type="button" id="submitNomUpdate" style="margin: 10px"
									class="btn btn-primary mr-2" data-toggle="modal"
									data-target="#myModal">View User</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body"
							style="background: linear-gradient(45deg, black, transparent);">
							<div class="row">
								<c:forEach items="${userConns}" var="conn">
									<div class="col-md-3 grid-margin stretch-card">
										<div class="card">
											<div class="card-body" style="text-align: center;">
												<label id="childLabel">LogID : ${conn.childId}</label> <br> <br> <a id="childAnchor"
													onclick="fetchChildWithUniqueId('${conn.childId}')" style="size: 20px;"><b>&darr;</b></a>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="col-md-4 grid-margin stretch-card">
									<div class="card">
										<div class="card-body" style="text-align: center;">
											<a class="card-title" href="register">Add New+
												</p>
											</a>

										</div>

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body" style="background: lightblue;">
						<p class="card-title">Order Details</p>
						<p class="font-weight-500">The total number of sessions within
							the date range. It is the period time a user is actively engaged
							with your website, page or app, etc</p>
						<div class="d-flex flex-wrap mb-5">
							<div class="mr-5 mt-3">
								<p class="text-muted">Order value</p>
								<h3 class="text-primary fs-30 font-weight-medium">12.3k</h3>
							</div>
							<div class="mr-5 mt-3">
								<p class="text-muted">Orders</p>
								<h3 class="text-primary fs-30 font-weight-medium">14k</h3>
							</div>
							<div class="mr-5 mt-3">
								<p class="text-muted">Users</p>
								<h3 class="text-primary fs-30 font-weight-medium">71.56%</h3>
							</div>
							<div class="mt-3">
								<p class="text-muted">Downloads</p>
								<h3 class="text-primary fs-30 font-weight-medium">34040</h3>
							</div>
						</div>
						<canvas id="order-chart"></canvas>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>


<!-- model -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal content goes here -->
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">User Information</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Add user information here -->
				<table>
					<tr>
						<th>Name</th>
						<td>${user.name}</td>
					</tr>
					<tr>
						<th>Email</th>
						<td>${user.email}</td>
					</tr>
					<tr>
						<th>Mobile</th>
						<td>${user.mobile}</td>
					</tr>
					<tr>
						<th>Pan Number</th>
						<td>${user.panNumber}</td>
					</tr>
					<tr>
						<th>Gst Number</th>
						<td>${user.gstNumber}</td>
					</tr>
					<tr>
						<th>City</th>
						<td>${user.country}</td>
					</tr>
				</table>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
function fetchChildWithUniqueId(uid){
	
 	var contextPath = "http://localhost:8585";
	console.log(contextPath);

	$.ajax({
		type : "GET",
		url : contextPath + "/users/childs/" + uid, // Replace with your actual endpoint
		success : function(data) {
			toastMessage("success", 'Basic Details Updated!')
			console.log(data)
			
 			let cUser=data.user
 			let cUserConnections=data.userConnections;
			document.getElementById('parentLabel').innerHTML = 'New Value';
			document.getElementById('parentAnchor').innerHTML = 'New Value';
			document.getElementById('childLabel').innerHTML = 'New Value';
			document.getElementById('childAnchor').innerHTML = 'New Value';

			debugger;
			
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			// Handle errors
		//	console.error("POST request failed:", textStatus, errorThrown);
			// 											loadFormPage('students',
			// 													'Student List')

		}
	});


}

// fetchChildWithUniqueId(9);
</script>

