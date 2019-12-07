<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="loginForm.title"/></title>
</head>
<body>
<!-- кнопки смены языка - элементы ajax -->
<button type="submit"
        onClick="javascript:window.location = '?lang=en'">
    english
</button>
<button type="submit"
        onClick="javascript:window.location = '?lang=ru'">
    русский
</button>
<h3><spring:message code="loginForm.name"/></h3>
<!--
    modelAttribute - это имя, по которому Spring распознает объект bean (
    в данном случае - переменную loginForm класса LoginForm в контроллере.
    action - по этому атриуту контроллер распознает, куда отправлять ответ
    на запрос со страницы
-->
<form:form action="loginform.html" modelAttribute="loginForm">
    <table>
        <tr>
            <td>
                <spring:message code="user.name"/>
                <FONT color="red">
                    <!-- текст ошибки формируется в валидаторе -->
                    <form:errors path="userName"/>
                </FONT>
            </td>
        </tr>
        <tr>
            <!-- поле ввода логина -->
            <td><form:input path="userName"/></td>
        </tr>
        <tr>
            <td>
                <spring:message code="user.password"/>
                <FONT color="red">
                    <form:errors path="password"/>
                </FONT>
            </td>
        </tr>
        <tr>
            <!-- поле ввода пароля -->
            <td><form:password path="password"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit" value="input">
                    <spring:message code="loginForm.input"/>
                </button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>