<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* Default table styles */
table {
	width: 100%;
	max-width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

table th, table td {
	padding: 8px;
	text-align: left;
	border: 1px solid #ccc;
}

/* Apply responsive styles for screens smaller than 768px */
@media ( max-width : 768px) {
	table {
		display: block;
	}
	table thead {
		display: none;
	}
	table tbody, table tr, table th, table td {
		display: block;
	}
	table tr {
		margin-bottom: 10px;
		border: 1px solid #ccc;
	}
	table td {
		text-align: right;
		padding-left: 50%;
		position: relative;
	}
	table td::before {
		content: attr(data-label);
		position: absolute;
		left: 0;
		width: 50%;
		padding-left: 0;
		text-align: left;
		font-weight: bold;
	}
}
</style>
<div class="row">
	<div class="col-md-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body"
								style="background: aliceblue; color: black;">
								<c:if test="${not empty users.profileImagePath}">
									<img src="${users.profileImagePath}" alt="logo" width="150px"
										height="100px" id="profileImage" />
								</c:if>
								<c:if test="${empty users.profileImagePath}">
									<img src="/images/man-logo.jpg" alt="logo" width="150px"
										height="100px" id="profileImage"/>

								</c:if>
								<br> <label for="file" class="custom-file-input-button" title="Uplaod profile image">
									Profile Image </label> <input type="file" name="file" id="file"
									onchange="uploadImage()" class="form-control"
									style="display: none;" /> <br>
								<h3 class="font-weight-bold">&nbsp;&nbsp;&nbsp;
									${users.uniqueId}</h3>
								<%-- ${users.profileImagePath != null ? users.profileImagePath : 'images\man-logo.jpg'} --%>
								<h6 class="font-weight-normal mb-0">
									${users.address1},${users.address2},${users.city},${users.district},${users.state}<br>
									${users.country}
									<%-- 					${users.address1},${users.address2},${users.city},${users.district},${users.state},${users.country} --%>

								</h6>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-4 mb-4 stretch-card">
						<div class="card card-tale">
							<div class="card-body">
								<h3>Personal Details</h3>
								<p>Name: ${users.name}</p>
								<p>Mobile No.: ${users.mobile}</p>
								<p>Qualified Upto: Apr, 2023</p>
								<p>Logid Created On: 28/04/2023</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4 stretch-card transparent">
						<div class="card card-dark-blue">
							<div class="card-body">
								<h3>Status</h3>
								<p>Last Purchase Date:</p>
								<p>Current Level: Fresher</p>
								<p>CCC Level (Monthly): Fresher</p>
								<p>CCC Rank:</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4 stretch-card transparent">
						<div class="card card-light-danger">
							<div class="card-body">
								<h3>Fresher</h3>
								<p>DS Level on 10 October 2022</p>

							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 grid-margin stretch-card">
						<div class="card ">
							<div class="card-body">
								<p>
									<b>Notice</b> Still not utilized the redemption voucher, do it
									right now. Voucher shall not be available after 31.12.2023
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 grid-margin stretch-card">
						<div class="card ">
							<div class="card-body">
								<P>Your Site Url EXPIRED</p>
								<P>Expired</p>
								<P>This link is valid for 7 days from the time it is created</p>
								<P>Click button to create temporary URL</p>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12 grid-margin stretch-card">
						<div class="card ">
							<div class="card-body">
								<P>Next Level Status You need total Business Volume of 2825
									and 1400 Business Volume in your weaker leg to get the next
									level of Bronze</p>
							</div>
						</div>
					</div>
				</div>



				<div class="row">
					<div class="col-md-12 grid-margin stretch-card">
						<div class="card ">
							<div class="card-body">
								<p>First Purchase Business Volume Details</p>
								<div class="table-responsive">
									<table class="table table-striped table-borderless">
										<thead>
											<tr>
												<th>Product</th>
												<th>Price</th>
												<th>Date</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Search Engine Marketing</td>
												<td class="font-weight-bold">$362</td>
												<td>21 Sep 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-success">Completed</div></td>
											</tr>
											<tr>
												<td>Search Engine Optimization</td>
												<td class="font-weight-bold">$116</td>
												<td>13 Jun 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-success">Completed</div></td>
											</tr>
											<tr>
												<td>Display Advertising</td>
												<td class="font-weight-bold">$551</td>
												<td>28 Sep 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-warning">Pending</div></td>
											</tr>
											<tr>
												<td>Pay Per Click Advertising</td>
												<td class="font-weight-bold">$523</td>
												<td>30 Jun 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-warning">Pending</div></td>
											</tr>
											<tr>
												<td>E-Mail Marketing</td>
												<td class="font-weight-bold">$781</td>
												<td>01 Nov 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-danger">Cancelled</div></td>
											</tr>
											<tr>
												<td>Referral Marketing</td>
												<td class="font-weight-bold">$283</td>
												<td>20 Mar 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-warning">Pending</div></td>
											</tr>
											<tr>
												<td>Social media marketing</td>
												<td class="font-weight-bold">$897</td>
												<td>26 Oct 2018</td>
												<td class="font-weight-medium"><div
														class="badge badge-success">Completed</div></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<style>
.custom-file-input-button {
	background-color: #007bff;
	color: #fff;
	padding: 8px 12px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	width: 150px;
}

/* Style the label to look like a button */
.custom-file-input-button:hover {
	background-color: #0056b3;
}
</style>

<script>
	// Trigger the file input when the custom button is clicked
	document.querySelector('.custom-file-input-button').addEventListener(
			'click', function() {
				document.querySelector('#file');
			});
</script>
<script>
	function uploadImage() {
		debugger;
		var fileInput = document.getElementById("file");
		var file = fileInput.files[0];
		var formData = new FormData();
		formData.append("file", file);
		var contextPath = "http://localhost:8585";
		$.ajax({
			type : "POST",
			url : contextPath + "/attachment/upload",
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {

				// Set the new path to the image source
				var imgElement = document.getElementById("profileImage");
				imgElement.setAttribute("src", data.path);
				// Apply the same style
				imgElement.style.width = "180px";
				imgElement.style.height = "100px";

				// Display a success message
				toastMessage("success", data.status);

			},
			error : function(jqXHR, textStatus, errorThrown) {
			}
		});
	}
</script>