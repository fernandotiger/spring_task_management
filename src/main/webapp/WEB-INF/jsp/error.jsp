<%@ include file="header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


    <section id="contact-page" class="container">
        <div class="row-fluid">
          <div>
          	 <ul >
                    <li><h4><c:out value="Error Page :) - ${message } - ${status }"/></h4></li>
                     <li><a href="javascript:window.history.back()">Previous page</a></li>
             </ul>
         </div>
          
            
        </div>
    </section>
<%@ include file="footer.jsp" %>