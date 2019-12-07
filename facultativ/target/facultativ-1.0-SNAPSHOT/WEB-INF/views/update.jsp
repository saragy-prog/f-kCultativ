<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="update.title"/></title>
</head>
<body>
<form:form action="update.html" modelAttribute="updateForm">
    <table>
        <tr>
            <td>
                <spring:message code="update.name"/>
                <FONT color="red">
                    <!-- текст ошибки формируется в валидаторе -->
                    <form:errors path="curseName"/>
                </FONT>
            </td>
        </tr>
        <tr>
            <!-- поле ввода логина -->
            <td><form:input path="curseName"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit" name="input" value="${param.input}">
                    <core:if test="${param.input == 'add'}">
                        <spring:message code="update.add"/>
                    </core:if>
                    <core:if test="${param.input == 'delete'}">
                        <spring:message code="update.delete"/>
                    </core:if>
                </button>
            </td>
            <td>
                <button type="submit" name="input" value="back">
                    <spring:message code="update.back"/>
                </button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
