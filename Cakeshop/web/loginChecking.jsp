<%--
  Created by IntelliJ IDEA.
  User: SONY
  Date: 13/1/2557
  Time: 21:19 น.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentication page</title>
</head>
<body>


<c:if test="${ empty param.username2 or empty param.password2}">
<c:redirect url="index.jsp" >
    <c:param name="errMsg" value="Please Enter UserName and Password" />
</c:redirect>

</c:if>

<c:if test="${not empty param.username2 and not empty param.password2}">
    <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost:3306/Cakeshop"
                     user="root" password="1234"/>


<s:query dataSource="${ds}" var="selectQ">
select username,password from customer
where username='${param.username2}'
and password='${param.password2}'
</s:query>

<c:forEach var="user" items="${selectQ.rows}" >
    <c:out value="Haha" />
    <c:set scope="session"
           var="loginUser"
           value="${user.username}"/>
    <c:redirect url="index.jsp"/>
</c:forEach>
<c:redirect url="login.jsp" >
    <c:param name="errMsg" value="Username/password does not match" />
</c:redirect>


</c:if>
