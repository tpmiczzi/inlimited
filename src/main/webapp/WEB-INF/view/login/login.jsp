<%@ page import="ua.com.danserhiy.idol.DB.DBService" %>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/login.css"/>" type="text/css"/>
    <spring:url value="/resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/signin.css" var="signin"/>
    <link href="${bootstrap}" rel="stylesheet"/>
    <link href="${signin}" rel="stylesheet"/>

    <title>Inlimited</title>
</head>
<body>

<header id="header">
    <div>

        <a href="<c:url value="/home"/>"
           style="float:left; position: relative; left:1%; margin-top: 20px; height: 8%; width: 20%;"><img
                src="<c:url value="/resources/images/logo.png"/>"></a>


    </div>
</header>


<div id="pagewidth">

    <div id="wrapper" class="clearfix">
        <div id="twocols">
            <div id="maincol">
                <div>

                    <form name="form" action="j_spring_security_check" method="post" class="form-signin">
                        <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPER_USER', 'ROLE_USER')"
                                            var="isUSer"/>
                        <font size="2" color="red">
                            <c:if test="${not isUSer}">
                                <c:if test="${empty param.error}">
                                    Вы не вошли
                                </c:if>
                            </c:if>
                        </font>

                        <font size="2" color="green">
                            <c:if test="${isUSer}">
                                Вы вошли как:
                                <security:authentication property="principal.username"/> с ролью:
                                <b><security:authentication property="principal.authorities"/></b>
                            </c:if>


                        </font>
                        <br/>
                        <c:if test="${not empty param.error}">
                            <font size="2" color="red"><b>Неправильный логин или пароль</></font>
                        </c:if>


                        <label for="inputEmail" class="sr-only"><spring:message code="email" text="Логин"/></label>
                        <input id="inputEmail" class="form-control" name="j_username" value=" " required autofocus/>
                        <br>
                        <label for="inputPassword" class="sr-only"><spring:message code="pass" text="Пароль"/></label>
                        <input type="password" id="inputPassword" class="form-control" name="j_password" value=""
                               required/>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="rememberme" name="_spring_security_remember_me"/>Запомнить
                                меня
                            </label>
                        </div>
                        <input type="submit" value="Войти" class="btn btn-lg btn-primary btn-block">
                    </form>
                </div>

            </div>


        </div>

        <div id="leftcol" style="background-image: url(<c:url value="/resources/images/background.png"/>);">


        </div>
    </div>


</div>
</body>

</html>