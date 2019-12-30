<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


    <section id="contact-page" class="container">
        <div class="row-fluid">
          
                <h4>Register</h4>
                <c:if test="${userExist}" ><h5 style="color:red">User already exist</h5></c:if>
                <c:if test="${success}" ><h5 style="color:green">User added successfuly</h5></c:if>
                <div class="status alert alert-success" style="display: none"></div>
                <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/saveUser">
                    <div class="row-fluid">
                            <label>Full Name</label><form:errors path="name" cssStyle="color:red"/>
                            <form:input type="text" class="input-block-level" path="name"  placeholder="Your Full Name" id="name"/>
                            
                            <label>Email Address</label><form:errors path="email" cssStyle="color:red"/>
                            <form:input type="text" class="input-block-level" value="${user.email}"  placeholder="Your Email Address" id="email" path="email"/>
                            
                            <label>Password</label><form:errors path="password" cssStyle="color:red"/>
                            <form:input type="password" class="input-block-level" value="${password}" placeholder="Password" id="password" path="password" />
                            
                        <br>
                            <button type="submit" class="btn btn-primary btn-large ">Save</button>
                       
                    </div>
                    
                </form:form>
            
            
        </div>
    </section>
<%@ include file="../footer.jsp" %>