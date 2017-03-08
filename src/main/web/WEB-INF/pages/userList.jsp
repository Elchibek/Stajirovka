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
        .search {
            width: 89%;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            background-position: 10px 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
        }
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

    <link rel="stylesheet" href="../../../dist/css/bootstrap.min.css">

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
            <c:if test="${empty userList}">
                There are no Users
            </c:if>
            <c:if test="${not empty userList}">

                <form action="searchEmployee">
                    <div class="row">
                        <pre><input class="search" type='text' name='searchName' id='searchName'  placeholder="Search.."/> <input  type='submit' value='Search'/></pre>
                    </div>
                </form>

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
                        <th>View</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="usr">
                        <tr>
                            <td>${usr.id}</td>
                            <td>${usr.name}</td>
                            <td>${usr.age}</td>
                            <td>${usr.admin? "Admin" : "User"}</td>
                            <td><calendar:formatDate  value="${usr.createdDate}"
                                                      pattern="dd-MM-yyyy"/></td>
                            <td><input style="width: 100%; height:30px" type="button" value="Edit" class="btn btn-sm btn-success" onClick='location.href="editUser?id=<c:out value='${usr.id}'/>"'></td>
                            <td><input style="width: 100%; height:30px" type="button" value="Delete" class="btn btn-sm btn-danger" onClick='location.href="deleteUser?id=<c:out value='${usr.id}'/>"'></td>
                            <td><input style="width: 100%; height:30px" type="button" value="View" class="btn btn-sm btn-info" onClick='location.href="viewUser?id=<c:out value='${usr.id}'/>"'></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>
