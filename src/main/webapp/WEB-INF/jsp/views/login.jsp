<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


    <section id="contact-page" class="container">
        <div class="row-fluid">
          
                <h4>Login</h4>
                <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                	<h5 style="color:red">Credentials problem</h5>
                </c:if>
                
                <div class="status alert alert-success" style="display: none"></div>
                <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/login">
                    <div class="row-fluid">
                            <label>Full Name</label><form:errors path="name" cssStyle="color:red"/>
                            <input type="text" class="input-block-level" name="username"  placeholder="Your User Name" id="username"/>
                            
                            <label>Password</label><form:errors path="password" cssStyle="color:red"/>
                            <input type="password" class="input-block-level" value="${password}" placeholder="Password" id="password" name="password" />
                            
                        <br>
                            <button type="submit" class="btn btn-primary btn-large ">Save</button>
                       
                    </div>
                    
                </form:form>
            
            
        </div>
    </section>
<%@ include file="../footer.jsp" %>