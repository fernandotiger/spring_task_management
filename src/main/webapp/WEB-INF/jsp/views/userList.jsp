<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="<c:url value="js/DataTables/DataTables-1.10.20/css/jquery.dataTables.min.css" />"/>

    <section id="contact-page" class="container">
        <div class="row-fluid">
          
          <table id="myTable" class="table table-hover">
          	<thead>
          		<tr>
          			<th>Name</th>
          			<th>Email</th>
          			<th>Add Task</th>
          		</tr>
          	</thead>
          	<tbody>
          		<c:forEach items="${userList }" var="user">
	          		<tr>
	          			<td><c:out value="${user.name }"></c:out></td>
	          			<td><c:out value="${user.email }"></c:out></td>
	          			<td><button type="button" class="btn btn-primary" onClick="addNewTask('${user.email}')">Add Task</button></td>
	          		</tr>
          		</c:forEach>
          	</tbody>
          </table>  
            
        </div>
    </section>
<%@ include file="../footer.jsp" %>

<script type="text/javascript" src="<c:url value="js/DataTables/datatables.min.js" />"></script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable({
    	"lengthChange": false
    });
} );
function addNewTask(userEmail){
	location.href = "taskForm?email="+userEmail;
}
</script>