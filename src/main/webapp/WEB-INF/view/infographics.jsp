<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"> </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/1636401.css"/>" type="text/css"/>
    <title>Inlimited</title>
</head>
<body>


<header id="header">
    <div>

        <p href="<c:url value="/home"/>" style="float:left; position: relative; left:1%; margin-top: 0px; margin-left:25px;height: 8%; width: 20%;"><img src="<c:url value="/resources/images/logo.png"/>"></p>
        <p style="position:relative; left: 0%; float: left; width: 20%;"><span c>Проект</span><br><span id="customername">тема мониторинга</span></p>

        <p style="position:relative;   float:right; width: 40%; text-align: right; margin-right: 15px; font-size: 18px;">
            <a href="<c:url value="/account"/>" class="exit_icon"><img src="<c:url value="/resources/images/account.png"/>" alt="" width="19" height="20">

                Настройки аккаунта</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="<c:url value="/j_spring_security_logout"/>" class="account"><img src="<c:url value="/resources/images/exit_icon.png"/>" alt="" width="19" height="19">
                Выйти</a></p></div>
</header>
<div id="all">

<div id="leftcol" style=" min-height: 1900px;float: left;width: 200px;background-image: url(<c:url value="/resources/images/background.png"/>);">
    <div style=" margin-left: 20px; margin-top: 20px; color: #FFFFFF"><span style="font-size: 18px;">Проект</span> <br><span id="lefttheme">тема мониторинга</span></div>

    <a href="<c:url value="/info"/>" style="color: white"><div class="leftmenuitems"><img src="<c:url value="/resources/images/reminders_menu.png"/>">&nbsp;&nbsp;&nbsp;Упоминания</div></a>
    <a href="<c:url value="/excel"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/eksport.png"/>">&nbsp; &nbsp;Экспорт данных</div></a>
    <a href="<c:url value="/graphics"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/infografika.png"/>">&nbsp;&nbsp;&nbsp; Инфографика</div></a>
    <a href="<c:url value="/analytics"/>" style="color: white"><div class="leftmenuitems" ><img src="<c:url value="/resources/images/analitika.png"/>">&nbsp;&nbsp;&nbsp;Аналитика</div></a>
    <a href="<c:url value="/concurency"/>"style="color: white"><div class="leftmenuitems"><img style="position: relative; top: 15px;" src="<c:url value="/resources/images/layer_182.png"/>">&nbsp;&nbsp;&nbsp;Сравнение<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; с конкурентом</div></a>
    <div style="position: absolute; top: 570px; left: 30px; float: left; margin-left: 15px; font-size: 14px;"><a href="www.inlimited.com.ua" style="color: white;">www.inlimited.com.ua</a></div>

    <div style="position: absolute; top: 520px; left: 40px; float: left; margin-left: 25px;"><a href="https://www.facebook.com/InlimitedTM/"><img width="35" height="35" src="<c:url value="/resources/images/facebook_left.png"/>"></a>
        <a href="https://www.linkedin.com/company-beta/10545169/" target="_blank"><img width="35" height="35" style=" margin-left: 20px; " src="<c:url value="/resources/images/linkedin_left.png"/>"> </a>
    </div>
