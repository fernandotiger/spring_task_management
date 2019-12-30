<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="js/DataTables/DataTables-1.10.20/css/jquery.dataTables.min.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="js/jquery-ui-1.12.1.custom/jquery-ui.min.css" />"/>

    <section id="contact-page" class="container">
        <div class="row-fluid">
          <table id="myTable" class="table table-hover">
          	<thead>
          		<tr>
          			<th>Id</th>
          			<th>Date</th>
          			<th>Start Time</th>
          			<th>Stop Time</th>
          			<th>Description</th>
          			<th>Completed</th>
          			<th>Action</th>
          		</tr>
          	</thead>
          	<tbody>
          		<c:forEach items="${tasks }" var="task">
	          		<tr>
	          			<td><c:out value="${task.id }"></c:out></td>
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
	          				<button type="button" onclick="confirmDelete(${task.id })" class="btn btn-primary">Delete Task</button>
	          			</td>
	          		</tr>
          		</c:forEach>
          	</tbody>
          </table>  
            
        </div>
        <div id="dialog" title="Confirmation Required" style="margin: 0 5px 0 0;top:0px">
  			Do you really wanna delete this task?
		</div>
    </section>
<%@ include file="../footer.jsp" %>


<script type="text/javascript" src="<c:url value="js/DataTables/datatables.min.js" />"></script>
<script type="text/javascript" src="<c:url value="js/jquery-ui-1.12.1.custom/jquery-ui.js" />"></script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable({
    	"lengthChange": false
    });
    
    $("#dialog").dialog({
 	   autoOpen: false,
 	   modal: true,
 	  //position: 'top',
 	   buttons : {
 	        "Confirm" : function() {
 	        	deleteTask(taskId);            
 	        },
 	        "Cancel" : function() {
 	          $(this).dialog("close");
 	        }
 	      }
 	    });
    
} );
var taskId = null;
function confirmDelete(id){
	taskId = id;
	$("#dialog").dialog("open");
}

function deleteTask(taskId){
	location.href = 'deleteTask?taskId='+taskId;
}

</script>