<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>HR Theme One</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href='<c:url value="css/bootstrap.min.css" />'>
    <link rel="stylesheet" href="<c:url value="css/bootstrap-responsive.min.css" />">
    <link rel="stylesheet" href="<c:url value="css/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="css/main.css" />">
    <link rel="stylesheet" href="<c:url value="css/sl-slide.css" />">
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <link rel="shortcut icon" href="images/favicon.png">
</head>

<body>
    <!--Header-->
    <header class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a id="logo" class="pull-left" href="<c:url value="/"/>"></a>
                <div class="nav-collapse collapse pull-right">
                    <ul class="nav">
                        <li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
                        <sec:authorize access="!isAuthenticated()">
                        	<li><a href="<c:url value="register"/>">Register</a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                        	<li><a href="<c:url value="userList"/>">Users</a></li>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                        	<li><a href="<c:url value="login"/>">Login</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        	<li><a href="<c:url value="myTasks"/>">My Tasks</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        	<li><a href="<c:url value="allTasks"/>">All Tasks</a></li>
                        </sec:authorize>
                        <c:if test="${sessionScope['connectedUser'] != null}">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Hello <%= ((com.demo.taskmanagment.model.User)session.getAttribute("connectedUser")).getName() %> <i class="icon-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li>
                                <form action="${pageContext.request.contextPath}/logout" method="post">
                                <input type="hidden">
                                	<button type="submit" class="btn btn-primary btn-medium ">Logout</button>
                                </form>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                    </ul>        
                </div>
            </div>
        </div>
    </header>
    <!-- /header -->

<!--
Template bootstrap https://bootswatch.com
Template bootstrap https://www.free-css.com/free-css-templates/page238/hr1 
JSTL https://www.tutorialspoint.com/jsp/jstl_core_url_tag.htm
-->