</div>


    <div id="maincol" style="min-height:1900px;min-width: 1000px; background: url(<c:url value="/resources/images/infobackground.png"/>); height: 1800px;">
        <div style="min-width: 80%; min-height: 40px; margin-top: 20px; margin-left: 20px;
                margin-right: 30px; padding-top: 5px; background: #ffffff;border: solid 1px #9d9d9d; border-bottom: 0px;">
            <span style="margin-left: 20px;margin-top:20px;">СВОДНЫЙ ОТЧЕТ</span>
            <input type="button" class="remindersbuttons" id="buttonmonth"  onclick="drawChartMonth()" value="Месяцы">
            <input type="button" class="remindersbuttons" id="buttonweeks" onclick="drawChartWeek()" value="Недели">
            <input type="button" class="remindersbuttons" id="buttondays" onclick="drawChartDaily()" value="Дни">
        </div>
        <div id="graphic"></div>

        <div id="graphiccounters">
            <table style="min-width: 98%; margin-left: 10px; margin-right: 20px; text-align: center; vertical-align: bottom; margin-top: 0px;">
                    <td width="14%">

                        <table>
                            <tr style="height: 70px;">
                            <td ><img src="<c:url value="/resources/images/info_uppermail.png"/>"></td>
                            <td style="font-size: 14px;">Количество<br>сообщений</td>
                            </tr>

                            <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                                <td colspan="2" id="postqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                            </tr>

                        </table>
                </td>

                <td width="14%">

                    <table>
                        <tr style="height: 70px;">
                        <td ><img src="<c:url value="/resources/images/info_upperman.png"/>"></td>
                        <td style="font-size: 14px;">Количество<br>авторов</td>
                        </tr>
                        <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                            <td colspan="2" id="authorqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                        </tr>

                    </table>
                </td>

                <td width="14%">

                <table>
                    <tr style="height: 70px;">
                    <td ><img src="<c:url value="/resources/images/info_uppercomm.png"/>"></td>
                    <td style="font-size: 14px;">Количество<br>комментариев</td>
                    </tr>
                    <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                        <td colspan="2" id="commentqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                    </tr>


                </table>
            </td>

                <td width="14%">

                    <table>
                        <tr style="height: 70px;">

                        <td ><img src="<c:url value="/resources/images/info_upperrepost.png"/>"></td>
                        <td style="font-size: 14px;">Количество<br>репостов</td>
                        </tr>
                        <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                            <td colspan="2" id="repostqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                        </tr>


                    </table>
                </td>

                <td width="14%">

                    <table>
                        <tr style="height: 70px;">
                        <td ><img src="<c:url value="/resources/images/info_upperlike.png"/>"></td>
                        <td style="font-size: 14px;">Количество<br>лайков</td>
                        </tr>
                        <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                            <td colspan="2" id="likeqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                        </tr>

                    </table>
                </td>

                <td width="14%">

                    <table>
                        <tr style="height: 70px;">
                        <td ><img src="<c:url value="/resources/images/info_upperpositive.png"/>"></td>
                        <td style="font-size: 14px;">Количество<br>позитивных<br>откликов</td>
                        </tr>
                        <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                            <td colspan="2" id="positiveqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                        </tr>

                    </table>
                </td>

                <td width="14%">

                    <table>
                        <tr style="height: 70px;">
                        <td ><img src="<c:url value="/resources/images/info_uppernegative.png"/>"></td>
                        <td style="font-size: 14px;">Количество<br>негативных<br>откликов</td>
                        </tr>

                        <tr style="font-size: 24px; height: 30px;

                        vertical-align: bottom;">
                            <td colspan="2" id="negativeqtyup" class="lownumbers" style="background: none; text-align: center">0</td>
                        </tr>

                    </table>
                </td>
              </tr>
<!--                    <tr style="font-size:console.log('choise form');
            console.log(idconcur);
            document.getElementById('concurformdiv').innerHTML='';
            document.getElementById('concurformdiv').style.visibility='hidden';
          //  getCommonGraph();
            google.charts.load('current', {'packages':['corechart']});
            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            document.getElementById('graphiccommon').style.display='block';

            google.charts.setOnLoadCallback(drawChartPie);
            id = 4;
            place = 2;
            google.charts.setOnLoadCallback(drawChartSentiment);

            google.charts.setOnLoadCallback(drawChartSentimentConc);

            document.getElementById('graphic2').style.display='block';
            document.getElementById('labelclient').style.display='block';
            document.getElementById('graphic3').style.display='block'; 24px; height: 30px;

                                vertical-align: bottom;margin-left: -30px">
                    <td class="lownumbers" style="background: none; text-align: right">120</td>
                    <td class="lownumbers">23</td>
                    <td class="lownumbers">45</td>
                    <td class="lownumbers">23</td>
                    <td class="lownumbers">42</td>
                    <td class="lownumbers">43</td>
                    <td class="lownumbers">43</td>

                </tr>
