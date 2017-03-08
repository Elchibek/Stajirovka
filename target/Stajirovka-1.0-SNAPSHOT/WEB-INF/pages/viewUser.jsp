<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="calendar" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employees List</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
        input[type=submit] {
            width: 9%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                <a href="/"><img src="/resources/image/javarush_logo.png" width="200"/></a>
                <div align="right"><a href="createUser">Add New User</a></div>
            </h3>
        </div>
        <div class="panel-body">

                <table class="table table-hover table-bordered">
                    <thead style="background-color: #bce8f1;">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Admin</th>
                        <th>Date</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${userObject.id}</td>
                            <td>${userObject.name}</td>
                            <td>${userObject.age}</td>
                            <td>${userObject.admin? "Admin" : "User"}</td>
                            <td><calendar:formatDate  value="${userObject.createdDate}"
                                                      pattern="dd-MM-yyyy"/></td>
                            <td><input style="width: 100%; height:30px" type="button" value="Edit" class="btn btn-sm btn-success" onClick='location.href="editUser?id=<c:out value='${userObject.id}'/>"'></td>
                            <td><input style="width: 100%; height:30px" type="button" value="Delete" class="btn btn-sm btn-danger" onClick='location.href="deleteUser?id=<c:out value='${userObject.id}'/>"'></td>
                        </tr>
                    </tbody>
                </table>
        </div>
    </div>
</div>

</body>
</html>
