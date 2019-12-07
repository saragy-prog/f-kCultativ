<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="loginForm.title"/></title>
</head>
<body>
<style>
/* для всех страниц */
body {
    background-image: url(main.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    background-attachment: fixed;
    font-family: sans-serif, serif, cursive;
}
/* Для начальной страницы*/

div{
    position: absolute;
        width:70%;
}
.container{
	top: 5%;
    left: 10%;
    }
.paragr {
    top: 200px;
    left: 10%;
    background-color: antiquewhite;
    width: 70%;
    height: 90%;
}

p {
    font-family: cursive, fantasy;
    font-size: 10px;
    color: antiquewhite;
    margin: 10px;
    padding: 5px;
}

.logo {
    float: left;
}

.menuLinks {
    color: black;
    text-decoration: none;
}

ul li {
    list-style: none;
    background-color: #f8f1e7;
    display: block;
    float: left;
    border: 1px;
    border-color: #525252;
    border-style: solid;
    height: 50px;
    width: 150px;
    font-size: 20px;
    color: black;
    line-height: 50px;
    text-align: center;
    border-radius: 10px;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
}

li {
    margin: 1px;
    padding: 2px;
}

ul {
    display: block;
    margin: 0;
    padding: 0;
    list-style: none;

}

ul li:hover {
    background-color: #baab79;
}

.menu li:hover .submenu {
    text-decoration: none;
    display: block;
    text-decoration: none;
}

ul:after {
    display: block;
    content: ' ';
    clear: both;
    float: none;
}

ul.menu > li {
    float: left;
    position: relative;
}

ul.submenu {
    display: none;
    position: absolute;
    margin-left: 0px;
    width: 150px;
    top: 51px;
    left: 0px;
    background-color: white;

}

ul.submenu2 {
    display: none;
    position: absolute;
    width: 150px;
    top: 51px;
    left: 151px;
    background-color: white;

}

.submenu li:hover .submenu2 {
    display: block;
}

/* Для регистрации*/

input {
    width: 200px;
    height: 30px;
    font-size: 20px;
    margin: 10px;
}

h1 {
    font-size: 20px;
}

.button {
    height: 50px;
    width: 400px;
    margin: 10px;
    padding: 10px;

}

/* Для календаря */


.main {
    margin: 10px 20px;
    padding: 10px 30px;
}

.main {
    background-color: #f0f0de;
    width: 550px;
    height: 600px;
}

#generate {
    width: 430px;
    height: 30px;
}
form{
width:100px;
}
table {
	position:absolute;
	top:10px;
	left:85%;
	
	
    border-collapse: collapse;
	float:left;
}

td,
th {
    border: 2px solid black;
    margin: 5px;
    padding: 10px;
    text-align: center;

}

th:last-child {
    border-radius: 2px;
}

th {
    font-weight: bold;
    background-color: #E6E6E6;
}


</style>
<div>	
 <img class="logo" src="icons/logo.png" alt="AllService logo" height="50px" width="auto">
   <div class="container">
    <ul class="menu">
        <li>
            <a type="submit" name="input" value="back">Календарь</a> 
        </li>
        <li>
            Список бариста
            <ul class="submenu">
                <li>
                   <a type="submit" name="input" value="showAll">Все</a>
                </li>
                <li>
                     <a type="submit" name="input" value="showAll">Популярные</a>
                </li>
                <li>
                     <a type="submit" name="input" value="showAll">Профи</a>
                </li>
                <li>
                    <a type="submit" name="input" value="showAll">Начинающие</a>
                </li>
            </ul>
        </li>
        <li>
             <a type="submit" name="input" value="back">Отзывы</a>
        </li>
        <li>
             <a type="submit" name="input" value="back"> Связь</a>
        </li>
            </ul>
      
    <div class="paragr" style="height: auto; width: 90%">
     <img src="icons/Goal2.jpg" alt="Goal" width="400px" height="auto">
     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, quos ipsa enim alias veniam unde doloribus deserunt dolorem natus? Quam laboriosam, itaque magnam, odit natus omnis sequi ipsa, veniam eum iusto dolorem!
     </p>
     <hr>
 <img src="icons/Philosophy.jpg" alt="Philosophy" width="400px" height="auto" style="opacity:inherit">  
     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, quos ipsa enim alias veniam unde doloribus deserunt dolorem natus? Quam laboriosam, itaque magnam, odit natus omnis sequi ipsa, veniam eum iusto dolorem!
     </p>
     <hr>
     <img src="icons/Time.png" alt="Time" width="400px" height="auto" style="opacity:inherit">
     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut fugiat cum cupiditate ratione ut fuga exercitationem praesentium mollitia est, omnis, quia impedit veritatis odio quo illo dignissimos itaque autem magni, molestiae. Quidem possimus architecto asperiores deleniti facilis et accusamus vero quis cum porro! Consequuntur sint sunt, nostrum totam veniam tenetur.</p>
     </div>
</div>

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
</div>
</body>
</html>