-->
            </table>
        </div>




        <div id="graphic2">
            <table>
                <tr><td >&nbsp;&nbsp;&nbsp;&nbsp;ОТЧЕТ ПО ИСТОЧНИКАМ</td></tr>
                <tr><td id="graphic2cont"></td></tr>
            </table>
        </div>

        <div id="graphic3" style="margin-top: 0px; ">
            <p style="margin-left: 20px; float: left;">РЕСУРСЫ</p>
            <br><br>
            <table style="float: left; width: 50%; position: relative; top: 5%; left: 0px;border-collapse: collapse">
                <tr>
                    <td class="graph3cells"><div class="graph3colour" style="background-color: #3b5998; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Facebook&nbsp;&nbsp;</div>
                        <div class="graphic3counters" id="fbinfoperc"></div></td>
                    <td class="graph3cells"><div class="graph3colour" style="background-color: #55acee; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Twitter&nbsp;&nbsp;</div>
                        <div class="graphic3counters" id="twiinfoperc"></div></td>
                    <td class="graph3cells"><div class="graph3colour" style="background-color: #422581; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;VK&nbsp;&nbsp;</div>
                        <div class="graphic3counters" id="vkinfoperc"></div></td>
                </tr>
                <td class="graph3cells"><div class="graph3colour" style="background-color: #0f9c19; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;WEB&nbsp;&nbsp;</div>
                    <div class="graphic3counters" id="webinfoperc"></div></td>
                <td class="graph3cells"><div class="graph3colour" style="background-color: #c32aa3; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Instagram&nbsp;</div>
                    <div class="graphic3counters" id="instainfoperc"></div></td>
                <td class="graph3cells"><div class="graph3colour" style="background-color: #b31217; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Youtube&nbsp;</div>
                    <div class="graphic3counters" id="ytinfoperc"></div></td>
                </tr>
                <td class="graph3cells"><div class="graph3colour" style="background-color: #ffdf21; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Forums&nbsp;</div>
                    <div class="graphic3counters" id="foruminfoperc"></div></td>
                <td class="graph3cells"><div class="graph3colour" style="background-color: #df4a32; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Google+&nbsp;</div>
                    <div class="graphic3counters" id="googleinfoperc"></div></td>
                <td class="graph3cells"><div class="graph3colour" style="background-color: #007bb6; float: left"> </div><div style="float: left; position: relative; top: 3px;">&nbsp;&nbsp;Linkedin&nbsp;</div>
                    <div class="graphic3counters" id="linkedininfoperc"></div></td>

                </tr>



            </table>
            <div id="graphic3visual" style="float: left; margin-left: 10%; margin-top:0px;"></div>
        </div>

        <div id="graphic4">
            <table>
                <tr><td >&nbsp;&nbsp;&nbsp;&nbsp;ТОНАЛЬНОСТЬ</td></tr>
                <tr><td>
                    <div id="graphic4cont" style="width: 65%;float: left"></div>
                    <div id="graphic4map" style="width:35%; float: left; position:relative; top: -10px;"></div>


                </td>

                </tr>
            </table>
        </div>

        <div id="graphic5">
            <div width="100%" style="margin-top: 5px;" >&nbsp;&nbsp;&nbsp;&nbsp;ГЕОГРАФИЯ ОТЗЫВОВ</div>
            <div style="min-width: 100%; height: 25px; position: relative; top: 25px; background-color: #e0e0e8" >&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div id="graphic5left" style="width:65%; float: left; margin-top: 0px; ">
                <script>
                    google.charts.load('current', {'packages':['table','corechart']});
                    google.charts.setOnLoadCallback(drawTable);

                    function drawTable() {
                        var datac1 = new google.visualization.DataTable();
                        datac1.addColumn('string', 'Страна');
                        datac1.addColumn('string', 'Сообщений');
                        datac1.addColumn('string','%');
                        datac1.addColumn('string', 'Позитивные');

                        datac1.addColumn('string', 'Нейтральные');
                        datac1.addColumn('string', 'Негативные');

                        var datac2 = new google.visualization.DataTable();
                        datac2.addColumn('string', 'Город')
                        datac2.addColumn('string', 'Сообщений');
                        datac2.addColumn('string','%');
                        datac2.addColumn('string', 'Позитивные');

                        datac2.addColumn('string', 'Нейтральные');

                        datac2.addColumn('string', 'Негативные');

                        var datac1r = new google.visualization.DataTable();
                        datac1r.addColumn('string', 'Страна');
                        datac1r.addColumn('number', 'Посты');

                        var datac2r = new google.visualization.DataTable();
                        datac2r.addColumn('string', 'Город');
                        datac2r.addColumn('number', 'Посты');

                        $.getJSON('<c:url value="/graphiccountry"/>', {}, function(json){  // загрузку JSON данных из
                            console.log('top 10 country');
                            console.log(json);

                            //data.setCell(i,0, temp+(i+1), null, {style: 'width:5%;'});

                            console.log(Object.keys(json).length);
                            var temp ='';
                            var total=0;
                            for (var i=0;i<Object.keys(json).length;i++) {
                                total = total + json[i].postqty;
                            }

                            var proc =0;

                            for (var i=0;i<Object.keys(json).length;i++) {

                                proc = json[i].postqty*100/total;
                                proc = temp + proc;
                                proc = proc.substr(0,4);
                                datac1.addRow([json[i].nameCountry, temp + json[i].postqty, proc, temp + json[i].posqty,
                                    temp + json[i].neuqty, temp + json[i].negqty]);
                                datac1.setCell(i,2,proc, null, {style: 'width:5%;'});

                                 datac1.setCell(i,3,temp + json[i].posqty, null, {style: 'color: #0000ff;'});

                                datac1r.addRow([json[i].nameCountry, json[i].postqty]);

                            }
                            var table = new google.visualization.Table(document.getElementById('graphic5left'));

                            table.draw(datac1, {showRowNumber: false, cssClassNames:{headerRow: 'classgraph1header',tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows'}});

                            var options1r = {
                                title: '',
                                colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89'],

                                legend: { position: 'right', alignment: 'center' },
                                width: 300,
                                height: 150,
                                chartArea:{left:30,top:10,width:200,height:130}
                            };

                            var chart1r = new google.visualization.PieChart(document.getElementById('graphic5visual'));

                            chart1r.draw(datac1r, options1r);

                            var className = 'gradient';
                            $('.'+className).removeClass(className);

                        });
                        $.getJSON('<c:url value="/graphiccity"/>', {}, function(json){  // загрузку JSON данных из

                            console.log(json);

                            console.log(Object.keys(json).length);
                            var temp ='';
                            var total=0;
                            for (var i=0;i<Object.keys(json).length;i++) {
                                total = total + json[i].postqty;
                            }

                            var proc =0;

                            for (var i=0;i<Object.keys(json).length;i++) {

                                proc = json[i].postqty*100/total;
                                proc = temp + proc;
                                proc = proc.substr(0,4);

                                datac2.addRow([json[i].nameCountry, temp + json[i].postqty, proc, temp + json[i].posqty,
                                    temp + json[i].neuqty, temp + json[i].negqty]);

                                datac2r.addRow([json[i].nameCountry, json[i].postqty]);

                            }
                            var table = new google.visualization.Table(document.getElementById('graphic6left'));

                            table.draw(datac2, {showRowNumber: false, cssClassNames:{headerRow: 'classgraph1header',tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows'}});
                            var className = 'gradient';
                            $('.'+className).removeClass(className);
                            var options2r = {
                                title: '',
                                colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89'],

                                legend: { position: 'right', alignment: 'center' },
                                width: 300,
                                height: 150,
                                chartArea:{left:30,top:10,width:200,height:130}
                            };

                            var chart2r = new google.visualization.PieChart(document.getElementById('graphic6visual'));

                            chart2r.draw(datac2r, options2r);
                        });
                        console.log(datac1);


                    }
                </script>

            </div>

            <div id="graphic5visual" style="float: left; margin-left: ;: 30px; margin-top: 30px;">


            </div>
        </div>

        <div id="graphic6">

            <div style="min-width: 100%; height: 25px; position: relative; top: 25px; background-color: #e0e0e8" >&nbsp;&nbsp;&nbsp;&nbsp;</div>

            <div id="graphic6left" style="width:65%; float: left;"></div>
            <div id="graphic6visual" style="float:left; margin-right: 30px; margin-top: 30px;"></div>

        </div>

        <div id="graphic7">
            <div id="graphic7left" >
                <div width="100%" style="margin-top: 5px;" >&nbsp;&nbsp;&nbsp;&nbsp;ТИПЫ КОММЕНТАРИЕВ</div>
                <div id="graphic7leftlow" style="margin-left: 40px; float: left"></div>
                <script>

                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(drawChart);
                    function drawChart() {

                        $.getJSON('<c:url value="/statement3"/>', {}, function(json){  // загрузку JSON данных из

         /*                   console.log('procentage output')

                            console.log(json);
                            var total = json[0].fbqty + json[0].vkqty + json[0].twiqty + json[0].webqty + json[0].instaqty;
                            document.getElementById('fbinfoperc').innerHTML = (json[0].fbqty*100/total+'').substr(0,(json[0].fbqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('twiinfoperc').innerHTML = (json[0].twiqty*100/total+'').substr(0,(json[0].twiqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('vkinfoperc').innerHTML = (json[0].vkqty*100/total+'').substr(0,(json[0].vkqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('webinfoperc').innerHTML = (json[0].webqty*100/total+'').substr(0,(json[0].webqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('instainfoperc').innerHTML = (json[0].instaqty*100/total+'').substr(0,(json[0].instaqty*100/total+'').indexOf('.')) + '%';
                            console.log('total count resources ' + total);
*/
                            var data = google.visualization.arrayToDataTable([
                                ['Source', 'Reminders'],
                                ['Лайки', 50],
                                ['Комметарии', 20],
                                ['Посты', 17],
                                ['Репосты', 13]
                            ]);

                            var options = {
                                title: '',
                                colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89'],

                                legend: { position:'none' },
                                width: 170,
                                height: 170,
                                chartArea:{left:10,top:10,width:150,height:150}
                            };

                            var chart = new google.visualization.PieChart(document.getElementById('graphic7leftlow'));

                            chart.draw(data, options);

                        });




                    }
                </script>



            </div>
            <div id="g7leftlegend" style="width:30%; float: left; position: relative; top: 50px;">
                <table width=150px>
                    <tr>
                        <td width=25%><div class="graph3colour" style="background-color: #006add; float: left"></div></td>
                        <td width=50%>Like</td>
                        <td width=25% id="likeqtydown"class="graphic3counters">50%</td>
                    </tr>
                    <tr>
                        <td width=25%><div class="graph3colour" style="background-color: #c10000; float: left"></div></td>
                        <td width=50%>Комментарии</td>
                        <td width=25% id="commentqtydown"class="graphic3counters">20%</td>
                    </tr>
                    <tr>
                        <td width=25%><div class="graph3colour" style="background-color: #430297; float: left"></div></td>
                        <td width=50%>Посты</td>
                        <td width=25% id="postqtydown" class="graphic3counters">17%</td>
                    </tr>
                    <tr>
                        <td width=25%><div class="graph3colour" style="background-color: #ff5500; float: left"></div></td>
                        <td width=50%>Репосты</td>
                        <td width=25% id="repostqtydown"class="graphic3counters">13%</td>
                    </tr>




                </table>
            </div>

            <div id="graphic7right" style=" border-left: solid 1px darkgray">
                <div style="margin-top: 5px;" >&nbsp;&nbsp;&nbsp;&nbsp;FACEBOOK РЕАКЦИИ </div>
                <div id="graphic7rightlow" style="width:100px;float: left"></div>
                <script>

                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(drawChart);
                    function drawChart() {

                        $.getJSON('<c:url value="/statement3"/>', {}, function(json){  // загрузку JSON данных из
/*
                            console.log(json);
                            var total = json[0].fbqty + json[0].vkqty + json[0].twiqty + json[0].webqty + json[0].instaqty;
                            document.getElementById('fbinfoperc').innerHTML = (json[0].fbqty*100/total+'').substr(0,(json[0].fbqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('twiinfoperc').innerHTML = (json[0].twiqty*100/total+'').substr(0,(json[0].twiqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('vkinfoperc').innerHTML = (json[0].vkqty*100/total+'').substr(0,(json[0].vkqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('webinfoperc').innerHTML = (json[0].webqty*100/total+'').substr(0,(json[0].webqty*100/total+'').indexOf('.')) + '%';
                            document.getElementById('instainfoperc').innerHTML = (json[0].instaqty*100/total+'').substr(0,(json[0].instaqty*100/total+'').indexOf('.')) + '%';
                            console.log('total count resources ' + total);
*/
                            var data = google.visualization.arrayToDataTable([
                                ['Source', 'Reminders'],
                                ['Like', 50],
                                ['Heart', 20],
                                ['Haha', 17],
                                ['WAW', 13],
                                ['Cry', 17],
                                ['Angry', 13]
                            ]);

                            var options = {
                                title: '',
                                colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89', '#a4c639'],

                                legend: { position: 'none' },
                                width: 150,
                                height: 150,
                                chartArea:{left:50,top:30,width:100,height:100}
                            };

                            var chart = new google.visualization.PieChart(document.getElementById('graphic7rightlow'));

                            chart.draw(data, options);

                        });




                    }
                </script>



                <div id="g7rightlegend" style="width:150px; float: right;">
                    <table width=100px>
                        <tr>
                            <td width=33%><div class="graph3colour" style="background-color: #006add; float: left"></div></td>
                            <td width=33%><img src="<c:url value="/resources/images/graph7likeicon.png"/>"></td>
                            <td width=33% id="likeqtydownright" class="graphic3counters">38%</td>
                        </tr>
                        <tr>
                            <td width=33%><div class="graph3colour" style="background-color: #c10000; float: left"></div></td>
                            <td width=33%><img src="<c:url value="/resources/images/graph7hearticon.png"/>"></td>
                            <td width=33% id="heartqtydownright" class="graphic3counters">15%</td>
                        </tr>
                        <tr>
                            <td width=33%><div class="graph3colour" style="background-color: #430297; float: left"></div></td>
                            <td width=33%><img src="<c:url value="/resources/images/graph7hahaicon.png"/>"></td>
                            <td width=33% id="hahaqtydownright" class="graphic3counters">17%</td>
                        </tr>
                        <tr>
                            <td width=33%><div class="graph3colour" style="background-color: #ff5500; float: left"></div></td>
                            <td width=20%><img src="<c:url value="/resources/images/graph7wawicon.png"/>"></td>
                            <td width=47% id="wawqtydownright"class="graphic3counters">10%</td>
                        </tr>
                        <tr>
                            <td width=33%><div class="graph3colour" style="background-color: #ea4c89; float: left"></div></td>
                            <td width=33%><img src="<c:url value="/resources/images/graph7cryicon.png"/>"></td>
                            <td width=33% id="sadqtydownright" class="graphic3counters">13%</td>
                        </tr>
                        <tr>
                            <td width=33%><div class="graph3colour" style="background-color: #a4c639; float: left"></div></td>
                            <td width=33%><img src="<c:url value="/resources/images/graph7angryicon.png"/>"></td>
                            <td width=33% id="angryqtydownright" class="graphic3counters">10%</td>
                        </tr>




                    </table>
                </div>
            </div>
        </div>

    </div>

</div>

<!-- Graphic 1 & 4 -->
<script type="text/javascript">

    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChartDaily);


    function drawChartDaily() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'date');
        data.addColumn('number', 'Количество сообщений');

        var dataSent = new google.visualization.DataTable();
        dataSent.addColumn('date', 'date');
        dataSent.addColumn('number', 'Positive');
        dataSent.addColumn('number', 'Negative');
        dataSent.addColumn('number', 'Neutral');

        $.getJSON('<c:url value="/statement1"/>', {}, function(json){  // загрузку JSON данных из
            console.log('start!');
            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {
                data.addRow([new Date(json[i].date),json[i].total]);
                //data.addRow([new Date(json[i].date), json[i].authorqty, json[i].total,
                //    json[i].postqty]);//, json[i].commentqty, json[i].shareqty, json[i].likeqty]);
                dataSent.addRow([new Date(json[i].date), json[i].positiveqty, json[i].negativeqty, json[i].neutralqty]);

            }

            console.log(data);

            var chart = new google.visualization.LineChart(document.getElementById('graphic'));
            var chartSent = new google.visualization.LineChart(document.getElementById('graphic4cont'));

            chart.draw(data, options);
            chartSent.draw(dataSent, optionsSent);

        });



        var options = {
            legend: { position: 'top' },
            colors: ['#4cae4c'],

            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15}

            },
            vAxis: {minValue: 0},
            chartArea:{left:50,top:30,width:'90%',height:'60%'}
        };

        var optionsSent = {
            legend: { position: 'bottom' },
            colors: ['#00ff00','#ff0000','#d5d5d5'],
            min: 0,
            chartArea:{left:50,top:30,width:'90%',height:'60%'}
        };


    }

    function drawChartWeek() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'date');
        data.addColumn('number', 'total');
        /*   data.addColumn('number', 'post');
         data.addColumn('number', 'positive');
         data.addColumn('number', 'negative');

         */



        $.getJSON('<c:url value="/statement1week"/>', {}, function(json){  // загрузку JSON данных из

            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {
                data.addRow([json[i].numberPeriod,json[i].postQty]);//, json[i].postqty, json[i].positiveqty, json[i].negativeqty]);

            }

            var chart = new google.visualization.LineChart(document.getElementById('graphic'));

            chart.draw(data, options);

        });

        console.log(data);

        var options = {
            title: '',

            legend: { position: 'none' },
            min: 0,
            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15},
            },
            colors: ['#4cae4c'],
            chartArea:{left:50,top:20,width:'90%',height:'60%'}
        };


    }

    function drawChartMonth() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'date');
        data.addColumn('number', 'total');
        /*   data.addColumn('number', 'post');
         data.addColumn('number', 'positive');
         data.addColumn('number', 'negative');

         */



        $.getJSON('<c:url value="/statement1month"/>', {}, function(json){  // загрузку JSON данных из

            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {
                data.addRow([json[i].numberPeriod,json[i].postQty]);//, json[i].postqty, json[i].positiveqty, json[i].negativeqty]);

            }

            var chart = new google.visualization.LineChart(document.getElementById('graphic'));

            chart.draw(data, options);

        });

        console.log(data);

        var options = {
            title: '',

            legend: { position: 'none' },
            min: 0,
            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15},
            },
            colors: ['#4cae4c'],
            chartArea:{left:50,top:20,width:'90%',height:'60%'}
        };


    }


