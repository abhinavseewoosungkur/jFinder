<%--
  Created by IntelliJ IDEA.
  User: Abhinav
  Date: 11/29/2014
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
<head>
  <title tiles:fragment="title">Messages : Create</title>
</head>
<body>
<div tiles:fragment="content">
  <form name="f" th:action="@{/login}" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <fieldset>
      <legend>Please Login</legend>
      <div th:if="${param.error}" class="alert alert-error">
        Invalid username and password.
      </div>
      <div th:if="${param.logout}" class="alert alert-success">
        You have been logged out.
      </div>
      <label for="username">Username</label>
      <input type="text" id="username" name="username"/>
      <label for="password">Password</label>
      <input type="password" id="password" name="password"/>
      <div class="form-actions">
        <button type="submit" class="btn">Log in</button>
      </div>
    </fieldset>
  </form>
</div>
</body>
</html>
