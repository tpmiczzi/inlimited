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
        <div id="leftcol" style="background-image: url(<c:url value="/resources/images/background.png"/>);">
            <div style=" margin-left: 20px; margin-top: 20px; color: #FFFFFF"><span style="font-size: 18px;">Проект</span> <br>тема мониторинга</div>

            <a href="<c:url value="/info"/>" style="color: white"><div class="leftmenuitems"><img src="<c:url value="/resources/images/reminders_menu.png"/>">&nbsp;&nbsp;&nbsp;Упоминания</div></a>
            <a href="<c:url value="/export"/>" style="color: white"><div class="leftmenuitems" style="margin-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/eksport.png"/>">&nbsp; &nbsp;Экспорт данных</div></a>
            <a href="<c:url value="/graphics"/>" style="color: white"><div class="leftmenuitems" style="margin-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/infografika.png"/>">&nbsp;&nbsp;&nbsp; Инфографика</div></a>
            <a href="<c:url value="/analytics"/>" style="color: white"><div class="leftmenuitems" ><img src="<c:url value="/resources/images/analitika.png"/>">&nbsp;&nbsp;&nbsp;Аналитика</div></a>
            <a href="<c:url value="/concurency"/>"style="color: white"><div class="leftmenuitems"><img style="position: relative; top: 15px;" src="<c:url value="/resources/images/layer_182.png"/>">&nbsp;&nbsp;&nbsp;Сравнение<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; с конкурентом</div></a>
            <div style="position: absolute; top: 570px; left: 30px; float: left; margin-left: 15px; font-size: 14px;"><a href="www.inlimited.com.ua" style="color: white;">www.inlimited.com.ua</a></div>

            <div style="position: absolute; top: 520px; left: 40px; float: left; margin-left: 25px;"><a href="https://www.facebook.com/InlimitedTM/"><img width="35" height="35" src="<c:url value="/resources/images/facebook_left.png"/>"></a>
                <a href="https://www.linkedin.com/company-beta/10545169/" target="_blank"><img width="35" height="35" style=" margin-left: 20px; " src="<c:url value="/resources/images/linkedin_left.png"/>"> </a>
            </div>
        </div>
            <div id="maincol" style="float: right; background: url(<c:url value="/resources/images/infobackground.png"/>) round; height: 1800px;">
                <div style="min-width: 80%; min-height: 40px; margin-top: 20px; margin-left: 20px;
                margin-right: 30px; background: #ffffff;border: solid 1px #9d9d9d; border-bottom: 0px;">
                    <span style="margin-left: 20px;margin-top: 10px;">СВОДНЫЙ ОТЧЕТ</span>
                    <input type="button" class="remindersbuttons" id="buttonmonth" value="Месяцы">
                    <input type="button" class="remindersbuttons" id="buttonweeks" value="Недели">
                    <input type="button" class="remindersbuttons"  id="buttondays" value="Дни">
                </div>
                <div id="graphic"></div>

                <div id="graphiccounters">
                    <table style="min-width: 98%; margin-left: 10px; margin-right: 20px; text-align: center; vertical-align: bottom; margin-top: 0px;">

                        <tr>
                            <td style="font-size: 14px;"><img style="position: relative; top:10px;" src="<c:url value="/resources/images/info_uppermail.png"/>">&nbsp;Количество<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;сообщений</td>
                            <td style="font-size: 14px;"><img style="position: relative; top:10px;" src="<c:url value="/resources/images/info_upperman.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;Количество<br>авторов</td>
                            <td style="font-size: 14px;"><img style="position: relative; top:10px;" src="<c:url value="/resources/images/info_uppercomm.png"/>">Количество<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; комментариев</td>
                            <td style="font-size: 14px;"><img style="position: relative; top:10px;" src="<c:url value="/resources/images/info_upperrepost.png"/>">Количество<br>&nbsp;&nbsp;&nbsp;репостов</td>
                            <td style="font-size: 14px;"><img style="position: relative; top:10px;" src="<c:url value="/resources/images/info_upperlike.png"/>">&nbsp;&nbsp;&nbsp;&nbsp;Количество<br>лайков</td>
                            <td style="font-size: 14px;"><img style="position: relative; top:20px; left: -5px;" src="<c:url value="/resources/images/info_upperpositive.png"/>">Количество<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;позитивных<br>откликов</td>
                            <td style="font-size: 14px;"><img style="position: relative; top:20px; left: -5px;"src="<c:url value="/resources/images/info_uppernegative.png"/>">Количество<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;негативных<br>откликов</td>
                        </tr>
                        <tr style="font-size: 24px; height: 55px;

                                vertical-align: bottom;">
                            <td class="lownumbers" style="background: none">120</td>
                            <td class="lownumbers">23</td>
                            <td class="lownumbers">45</td>
                            <td class="lownumbers">23</td>
                            <td class="lownumbers">42</td>
                            <td class="lownumbers">43</td>
                            <td class="lownumbers">43</td>

                        </tr>

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
                    <table style="float: left; width: 500px; position: relative; top: 50px; left: 0px;border-collapse: collapse">
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
                        <td class="graph3cells"><div class="graph3colour" style="background-color: #b31217; float: left"> </div>&nbsp;&nbsp;Youtube</td>
                        </tr>
                        <td class="graph3cells"><div class="graph3colour" style="background-color: #ffdf21; float: left"> </div>&nbsp;&nbsp;Forums</td>
                        <td class="graph3cells"><div class="graph3colour" style="background-color: #df4a32; float: left"> </div>&nbsp;&nbsp;Google+</td>
                        <td class="graph3cells"><div class="graph3colour" style="background-color: #007bb6; float: left"> </div>&nbsp;&nbsp;LinkedIn</td>

                        </tr>

                    </table>
                    <div id="graphic3visual" style="float: right; margin-right: 100px; margin-top:0px;"></div>
                </div>

                <div id="graphic4">
                    <table>
                        <tr><td >&nbsp;&nbsp;&nbsp;&nbsp;ТОНАЛЬНОСТЬ</td></tr>
                        <tr><td id="graphic4cont"></td></tr>
                    </table>
                </div>

                <div id="graphic5">
                    <div width="100%" style="margin-top: 5px;" >&nbsp;&nbsp;&nbsp;&nbsp;ГЕОГРАФИЯ ОТЗЫВОВ</div>
                    <div style="min-width: 100%; height: 25px; position: relative; top: 25px; background-color: #e0e0e8" >&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div id="graphic5left" style="width:70%; float: left; margin-top: 0px; ">
                    <script>
                        google.charts.load('current', {'packages':['table','corechart']});
                         google.charts.setOnLoadCallback(drawTable);

                    function drawTable() {
                        var datac1 = new google.visualization.DataTable();
                        datac1.addColumn('string', 'Страна');
                        datac1.addColumn('string', 'Сообщений');
                        datac1.addColumn('string','%');
                        datac1.addColumn('string', 'Позитивные');
                        datac1.addColumn('string', 'Негативные');
                        datac1.addColumn('string', 'Нейтральные');

                        var datac2 = new google.visualization.DataTable();
                        datac2.addColumn('string', 'Город');
                        datac2.addColumn('string', 'Сообщений');
                        datac2.addColumn('string','%');
                        datac2.addColumn('string', 'Позитивные');
                        datac2.addColumn('string', 'Негативные');
                        datac2.addColumn('string', 'Нейтральные');

                        var datac1r = new google.visualization.DataTable();
                        datac1r.addColumn('string', 'Страна');
                        datac1r.addColumn('number', 'Посты');

                        var datac2r = new google.visualization.DataTable();
                        datac2r.addColumn('string', 'Город');
                        datac2r.addColumn('number', 'Посты');

                        $.getJSON('<c:url value="/graphiccountry"/>', {}, function(json){  // загрузку JSON данных из

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
                                datac1.addRow([json[i].name, temp + json[i].postqty, proc, temp + json[i].posqty,
                                    temp + json[i].negqty, temp + json[i].neuqty]);

                               // datac1.setCell(i,2,datac1.getValue(i,2), null, {style: 'color:green;'});

                                datac1r.addRow([json[i].name, json[i].postqty]);

                            }
                            var table = new google.visualization.Table(document.getElementById('graphic5left'));

                            table.draw(datac1, {showRowNumber: false, cssClassNames:{headerRow: 'classgraph1header',tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows'}});

                            var options1r = {
                                title: '',
                                colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89'],

                                legend: { position: 'right', alignment: 'center' },
                                width: 200,
                                height: 130,
                                chartArea:{left:0,top:0,width:200,height:130}
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

                                datac2.addRow([json[i].name, temp + json[i].postqty, proc, temp + json[i].posqty,
                                    temp + json[i].negqty, temp + json[i].neuqty]);

                                datac2r.addRow([json[i].name, json[i].postqty]);

                            }
                            var table = new google.visualization.Table(document.getElementById('graphic6left'));

                            table.draw(datac2, {showRowNumber: false, cssClassNames:{headerRow: 'classgraph1header',tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows'}});
                            var className = 'gradient';
                            $('.'+className).removeClass(className);
                            var options2r = {
                                title: '',
                                colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89'],

                                legend: { position: 'right', alignment: 'center' },
                                width: 200,
                                height: 130,
                                chartArea:{left:0,top:0,width:200,height:130}
                            };

                            var chart2r = new google.visualization.PieChart(document.getElementById('graphic6visual'));

                            chart2r.draw(datac2r, options2r);
                        });
                        console.log(datac1);


                    }
                    </script>

                    </div>

                    <div id="graphic5visual" style="float: right; margin-right: 30px; margin-top: 30px;">


                    </div>
                </div>

                <div id="graphic6">

                    <div style="min-width: 100%; height: 25px; position: relative; top: 25px; background-color: #e0e0e8" >&nbsp;&nbsp;&nbsp;&nbsp;</div>

                    <div id="graphic6left" style="width:70%; float: left;"></div>
                    <div id="graphic6visual" style="float: right; margin-right: 30px; margin-top: 30px;"></div>

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

                                    console.log(json);
                                    var total = json[0].fbqty + json[0].vkqty + json[0].twiqty + json[0].webqty + json[0].instaqty;
                                    document.getElementById('fbinfoperc').innerHTML = (json[0].fbqty*100/total+'').substr(0,(json[0].fbqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('twiinfoperc').innerHTML = (json[0].twiqty*100/total+'').substr(0,(json[0].twiqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('vkinfoperc').innerHTML = (json[0].vkqty*100/total+'').substr(0,(json[0].vkqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('webinfoperc').innerHTML = (json[0].webqty*100/total+'').substr(0,(json[0].webqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('instainfoperc').innerHTML = (json[0].instaqty*100/total+'').substr(0,(json[0].instaqty*100/total+'').indexOf('.')) + '%';
                                    console.log('total count resources ' + total);

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
                                        width: 175,
                                        height: 175,
                                        chartArea:{left:0,top:0,width:175,height:175}
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
                                <td width=25%><div class="graph3colour" style="background-color: #0c1bd9; float: left"></div></td>
                                <td width=50%>Like</td>
                                <td width=25% class="graphic3counters">50%</td>
                            </tr>
                            <tr>
                                <td width=25%><div class="graph3colour" style="background-color: #6d0cec; float: left"></div></td>
                                <td width=50%>Комментарии</td>
                                <td width=25% class="graphic3counters">20%</td>
                            </tr>
                            <tr>
                                <td width=25%><div class="graph3colour" style="background-color: #3accd9; float: left"></div></td>
                                <td width=50%>Посты</td>
                                <td width=25% class="graphic3counters">50%</td>
                            </tr>
                            <tr>
                                <td width=25%><div class="graph3colour" style="background-color: #f7ff41; float: left"></div></td>
                                <td width=50%>Репосты</td>
                                <td width=25% class="graphic3counters">50%</td>
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

                                    console.log(json);
                                    var total = json[0].fbqty + json[0].vkqty + json[0].twiqty + json[0].webqty + json[0].instaqty;
                                    document.getElementById('fbinfoperc').innerHTML = (json[0].fbqty*100/total+'').substr(0,(json[0].fbqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('twiinfoperc').innerHTML = (json[0].twiqty*100/total+'').substr(0,(json[0].twiqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('vkinfoperc').innerHTML = (json[0].vkqty*100/total+'').substr(0,(json[0].vkqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('webinfoperc').innerHTML = (json[0].webqty*100/total+'').substr(0,(json[0].webqty*100/total+'').indexOf('.')) + '%';
                                    document.getElementById('instainfoperc').innerHTML = (json[0].instaqty*100/total+'').substr(0,(json[0].instaqty*100/total+'').indexOf('.')) + '%';
                                    console.log('total count resources ' + total);

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
                                        colors: ['#006add','#c10000','#430297','#ff5500','#ea4c89','a4c639'],

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
                                    <td width=33%><div class="graph3colour" style="background-color: #0c1bd9; float: left"></div></td>
                                    <td width=33%><img src="<c:url value="/resources/images/graph7likeicon.png"/>"></td>
                                    <td width=33% class="graphic3counters">50%</td>
                                </tr>
                                <tr>
                                    <td width=33%><div class="graph3colour" style="background-color: #6d0cec; float: left"></div></td>
                                    <td width=33%><img src="<c:url value="/resources/images/graph7hearticon.png"/>"></td>
                                    <td width=33% class="graphic3counters">20%</td>
                                </tr>
                                <tr>
                                    <td width=3%><div class="graph3colour" style="background-color: #3accd9; float: left"></div></td>
                                    <td width=33%><img src="<c:url value="/resources/images/graph7hahaicon.png"/>"></td>
                                    <td width=33% class="graphic3counters">50%</td>
                                </tr>
                                <tr>
                                    <td width=33%><div class="graph3colour" style="background-color: #f7ff41; float: left"></div></td>
                                    <td width=33%><img src="<c:url value="/resources/images/graph7wawicon.png"/>"></td>
                                    <td width=33% class="graphic3counters">50%</td>
                                </tr>
                                <tr>
                                    <td width=33%><div class="graph3colour" style="background-color: #f7ff41; float: left"></div></td>
                                    <td width=33%><img src="<c:url value="/resources/images/graph7cryicon.png"/>"></td>
                                    <td width=33% class="graphic3counters">50%</td>
                                </tr>
                                <tr>
                                    <td width=33%><div class="graph3colour" style="background-color: #f7ff41; float: left"></div></td>
                                    <td width=33%><img src="<c:url value="/resources/images/graph7angryicon.png"/>"></td>
                                    <td width=33% class="graphic3counters">50%</td>
                                </tr>




                            </table>
                        </div>
                    </div>
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
    google.charts.setOnLoadCallback(drawChart);


    function drawChart() {
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
            min: 0
        };

        var optionsSent = {
            legend: { position: 'bottom' },
            colors: ['#00ff00','#ff0000','#d5d5d5'],
            min: 0
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
                data.addRow([new Date(json[i].date), json[i].fbqty, json[i].vkqty,
                    json[i].twiqty, json[i].webqty,json[i].instaqty]);

            }

            var chart = new google.visualization.LineChart(document.getElementById('graphic2cont'));

            chart.draw(data, options);

        });

        console.log(data);

        var options = {
            legend: { position: 'bottom' },
            min: 0
        };


    }


</script>
<!--Vibes Analysis-->
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {

        $.getJSON('<c:url value="/statement3"/>', {}, function(json){  // загрузку JSON данных из

            console.log(json);
            var total = json[0].fbqty + json[0].vkqty + json[0].twiqty + json[0].webqty + json[0].instaqty;
            document.getElementById('fbinfoperc').innerHTML = (json[0].fbqty*100/total+'').substr(0,(json[0].fbqty*100/total+'').indexOf('.')) + '%';
            document.getElementById('twiinfoperc').innerHTML = (json[0].twiqty*100/total+'').substr(0,(json[0].twiqty*100/total+'').indexOf('.')) + '%';
            document.getElementById('vkinfoperc').innerHTML = (json[0].vkqty*100/total+'').substr(0,(json[0].vkqty*100/total+'').indexOf('.')) + '%';
            document.getElementById('webinfoperc').innerHTML = (json[0].webqty*100/total+'').substr(0,(json[0].webqty*100/total+'').indexOf('.')) + '%';
            document.getElementById('instainfoperc').innerHTML = (json[0].instaqty*100/total+'').substr(0,(json[0].instaqty*100/total+'').indexOf('.')) + '%';
            console.log('total count resources ' + total);

            var data = google.visualization.arrayToDataTable([
                ['Source', 'Reminders'],
                ['Facebook', json[0].fbqty],
                ['VK', json[0].vkqty],
                ['Twitter',  json[0].twiqty],
                ['WEB', json[0].webqty],
                ['Instagram', json[0].instaqty]
            ]);

            var options = {
                title: '',
                colors: ['#3b5998','#422581','#55acee','#0f9c19','#c32aa3'],

                legend: { position: 'none' },
                width: 250,
                height: 250,
                chartArea:{left:0,top:0,width:250,height:250}
            };

            var chart = new google.visualization.PieChart(document.getElementById('graphic3visual'));

            chart.draw(data, options);

        });




    }
</script>




</body>
</html>
