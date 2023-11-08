

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
			<h4>
				<a onclick="loadFormPage('role-menu-mapping/add','Add Role Menu Mapping')">Add
					Role Menu Mapping+</a>
			</h4>
			<p class="card-description">
				<%--                     Add class <code>.table-striped</code> --%>
			</p>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>

							<th>Role</th>
							<th>Menu</th>

						</tr>
					</thead>
					<tbody>
<%-- 						<c:forEach items="${students}" var="student"> --%>
<!-- 							<tr> -->

<!-- 								<td>Role</td> -->
<!-- 								<td>Menu</td> -->

<!-- 								<td><a -->
<%-- 									onclick="loadFormPage('students-edit/${student.id}','Student Update')" --%>
<!-- 									class="btn btn-primary mr-2">Update</a> <a id="deleteStd" -->
<%-- 									class="btn btn-primary mr-2" onclick="deleteStd(${student.id})">Delete</a></td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
					</tbody>
				</table>
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
            var contextPath = "<%=request.getContextPath()%>";

        $.ajax({
            type: "DELETE",
            url: contextPath + "/students-delete/" + studentId, // Adjust the URL as needed
            cache: false, // Disable caching
            timeout: 600000, // Set your desired timeout
            success: function (data) {
                // Handle success response, e.g., update the UI or show a message
            //    alert("Student with ID " + studentId + " has been deleted.");
                // Optionally, remove the deleted student from the UI
                // For example, you can use DOM manipulation or framework-specific methods.
                // Example: $("#student-" + studentId).remove();
              //  loadMenuAfterAccess('students');
                loadFormPage('students','Student Data')
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Handle errors
              //  console.error("An error occurred: " + textStatus, errorThrown);
                alert("Failed to delete student with ID " + studentId);
                loadMenuAfterAccess('students');
            }
        });

    }
}
</script>
