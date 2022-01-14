<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href='<spring:url value="/resources/style.css"/>' rel="stylesheet" />
</head>
<body>
<div class="wrapper">
    <main class="main">
        <div class="main__form">
            <form action='${pageContext.request.contextPath}/loginAction' method="POST">
                <label for="username">User name</label>
                <input type="text" name="username" id="username">
                <label for="password">Password</label>
                <input type="password" name="password" id="password">
                <button>Submit</button>
            </form>
            <c:if test="${param.error != null}">
                <p class="error">
                    Invalid username and password.
                </p>
            </c:if>
        </div>
        <div class="main__link">
            <a href="${pageContext.request.contextPath}/list">See credentials</a>
        </div>
    </main>
</div>
</body>
</html>
