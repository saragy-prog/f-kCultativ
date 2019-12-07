<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title><spring:message code="exception.title"/></title>
</head>
<body>
<h1><spring:message code="exception.message"/></h1>
<form:form action="loginsuccess.html">
            <button type="submit" name="input" value="back">
                <spring:message code="loginsuccess.exit"/>
            </button>
</form:form>
</body>
</html>
