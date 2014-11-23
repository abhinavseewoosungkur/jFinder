<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
<h2>Hello World!</h2>

<h1>Add New</h1>
<form method="post" action="/admin/addAdmin">
    Admin name: <input type="text" name="name"/>   <br>
    Admin password: <input type="text" name="password"/>
    <button>Add</button>
</form>

</body>
</html>
