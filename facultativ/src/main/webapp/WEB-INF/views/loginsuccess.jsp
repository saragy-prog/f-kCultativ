<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" language="java"
         errorPage="/exception/defaultException.jsp" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="loginsuccess.title"/></title>
</head>
<body>
<form:form action="loginsuccess.html">
    <h3>
        <spring:message code="loginsuccess.greeting"/>,
        <core:out value="${loginForm.userName}"/>
    </h3>
    <table>
        <td>
            <button type="submit" name="input" value="back">
                <spring:message code="loginsuccess.exit"/>
            </button>
        </td>
        <td>
            <button type="submit" name="input" value="add">
                <spring:message code="loginsuccess.add"/>
            </button>
        </td>
        <td>
            <button type="submit" name="input" value="delete">
                <spring:message code="loginsuccess.delete"/>
            </button>
        </td>
        <td>
            <button type="submit" name="input" value="show">
                <spring:message code="loginsuccess.show"/>
            </button>
        </td>
        <td>
            <button type="submit" name="input" value="showAll">
                <spring:message code="loginsuccess.showAll"/>
            </button>
        </td>
    </table>
    <core:if test="${(param.input == 'show') || (param.input == 'showAll')}">
        <core:choose>
            <core:when test="${fn:length(cursesList) > 0}">
                <table border="1">
                    <core:forEach var="curse" items="${cursesList}">
                        <tr>
                            <td>${curse.curseName}</td>
                        </tr>
                    </core:forEach>
                </table>
            </core:when>
            <core:otherwise>
                <spring:message code="list.empty"/>
            </core:otherwise>
        </core:choose>
    </core:if>
</form:form>
</body>
</html>