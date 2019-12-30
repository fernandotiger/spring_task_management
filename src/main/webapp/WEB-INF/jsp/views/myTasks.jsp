<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="js/DataTables/DataTables-1.10.20/css/jquery.dataTables.min.css" />"/>

    <section id="contact-page" class="container">
        <div class="row-fluid">
          <table id="myTable" class="table table-hover">
          	<thead>
          		<tr>
          			<th>Date</th>
          			<th>Start Time</th>
          			<th>Stop Time</th>
          			<th>Description</th>
          			<th>Completed</th>
          			<th></th>
          		</tr>
          	</thead>
          	<tbody>
          		<c:forEach items="${tasks }" var="task">
	          		<tr>
	          			<td><fmt:formatDate value="${task.date }" pattern="dd-MM-yyyy" /></td>
	          			<td><c:out value="${task.startTime }"></c:out></td>
	          			<td><c:out value="${task.stopTime }"></c:out></td>
	          			<td><c:out value="${task.description }"></c:out></td>
	          			<td>
	          				<c:choose >
		          				<c:when test="${task.completed }">
		          					Yes
		          				</c:when>
		          				<c:otherwise>
		          					No
		          				</c:otherwise>
	          				</c:choose>
	          			</td>
	          			<td>
	          				<c:choose >
	          				<c:when test="${task.completed }">
	          					Completed
	          				</c:when>
	          				<c:otherwise>
	          					<button type="button" onclick="completeTask(${task.id })" class="btn btn-primary">Complete Task</button>
	         				</c:otherwise>
	          				</c:choose>
	          			</td>
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
function completeTask(taskId){
	location.href = 'completeTaskForm?taskId='+taskId;
}
</script>