</script>
<!-- Sources Analysis-->
<script type="text/javascript">

    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});




    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);



    function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('date', 'date');
        data.addColumn('number', 'Facebook');
        data.addColumn('number', 'VK');
        data.addColumn('number', 'Twitter');
        data.addColumn('number', 'WEB');
        data.addColumn('number', 'Instagram');






        $.getJSON('<c:url value="/statement2"/>', {}, function(json){  // загрузку JSON данных из

            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {
                data.addRow([new Date(json[i].tstamp), json[i].facebook, json[i].vk,
                    json[i].twitter, json[i].smi,json[i].insta]);

            }

            var chart = new google.visualization.LineChart(document.getElementById('graphic2cont'));

            chart.draw(data, options);

        });

        console.log(data);

        var options = {
            legend: { position: 'bottom' },
            min: 0,
            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15}

            },
            chartArea:{left:50,top:30,width:'90%',height:'60%'},
            colors: ['#3b5998','#422581','#55acee','#0f9c19','#c32aa3']
        };


    }




</script>
<!--Vibes Analysis-->
<script type="text/javascript">
    google.charts.load('current', { mapsApiKey: 'AIzaSyALflNcdkM9KwSONCR99cvKW-OP_BrFQRs', 'packages':['corechart','geochart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {

        $.getJSON('<c:url value="/statement3"/>', {}, function(json){  // загрузку JSON данных из

            console.log(json);
            var total = json[0].facebook + json[0].twitter + json[0].vk + json[0].smi + json[0].insta;
            document.getElementById('fbinfoperc').innerHTML = (Math.round(json[0].facebook*100/total)) + '%';
            document.getElementById('twiinfoperc').innerHTML = (Math.round(json[0].twitter*100/total)) + '%';
            document.getElementById('vkinfoperc').innerHTML = (Math.round(json[0].vk*100/total)) + '%';
            document.getElementById('webinfoperc').innerHTML = (Math.round(json[0].smi*100/total)) + '%';
            document.getElementById('instainfoperc').innerHTML = (Math.round(json[0].insta*100/total)) + '%';
            document.getElementById('ytinfoperc').innerHTML = (Math.round(0*100/total)) + '%';
            document.getElementById('googleinfoperc').innerHTML = (Math.round(0*100/total)) + '%';
            document.getElementById('foruminfoperc').innerHTML = (Math.round(0*100/total)) + '%';
            document.getElementById('linedininfoperc').innerHTML = (Math.round(0*100/total)) + '%';
            console.log('total count resources ' + total);

            var data = google.visualization.arrayToDataTable([
                ['Source', 'Reminders'],
                ['Facebook', json[0].facebook],
                ['VK', json[0].vk],
                ['Twitter',  json[0].twitter],
                ['WEB', json[0].smi],
                ['Instagram', json[0].insta]
            ]);

            var options = {
                title: '',
                colors: ['#3b5998','#422581','#55acee','#0f9c19','#c32aa3'],

                legend: { position: 'none' },
                width: 200,
                height: 200,
                chartArea:{left:10,top:10,width:170,height:170}
            };

            var chart = new google.visualization.PieChart(document.getElementById('graphic3visual'));

            chart.draw(data, options);






    });

        setTimeout(function (){

            var datamap = new google.visualization.DataTable();
            datamap.addColumn('string', 'City');
            datamap.addColumn('number', 'Total');
            datamap.addColumn('number', 'Positive');
            datamap.addColumn('number', 'Neutral');
            datamap.addColumn('number', 'Negative');
/*
            var datamap = google.visualization.arrayToDataTable([
                ['City', 'Total', 'Negative','Neutral','Positive'],
                ['Киев',509,6,10,493],
                ['Харьков',354,0,0,354],
                ['Днепр',335,4,7,324],
                ['Одесса',220,3,4,213]
            ]);
*/
            $.getJSON('<c:url value="/graphiccity"/>', {}, function(jsonmap){  // загрузку JSON данных из

                console.log(jsonmap);

                console.log(Object.keys(jsonmap).length);


                for (var i=0;i<Object.keys(jsonmap).length;i++) {


                    if (jsonmap[i].nameCountry !== 'n/a') datamap.addRow([jsonmap[i].nameCountry, jsonmap[i].postqty, jsonmap[i].posqty,
                        jsonmap[i].neuqty, jsonmap[i].negqty]);


                }
                var optionsmap = {
                    region: 'UA',
                    displayMode:'markers',
                    colorAxis: {colors: ['#6A0888', '#6A0888']}
                };

                var view = new google.visualization.DataView(datamap);
                view.setColumns([0, {
                    type: 'number',
                    label: 'Total Comm',
                    calc: function (dt, row) {
                        return {
                            v: dt.getValue(row, 1),
                            f: dt.getFormattedValue(row, 1) + ' (' + dt.getFormattedValue(row, 2) + ' Positive, ' + dt.getFormattedValue(row, 3) + ' Neutral, ' + dt.getFormattedValue(row, 4) + ' Negative)'
                        }
                    }
                }]);

                var map = new google.visualization.GeoChart(document.getElementById('graphic4map'));

                map.draw(view, optionsmap);

            });


        },5000);

    }

</script>

<script>



    $.getJSON('<c:url value="/getalldatainfographics"/>', {}, function(infoall){  // загрузку JSON данных из

        console.log(infoall);

        document.getElementById('postqtyup').innerHTML=infoall.postqty;
        document.getElementById('authorqtyup').innerHTML=infoall.authorqty;
        document.getElementById('positiveqtyup').innerHTML=infoall.positiveqty;
        document.getElementById('negativeqtyup').innerHTML=infoall.negativeqty;
        document.getElementById('likeqtyup').innerHTML=infoall.likeqty;
        document.getElementById('repostqtyup').innerHTML=infoall.repostqty;




    });


    $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

        console.log(useraccount);

        document.getElementById('customername').innerHTML=useraccount[0];

        document.getElementById('lefttheme').innerHTML=useraccount[0];



    });
</script>



</body>

</html>