
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
			<h4>
				<a onclick="loadFormPage('students-new','Student Data')">Add
					Student+</a>
			</h4>
			<p class="card-description">
				<%--                     Add class <code>.table-striped</code> --%>
			</p>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>User</th>
							<th>Name</th>
							<th>Progress</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Other</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${students}" var="student">
							<tr>
								<td style="width: 5%;" class="py-1"><img
									src="../../images/faces/face1.jpg" alt="image" /></td>

								<td>${student.firstName}<c:choose>
										<c:when test="${not empty student.lastName}">
                                            - ${student.lastName}
                                         </c:when>
									</c:choose>
								</td>
								<td>
									<div class="progress">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: <%=(int) (Math.random() * 100) + 1%>%"
											aria-valuenow="<%=(int) (Math.random() * 100) + 1%>"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</td>
								<td>${student.email}</td>
								<td>${student.mobile}</td>

								<td><a
									onclick="loadFormPage('students-edit/${student.id}','Student Update')"
									class="btn btn-primary mr-2">Update</a> <a id="deleteStd"
									class="btn btn-primary mr-2" onclick="deleteStd(${student.id})">Delete</a></td>
							</tr>
						</c:forEach>
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
