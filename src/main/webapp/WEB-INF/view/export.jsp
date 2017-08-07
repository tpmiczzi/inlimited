
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/concurency.css"/>" type="text/css"/>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <title>Inlimited</title>
</head>
<body>



<div id="pagewidth">
    <header id="header">
        <div>

            <p href="<c:url value="/home"/>" style="float:left; position: relative; left:1%; margin-top: 6px; margin-left:25px;height: 8%; width: 20%;"><img src="<c:url value="/resources/images/logo.png"/>"></p>
            <p style="position:relative; left: 0%; float: left; width: 20%;"><span c>Проект</span><br>тема мониторинга</p>

            <p style="position:relative;   float:right; width: 40%; text-align: right; margin-right: 15px; font-size: 18px;">
                <a href="<c:url value="/account"/>" class="exit_icon"><img src="<c:url value="/resources/images/account.png"/>" alt="" width="19" height="20">

                    Настройки аккаунта</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="<c:url value="/j_spring_security_logout"/>" class="account"><img src="<c:url value="/resources/images/exit_icon.png"/>" alt="" width="19" height="19">
                    Выйти</a></p></div>
    </header>




    <div id="wrapper" class="clearfix">
        <div id="leftcol" style="background-image: url(<c:url value="/resources/images/background.png"/>); background-repeat: repeat-x">
            <div style=" margin-left: 20px; margin-top: 20px; color: #FFFFFF"><span style="font-size: 18px;">Проект</span> <br>тема мониторинга</div>

            <a href="<c:url value="/info"/>" style="color: white"><div class="leftmenuitems"><img src="<c:url value="/resources/images/reminders_menu.png"/>">&nbsp;&nbsp;&nbsp;Упоминания</div></a>
            <a href="<c:url value="/export"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/eksport.png"/>">&nbsp; &nbsp;Экспорт данных</div></a>
            <a href="<c:url value="/graphics"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/infografika.png"/>">&nbsp;&nbsp;&nbsp; Инфографика</div></a>
            <a href="<c:url value="/analytics"/>" style="color: white"><div class="leftmenuitems" ><img src="<c:url value="/resources/images/analitika.png"/>">&nbsp;&nbsp;&nbsp;Аналитика</div></a>
            <div class="dropdown" href="<c:url value="/concurency"/>"><button class="dropbtn"> <div style="color:white; text-align: left; font-size: 12px;"><img style="position: relative; top: 15px;" src="<c:url value="/resources/images/layer_182.png"/>">&nbsp;&nbsp;&nbsp;Сравнение<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; с конкурентом</div></button>
            <div id="leftconcuritems" class="dropdown-content">

            </div>
        </div>


            <div style="position: absolute; top: 570px; left: 30px; float: left; margin-left: 15px; font-size: 14px;"><a href="www.inlimited.com.ua" style="color: white;">www.inlimited.com.ua</a></div>

            <div style="position: absolute; top: 520px; left: 40px; float: left; margin-left: 25px;"><a href="https://www.facebook.com/InlimitedTM/"><img width="35" height="35" src="<c:url value="/resources/images/facebook_left.png"/>"></a>
                <a href="https://www.linkedin.com/company-beta/10545169/" target="_blank"><img width="35" height="35" style=" margin-left: 20px; " src="<c:url value="/resources/images/linkedin_left.png"/>"> </a>
            </div>
        </div>


            <div id="maincol" style="width: 100%; min-width: 1040px; min-height:600px; margin-left:240px;background: url(<c:url value="/resources/images/infobackground.png"/>);">

                <a id="fileexportname" href="<c:url value="/resources/testcsv.txt"/>">File export</a>
            </div>




    </div>
</div>

<script>

    $.ajax({type: 'get',
        url: '<c:url value="/getexportcheck"/>',
        success: function(json){
            console.log(json);
            if (json==='no') {window.alert('File is creating. Please return in 15 minutes');

            $.ajax({type:'get',
                url: '<c:url value="/getexport"/>'});
            }
            else document.getElementById('fileexportname').setAttribute('href','/resources/' + json);
        }});


</script>

</div>





</body>
</html>