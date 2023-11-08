
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
						<div class="card-body"
							style="background: linear-gradient(45deg, black, transparent);">
							<div class="col-md-12" id="parentCard"
								style="background: white; text-align: center;">
								<label id="parentLabel" style="margin: 20px">LogID :
									${user.uniqueId}</label> <br>
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
							<div class="row" id="childCard">
								<c:forEach items="${userConns}" var="conn">
									<div class="col-md-3 grid-margin stretch-card">
										<div class="card">
											<div class="card-body" style="text-align: center;margin: 10px;">
												<label id="childLabel">LogID : ${conn.childId}</label> <br>
												<br> <a id="childAnchor"
													onclick="fetchChildWithUniqueId('${conn.childId}')"
													style="cursor: pointer;"><b>&darr;</b></a>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="col-md-4 grid-margin stretch-card">
									<div class="card">
										<div class="card-body" style="text-align: center;">
											<a class="card-title" href= "javascript:loadFormPage('users/newSeller','')">Add New+
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
	function fetchParents(uid) {
		// Go back to the previous page in the browser's history
		// parenIdof Uid
		var contextPath = "http://localhost:8585";

		$.ajax({
			type : "GET",
			url : contextPath + "/users/parent/" + uid,// Replace with your actual endpoint
			success : function(data) {
				debugger;
				// Handle the success response, e.g., update the UI or show a message
				// 											loadFormPage('students','Student List')
				let cUser = data.user;
				let uConn = data.userConnection;
				fetchChildWithUniqueId(uConn.parentId);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				// Handle errors
				console.error("POST request failed:", textStatus, errorThrown);
				// 											loadFormPage('students',
				// 													'Student List')

			}
		});
		
	}

	function fetchChildWithUniqueId(uid) {

		var contextPath = "http://localhost:8585";
		console.log(contextPath);
        debugger;
		$.ajax({
			type : "GET",
			url : contextPath + "/users/childs/" + uid, // Replace with your actual endpoint
			success : function(data) {

				let cUser = data.user
				let cUserConnections = data.userConnections;
				debugger;

				// Get the parent element where you want to append the new elements
				var parentElement = document.getElementById('parentCard');

				// Loop through the 'cUserConnections' array
				// 			cUserConnections.forEach(function(user) {
				// Create a new div element for each user
				var userDiv = document.createElement('div');
				userDiv.className = 'col-md-12'; // You can add your own CSS class for styling
				userDiv.style.background = 'white';
				userDiv.style.textAlign = 'center';
				// Create a label with the 'uniqueId' as content
				var label = document.createElement('label');
				label.style.margin = '20px';
				label.innerHTML = 'LogID: ' + cUser.uniqueId;
				var br = document.createElement('br');
				var br1 = document.createElement('br');
				// Create a link element (anchor) with an upward arrow
				var anchor = document.createElement('a');
				anchor.onclick = function() {
					fetchParents(cUser.uniqueId);
				};
				anchor.innerHTML = '&uarr;';
				anchor.style.cursor = 'pointer';
				// Create a button to trigger the modal
				var button = document.createElement('button');
				button.type = 'button';
				button.className = 'btn btn-primary mr-2';
				button.setAttribute('data-toggle', 'modal');
				button.setAttribute('data-target', '#myModal');
				button.innerHTML = 'View User';
				button.style.margin = '10px';
				userDiv.appendChild(label);
				if ('${user.uniqueId}' != cUser.uniqueId) {
					userDiv.appendChild(br1);
					userDiv.appendChild(anchor);
				}
				userDiv.appendChild(br);
				if ('${user.uniqueId}' == cUser.uniqueId) {
					userDiv.appendChild(button);
				}
				parentElement.innerHTML = '';
				parentElement.appendChild(userDiv);
				// 			});
				debugger;
				//before append remove
				var childElement = document.getElementById('childCard');
				childElement.innerHTML = '';
				if (cUserConnections.length > 0) {

					cUserConnections.forEach(function(user) {
						var userDiv = document.createElement('div');
						userDiv.className = 'col-md-4'; // You can add your own CSS class for styling
						userDiv.style.background = 'white';
						userDiv.style.textAlign = 'center';
						userDiv.style.margin = '10px';
						var label = document.createElement('label');
						label.style.margin = '20px';
						label.innerHTML = 'LogID: ' + user.childId;
						var br = document.createElement('br');
						var br1 = document.createElement('br');
						var anchor = document.createElement('a');
						anchor.onclick = function() {
							fetchChildWithUniqueId(user.childId);
						};
						anchor.innerHTML = '&darr;';
						anchor.style.cursor = 'pointer';
						userDiv.appendChild(label);
						userDiv.appendChild(br1);
						userDiv.appendChild(anchor);
						userDiv.appendChild(br);

						childElement.appendChild(userDiv);
					});
				} else {
					childElement.innerHTML = '';
				}
				var cuserDiv = document.createElement('div');
				cuserDiv.className = 'col-md-4'; // You can add your own CSS class for styling
				cuserDiv.style.background = 'green';
				cuserDiv.style.color = 'white';
				cuserDiv.style.textAlign = 'center';
				cuserDiv.style.margin = '10px';
				var canchor = document.createElement('a');
				canchor.href = "javascript:loadFormPage('users/newSeller','')" 
				canchor.innerHTML = 'SignUp';
				cuserDiv.appendChild(canchor);
				childElement.appendChild(cuserDiv);

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

