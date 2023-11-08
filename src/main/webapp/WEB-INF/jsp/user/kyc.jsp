
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
			<h2>Complete your KYC</h2>

			</p>
			<div class="card">
				<div class="card-body">
					<div class="row" style="border: 1px solid black">
						<div class="col-md-6">
							<h3>KYC : Completed</h3>
						</div>
						<div class="col-md-6">
							<label>ParentID : ${user.uniqueId}</label> <br> <label>Name
								:${user.name}</label> <br> <br> <br>
						</div>


					</div>
				</div>
			</div>

		
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