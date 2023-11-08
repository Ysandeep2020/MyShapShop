
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

			<p class="card-description">
			<h2>Details of your weekly remuneration</h2>
			<br>
			<h6>Week that was.</h6>
			</p>
			<div class="card">
				<div class="card-body">
					<div class="row" style="border: 1px solid black">
						<div class="col-md-8">
							<label>ParentID : ${user.uniqueId}</label> <br> <label>Name
								:${user.name}</label> <br> <br> <br>
						</div>

						<div class="col-md-4">
							Total Remuneration <br>&#8377; 0
						</div>
					</div>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-striped table-borderless">
					<thead>
						<tr style="border: 1px;">
							<th>#</th>
							<th>Blue</th>
							<th>Amber</th>
							<th>Purple</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Team Business Income (1st Purchase)</td>
							<td>&#8377; 0</td>
							<td>&#8377; 0</td>
							<td>&#8377; 0</td>
						</tr>
						<tr>
							<td>Team Reselling Business Income</td>
							<td>&#8377; 0</td>
							<td>&#8377; 0</td>
							<td>&#8377; 0</td>
						</tr>
						<tr>
							<td>Preferred Customer Remuneration</td>
							<td>&#8377; 0</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Booster Income</td>
							<td>&#8377; 0</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>ELS Income</td>
							<td>&#8377; 0</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Travel/Car Income</td>
							<td>&#8377; 0</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>ACP Income</td>
							<td>&#8377; 0</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Pending Amount</td>
							<td>&#8377; 0</td>
							<td></td>
							<td></td>
						</tr>


					</tbody>
				</table>
			</div>

			<p class="card-description">* This is computer generated document
				and may contain printing errors. If you notice such an error please
				contact SSOM (P) Ltd within 7 days of the date mentioned. The
				Company bears no responsibility whatsoever for errors not reported
				within the stipulated time. ** As per the current union budget, TDS
				rates are revised to 5%, If PAN number is not mentioned then TDS
				will be deducted @ 20% . Please enter your PAN No in the TDS details
				in website to get your TDS certificate. *** Please Update Your PAN
				Card Details on Website if not done, as it is a Mandatory
				Requirement from Govt Of India. Safe and Secure Online Marketing
				Pvt. Ltd.</p>
		</div>
	</div>
</div>


<script>
function deleteStd(studentId) {
    debugger;
    var confirmation = confirm("Are you sure you want to delete?");
    if (confirmation) {
//         window.location.href = "/students-delete/" + studentId;
        // Ajax call for delete  data
            var contextPath = "<%=request.getContextPath()%>
	";

			$.ajax({
				type : "DELETE",
				url : contextPath + "/students-delete/" + studentId, // Adjust the URL as needed
				cache : false, // Disable caching
				timeout : 600000, // Set your desired timeout
				success : function(data) {
					// Handle success response, e.g., update the UI or show a message
					//    alert("Student with ID " + studentId + " has been deleted.");
					// Optionally, remove the deleted student from the UI
					// For example, you can use DOM manipulation or framework-specific methods.
					// Example: $("#student-" + studentId).remove();
					//  loadMenuAfterAccess('students');

					loadFormPage('students', 'Student Data')
				},
				error : function(jqXHR, textStatus, errorThrown) {
					// Handle errors
					//  console.error("An error occurred: " + textStatus, errorThrown);
					alert("Failed to delete student with ID " + studentId);
					loadMenuAfterAccess('students');
				}
			});

		}
	}
</script>