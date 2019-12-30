<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


    <section id="contact-page" class="container">
        <div class="row-fluid">
          
                <h4>Register</h4>
                <c:if test="${userExist}" ><h5 style="color:red">User already exist</h5></c:if>
                <c:if test="${success}" ><h5 style="color:green">User added successfuly</h5></c:if>
                <div class="status alert alert-success" style="display: none"></div>
                <form:form modelAttribute="task" method="post" action="${pageContext.request.contextPath}/completeTask">
                    <div class="row-fluid">
                    	<form:hidden   path="id"/>
                            <label>Date</label><form:errors path="description" cssStyle="color:red"/>
                            <form:input type="text" class="input-block-level"  disabled="true" id="date" path="date"/>
                            
                            <label>Start Time</label><form:errors path="description" cssStyle="color:red"/>
                            <form:input type="text" class="input-block-level"   disabled="true" id="startTime" path="startTime"/>
                            
                            <label>Stop Time</label><form:errors path="stopTime" cssStyle="color:red"/>
                            <form:input type="text" class="input-block-level"   disabled="true" id="stopTime" path="stopTime"/>
                            
                            <label>Description</label><form:errors path="description" cssStyle="color:red"/>
                            <form:input type="text" class="input-block-level"   disabled="true" id="description" path="description"/>
                            
                            <label>Completion Comment</label><form:errors path="completionComment" cssStyle="color:red"/>
                            <form:input type="textarea" class="input-block-level"  placeholder="Completion Comment" id="completionComment" path="completionComment" />
                            
                        <br>
                            <button type="submit" class="btn btn-primary btn-large ">Save</button>
                       
                    </div>
                    
                </form:form>
            
            
        </div>
    </section>
<%@ include file="../footer.jsp" %>