<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


    <section id="contact-page" class="container">
        <div class="row-fluid">
          
                <h4>Add Task</h4>
                
                <c:if test="${success}" >
                <c:choose>
                	<c:when test="${task.id == null}">
                		<h5 style="color:green">Task added successfuly</h5>
                	</c:when>
                	<c:otherwise>
                		<h5 style="color:green">Task updated successfuly</h5>
                	</c:otherwise>
                </c:choose>
                	
                </c:if>
                <div class="status alert alert-success" style="display: none"></div>
                <form:form modelAttribute="task" method="post" action="${pageContext.request.contextPath}/addTask">
                    <div class="row-fluid">
                    		<form:input type="hidden" path="id" id="id" />
                            <label>Date <form:errors path="date" cssStyle="color:red"/></label>
                            <form:input type="date" path="date"   id="date"/>
                            
                            <label>Start Time <form:errors path="startTime" cssStyle="color:red"/></label>
                            <form:input type="time"  id="startTime" path="startTime"/>
                            
                             <label>Stop Time <form:errors path="stopTime" cssStyle="color:red"/></label>
                            <form:input type="time"  id="stopTime" path="stopTime"/>
                            
                             <label>Description <form:errors path="description" cssStyle="color:red"/></label>
                            <form:textarea style="width:50%" value="${task.description}"  id="description" path="description"/>
                            
                        <br>
                            <button type="submit" class="btn btn-primary btn-large ">Save</button>
                       
                    </div>
                    
                </form:form>
            
            
        </div>
    </section>
<%@ include file="../footer.jsp" %>