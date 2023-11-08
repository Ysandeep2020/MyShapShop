
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
			<h4>All Referral List</h4>
			<p class="card-description">
				<%--                     Add class <code>.table-striped</code> --%>
			</p>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>User</th>
							<th>Referral Id</th>
							<th>Referral Name</th>
							<th>Referral Level</th>
							<th>Refer By</th>
							<!-- 							<th>Other</th> -->

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userHierarchyResults}" var="result">
							<tr>
								<td style="width: 5%;" class="py-1"><img
									src="../../images/faces/man-logo.jpg" alt="image" /></td>

								<td>${result.uniqueId}
<!-- 									<button type="button" class="btn btn-primary mr-2 view-user" -->
<!-- 										data-toggle="modal" data-target="#myModal" -->
<%-- 										data-uniqueid="${result.uniqueId}">View User</button> --%>
								</td>
								<td>${result.firstName}</td>
								<td>${result.level}</td>
								<td>${result.parent_id}</td>
								<!-- 								<td><a -->
								<%-- 									onclick="loadFormPage('students-edit/${student.id}','Student Update')" --%>
								<!-- 									class="btn btn-primary mr-2">Update</a> <a id="deleteStd" -->
								<%-- 									class="btn btn-primary mr-2" onclick="deleteStd(${student.id})">Delete</a></td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>



		</div>
	</div>
</div>


<!-- Modal -->
<!-- Modal -->


<script>



$(document).ready(function() {
    // When a "View User" button is clicked
    $(".view-user").click(function() {
        var uniqueId = $(this).data("uniqueid"); // Get the uniqueId from the data attribute
         debugger;
        // Make an AJAX call to fetch user details
        	var contextPath = "http://localhost:8585";
        $.ajax({
            url: "/users/"+uniqueId, // Replace with your actual endpoint
            method: "GET",
            success: function(data) {
                debugger;

                // Create the modal content with user details
                var modalContent = `
                	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                	aria-labelledby="exampleModalLabel" aria-hidden="true">
                	<div class="modal-dialog" role="document">
                		<div class="modal-content">
                			<div class="modal-body">
                				<table>
                					<tr>
                						<th>Name</th>
                						<td class="user-name">SSS</td>
                					</tr>
                					<!-- Add other user details here -->
                				</table>
                			</div>
                		</div>
                	</div>
                </div>
                `;
                
             // Add the modal content to the body
                $("body").append(modalContent);
                
                // Show the modal
                $("#myModal").modal("show");
            }
        });
    });
});
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
