<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/account.css"/>" type="text/css"/>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <title>Inlimited</title>
</head>
<body>

<header id="header">
    <div>

        <p href="<c:url value="/home"/>" style="float:left; position: relative; left:1%; margin-top: 6px; margin-left:25px;height: 8%; width: 20%;"><img src="<c:url value="/resources/images/logo.png"/>"></p>
        <p style="position:relative; left: 0%; float: left; width: 20%;"><span c>Проект</span><br><span id="customername">тема мониторинга</span></p>

        <p style="position:relative;   float:right; width: 40%; text-align: right; margin-right: 15px; font-size: 18px;">
            <a href="<c:url value="/account"/>" class="exit_icon"><img src="<c:url value="/resources/images/account.png"/>" alt="" width="19" height="20">

                Настройки аккаунта</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="<c:url value="/j_spring_security_logout"/>" class="account"><img src="<c:url value="/resources/images/exit_icon.png"/>" alt="" width="19" height="19">
                Выйти</a></p></div>
</header>


<div id="all">

    <div id="leftcol" style="width:22%; min-height: 1900px;float: left;min-width: 240px;background-image: url(<c:url value="/resources/images/background.png"/>);">
        <div style=" margin-left: 20px; margin-top: 20px; color: #FFFFFF"><span style="font-size: 18px;">Проект</span> <br><span id="lefttheme">тема мониторинга</span></div>

        <a href="<c:url value="/info"/>" style="color: white"><div class="leftmenuitems"><img src="<c:url value="/resources/images/reminders_menu.png"/>">&nbsp;&nbsp;&nbsp;Упоминания</div></a>
        <a href="<c:url value="/export"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/eksport.png"/>">&nbsp; &nbsp;Экспорт данных</div></a>
        <a href="<c:url value="/graphics"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/infografika.png"/>">&nbsp;&nbsp;&nbsp; Инфографика</div></a>
        <a href="<c:url value="/analytics"/>" style="color: white"><div class="leftmenuitems" ><img src="<c:url value="/resources/images/analitika.png"/>">&nbsp;&nbsp;&nbsp;Аналитика</div></a>
        <a href="<c:url value="/concurency"/>"style="color: white"><div class="leftmenuitems"><img style="position: relative; top: 15px;" src="<c:url value="/resources/images/layer_182.png"/>">&nbsp;&nbsp;&nbsp;Сравнение<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; с конкурентом</div></a>
        <div style="position: absolute; top: 570px; left: 30px; float: left; margin-left: 15px; font-size: 14px;"><a href="www.inlimited.com.ua" style="color: white;">www.inlimited.com.ua</a></div>

        <div style="position: absolute; top: 520px; left: 40px; float: left; margin-left: 25px;"><a href="https://www.facebook.com/InlimitedTM/"><img width="35" height="35" src="<c:url value="/resources/images/facebook_left.png"/>"></a>
            <a href="https://www.linkedin.com/company-beta/10545169/" target="_blank"><img width="35" height="35" style=" margin-left: 20px; " src="<c:url value="/resources/images/linkedin_left.png"/>"> </a>
        </div>
    </div>

    <div id="maincol" style="width:78%; min-height:1900px;min-width: 1040px;  background-repeat: repeat-y; background-image: url(<c:url value="/resources/images/analytics-background.png"/>); height: 1800px;">

    <table style="width: 40%; position: relative; top:10%; left: 20%; border: solid 1px dimgray;">

        <tr>
            <td width="30%">Ваш текущий план</td>
            <td width="70%" id="plan"></td>
        </tr>
        <tr>
            <td>Начало мониторинга</td>
            <td id="startmon"></td>
        </tr>
        <tr>
            <td>Окончание мониторинга</td>
            <td id="endmon"></td>
        </tr>

        </table>

        <table style="width: 40%; position: relative; top:10%; left: 20%; margin-top: 5%;border: solid 1px dimgray;">
        <tr>
            <td>Ключевые слова</td>
            <td id="keywords"></td>
        </tr>
        <tr>
            <td>Ресурсы для мониторинга</td>
            <td id="resources"></td>
        </tr>
        <tr>
            <td>Количество пользователей</td>
            <td id="usersqty"></td>
        </tr>
            </table>

            <table style="width: 40%; position: relative; top:10%; left: 20%; margin-top: 5%;border: solid 1px dimgray;">
        <tr>
            <td>Alerting</td>
            <td id="alerting"></td>
        </tr>
        <tr>
            <td>Частота</td>
            <td id="freq"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td id="email"></td>
        </tr>
    </table>
    </div>



        </div>

</div>

<script>

    $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

        console.log(useraccount);
        document.getElementById('plan').innerHTML=useraccount[1];
        document.getElementById('startmon').innerHTML=useraccount[2];
        document.getElementById('endmon').innerHTML=useraccount[3];
        document.getElementById('keywords').innerHTML=useraccount[4];
        document.getElementById('resources').innerHTML=useraccount[5];
        document.getElementById('usersqty').innerHTML=useraccount[6];
        document.getElementById('alerting').innerHTML=useraccount[7];
        document.getElementById('freq').innerHTML=useraccount[8];
        document.getElementById('email').innerHTML=useraccount[9];



    });

    $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

        console.log(useraccount);

        document.getElementById('customername').innerHTML=useraccount[0];

        document.getElementById('lefttheme').innerHTML=useraccount[0];



    });
</script>
</body>
</html>