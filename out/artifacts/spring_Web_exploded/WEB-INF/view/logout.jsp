<%@  taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>Users</title>
    <link href='<spring:url value="/resources/style.css"/>' rel="stylesheet" />
</head>
<body>
<div class="wrapper">
    <main class="main">
        <div>
            <span class="username"><sec:authentication property="principal.username"/></span>
            <a href="${pageContext.request.contextPath}/logout">LOGOUT</a>
        </div>
        <div class="header"><h1>Table users</h1></div>
        <div>
            <table class="table">
                <thead class="table__head">
                <tr>
                    <sec:authorize access="hasRole('USER')">
                        <th>Id</th>
                        <th>First Name</th>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Email</th>
                        <th>Password</th>
                    </sec:authorize>
                </tr>
                </thead>
                <tbody class="table__body">
                <sec:authorize access="hasRole('USER')">
                    <c:forEach var="user" items="${user}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                        </tr>
                    </c:forEach>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN')">
                    <c:forEach var="user" items="${user}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>
                        </tr>
                    </c:forEach>
                </sec:authorize>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>
