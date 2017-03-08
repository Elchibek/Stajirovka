
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="calendar" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Ranga Reddy">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Information</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#createdDate" ).datepicker();
        } );
    </script>
    <!-- Bootstrap CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                <a href="/"><img src="/resources/image/javarush_logo.png" width="200"/></a>
            </h3>
        </div>
        <div class="panel-body">
            <form:form id="employeeRegisterForm" cssClass="form-horizontal" modelAttribute="user" method="post"
                       action="saveUser">

                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="name">Name</form:label></div>
                    <div class="col-xs-6">
                        <form:hidden path="id" value="${userObject.id}"/>
                       <%-- <form:input cssClass="form-control" path="name"  value="${userObject.name}" />--%>
                      <input type="text" name="name" class="form-control" value="${userObject.name}" required autofocus/>

                    </div>
                </div>

                <div class="form-group">
                    <form:label path="age" cssClass="control-label col-xs-3">Age</form:label>
                    <div class="col-xs-6">
                        <%--<form:input cssClass="form-control" path="age" value="${userObject.age}"/>--%>
                        <input type="text" name="age" class="form-control"  value="${userObject.age}" required autofocus/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="createdDate">Date</form:label></div>
                    <div class="col-xs-6">
                        <form:input  cssClass="form-control" type="text"  path="createdDate"
                                     value="${userObject.formatDate()}"/>

                </div>
                </div>
                <div class="form-group">
                    <form:label path="admin" cssClass="control-label col-xs-3">Admin</form:label>
                    <div class="col-xs-6">
                        <c:choose>
                            <c:when test="${userObject.admin == true}">
                                <input type="checkbox" name="admin" checked/>
                            </c:when>

                            <c:otherwise><input type="checkbox" name="admin"/></c:otherwise>
                        </c:choose>
                            <%--Бул дагы иштейт--%>
                            <%--         <% boolean x = true; %>
                                     <input type="checkbox" name="chk_name" <% if (x) { %> checked <% } %> />--%>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                        </div>
                        <div class="col-xs-4">
                            <c:if test="${!empty userObject.name}">
                                <input type="submit" id="saveUser" class="btn btn-primary"
                                       value="<spring:message text="Edit Book"/>"/>
                            </c:if>
                            <c:if test="${empty userObject.name}">
                                <input type="submit" id="saveUser" class="btn btn-primary"
                                       value="<spring:message text="Add Book"/>"/>
                            </c:if>
                        </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                </div>

            </form:form>
        </div>
    </div>
</div>


</body>
</html>