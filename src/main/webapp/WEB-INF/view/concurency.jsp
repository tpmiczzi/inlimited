
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

<script>

    var idconcur;
    var id, place;
    var concur = [];

    $(function () {
        $('#compareform').submit(function(e){
            e.preventDefault();
            console.log('form in left menu done');
            console.log(countconcur);
            console.log($(this));
            concur = [];
            for (var i=0;i<countconcur;i++){
                document.getElementById('concgraphic' + i).style.display='none';
                document.getElementById('labelconc' + i).style.display='none';
            }
            //console.log(document.getElementById('compareform').getElementsByTagName('input').item(0).checked);

            var inputsarray = [];
            inputsarray = document.getElementById('compareform').getElementsByTagName('input');
            console.log('inputarray');

            for (var j=0; j<countconcur; j++){


                console.log(document.getElementById('compareform').getElementsByTagName('input').item(j).checked);
                if (document.getElementById('compareform').getElementsByTagName('input').item(j).checked) {

                    concur.push(document.getElementById('compareform').getElementsByTagName('input').item(j).name);
                   // concurnames.push(document.getElementById('compareform').getElementsByTagName('input').item(j).)
                    //concur = concur + j;
                    console.log('true ' + j);
                }

               /* if (document.getElementById('checkleft'+j).checked){
                    concur.push(j);
                }*/


            }

            console.log(concur);
            showAll();

         /*   document
            idconcur = document.getElementById('concurradiofield').value;
            console.log('choise form');
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
            document.getElementById('graphic3').style.display='block';

*/

        })

    });



    function showAll(){
        console.log('choise form');
        console.log(idconcur);



        google.charts.load('current', {'packages':['corechart']});
        // Set a callback to run when the Google Visualization API is loaded.
        function doStats() {

            var statisticsOverview = {
                init: function() {
                    console.log('init');
                    drawChart();
                    drawChartPie();
                    drawChartSentiment();
                    for (var k=0;k<concur.length;k++){
                        drawChartSentimentConc(k);

                       // google.charts.setOnLoadCallback(drawChartSentimentConc(k));

                    }

                },

        };

            statisticsOverview.init()
        }

        google.charts.setOnLoadCallback(doStats);


        //google.charts.setOnLoadCallback(drawChart);

        document.getElementById('graphiccommon').style.display='block';



       /* google.charts.setOnLoadCallback(drawChartPie);
        //id = 4;
        //place = 2;
        //google.charts.setOnLoadCallback(drawChartSentiment);
        for (var k=0;k<concur.length;k++){
            //drawChartSentimentConc(k);

            google.charts.setOnLoadCallback(drawChartSentimentConc(k));

        }
        //google.charts.setOnLoadCallback(drawChartSentimentConc);
*/
        document.getElementById('graphic2').style.display='block';
        document.getElementById('labelclient').style.display='block';
        //document.getElementById('graphic3').style.display='block';
    }


    function drawChart() {



        var data = new google.visualization.DataTable();
        var clearRow = [new Date()];
        clearRow.push(0);
        data.addColumn('date', 'date');
        data.addColumn('number', 'Наша компания');
        for (var i=1; i<=concur.length; i++){
            data.addColumn('number',concurnames[i-1]);
        //data.addColumn('number', 'Конкурент'+i);
        clearRow.push(0);}
        idconcur = concur[0];
        console.log(clearRow);


        $.getJSON('<c:url value="/concur1"/>', {'idconcur': idconcur}, function(json){  // загрузку JSON данных из

            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {
                data.addRow(clearRow);

                data.setCell(i,0,new Date(json[i].date));
                data.setCell(i,1,json[i].ourpostqty);
                data.setCell(i,2,json[i].concurqty);
               // data.addRow([new Date(json[i].date), json[i].ourpostqty, json[i].concurqty]);

            }

            var chart = new google.visualization.LineChart(document.getElementById('graphic'));

            chart.draw(data, options);


        });

        if (concur.length<=2){
            $.getJSON('<c:url value="/concur1"/>', {'idconcur': concur[1]}, function(json){  // загрузку JSON данных из

                console.log(json);
                console.log('concur length' + concur.length);
                console.log(concur);


                for (var i=0;i<Object.keys(json).length;i++) {
                    data.setCell(i,3,json[i].concurqty);

                }

                var chart = new google.visualization.LineChart(document.getElementById('graphic'));

                chart.draw(data, options);

            });

        }

        console.log(data);

        var options = {
            title: '',
            legend: { position: 'top' },
            min: 0,
            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15},
            }
        };



    }



    function drawChartPie() {

        $.getJSON('<c:url value="/concur2"/>', {}, function(json){  // загрузку JSON данных из

            console.log(json);

            var data = google.visualization.arrayToDataTable([
                ['Source', 'Reminders'],
                ['VK', json[0].results.VKontakte],
                ['Facebook', json[0].results.Facebook],
                ['Twitter',  json[0].results.Twitter],
                ['WEB', json[0].results.WEB]
            ]);

            var data2 = google.visualization.arrayToDataTable([
                ['Source', 'Reminders'],
                ['VK', json[1].results.VKontakte],
                ['Facebook', json[1].results.Facebook],
                ['Twitter',  json[1].results.Twitter],
                ['WEB', json[1].results.WEB]
            ]);

            var options = {
                title: '',
                colors: ['#422581', '#3b5998', '#55acee', '#0f9c19'],
                legend: { position: 'left' },
                width: 200,
                height: 140,
                chartArea:{left:20,top:20,width:200,height:200}
            };

            var options2 = {
                title: '',
                colors: ['#422581', '#3b5998', '#55acee', '#0f9c19' ],
                legend: { position: 'left' },
                width: 200,
                height: 140,
                chartArea:{left:20,top:20,width:200,height:200}
            };

            var chart = new google.visualization.PieChart(document.getElementById('graphic2resources'));

            var chart2 = new google.visualization.PieChart(document.getElementById('concgraphicres0'));

            chart.draw(data, options);
            chart2.draw(data2, options2);

        });




    }


    function drawChartSentiment() {
        placelocal = place;

        var data = new google.visualization.DataTable();
        data.addColumn('date', 'date');
        data.addColumn('number', 'Positive');
        data.addColumn('number', 'Negative');
        //dataSent.addColumn('number', 'Neutral');

        $.getJSON('<c:url value="/statement1"/>', {'id' : id}, function(json){  // загрузку JSON данных из
            console.log('start!');
            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {

                data.addRow([new Date(json[i].date), json[i].positiveqty, json[i].negativeqty]);//, json[i].neutralqty]);

            }

            console.log(data);
            console.log(placelocal);


            var chart = new google.visualization.LineChart(document.getElementById('graphic2sentiment'));

            chart.draw(data, options);

        });



        var options = {
            legend: { position: 'bottom' },
            min: 0,
            colors: ['#00ff00','#ff0000','#d5d5d5'],
            height: 200,
            chartArea:{left:100,top:20,width:'85%',height:'60%'},
            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15},
            }
        };

        var optionsSent = {
            legend: { position: 'bottom' },
            colors: ['#00ff00','#ff0000','#d5d5d5'],
            min: 0
        };


    }


    function drawChartSentimentConc(kperm) {

        console.log('kperm ' + kperm);

        var dataConc = new google.visualization.DataTable();
        dataConc.addColumn('date', 'date');
        dataConc.addColumn('number', 'Positive');
        dataConc.addColumn('number', 'Negative');
        //dataSent.addColumn('number', 'Neutral');
        id = concur[kperm];

        $.getJSON('<c:url value="/statement1"/>', {'id' : id}, function(json){  // загрузку JSON данных из
            console.log('start!');
            console.log(json);

            for (var i=0;i<Object.keys(json).length;i++) {

                dataConc.addRow([new Date(json[i].date), json[i].positiveqty, json[i].negativeqty]);//, json[i].neutralqty]);

            }

            console.log(dataConc);
            console.log(placelocal);


            var chart = new google.visualization.LineChart(document.getElementById('concgraphicsen' + kperm ));

            chart.draw(dataConc, options);

        });
        document.getElementById('concgraphic' + kperm).style.display='block';
        document.getElementById('labelconc' + kperm).innerHTML = concurnames[kperm];
        document.getElementById('labelconc' + kperm).style.display='block';



        var options = {
            legend: { position: 'bottom' },
            min: 0,
            colors: ['#00ff00','#ff0000','#d5d5d5'],
            height: 200,
            chartArea:{left:100,top:20,width:'85%',height:'60%'},
            hAxis: {
                format: 'dd/MM',
                gridlines: {count: 15},
            }
        };

        var optionsSent = {
            legend: { position: 'bottom' },
            min: 0
        };

        $.getJSON('<c:url value="/concur2"/>', {}, function(json){  // загрузку JSON данных из
            //!!! change kperm for real id

            console.log(json);

            var data2 = google.visualization.arrayToDataTable([
                ['Source', 'Reminders'],
                ['VK', json[kperm].results.VKontakte],
                ['Facebook', json[kperm].results.Facebook],
                ['Twitter',  json[kperm].results.Twitter],
                ['WEB', json[kperm].results.WEB]
            ]);



            var options2 = {
                title: '',
                colors: ['#422581', '#3b5998', '#55acee', '#0f9c19'],
                legend: { position: 'left' },
                width: 200,
                height: 140,
                chartArea:{left:20,top:20,width:200,height:200}
            };


            var chart2 = new google.visualization.PieChart(document.getElementById('concgraphicres'+kperm));


            chart2.draw(data2, options2);

        });


    }



</script>

<div id="pagewidth">
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




    <div id="wrapper" class="clearfix">
        <div id="leftcol" style="background-image: url(<c:url value="/resources/images/background.png"/>); min-width: 20%">
            <div style=" margin-left: 20px; margin-top: 20px; color: #FFFFFF"><span style="font-size: 18px;">Проект</span> <br><span id="lefttheme"> тема мониторинга</span></div>

            <a href="<c:url value="/info"/>" style="color: white"><div class="leftmenuitems"><img src="<c:url value="/resources/images/reminders_menu.png"/>">&nbsp;&nbsp;&nbsp;Упоминания</div></a>
            <a href="<c:url value="/excel"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/eksport.png"/>">&nbsp; &nbsp;Экспорт данных</div></a>
            <a href="<c:url value="/graphics"/>" style="color: white"><div class="leftmenuitems" style="padding-left: 40px;font-size: 12px;"><img src="<c:url value="/resources/images/infografika.png"/>">&nbsp;&nbsp;&nbsp; Инфографика</div></a>
            <a href="<c:url value="/analytics"/>" style="color: white"><div class="leftmenuitems" ><img src="<c:url value="/resources/images/analitika.png"/>">&nbsp;&nbsp;&nbsp;Аналитика</div></a>
            <div class="dropdown" href="<c:url value="/concurency"/>"><button class="dropbtn"> <div style="color:white; text-align: left; font-size: 12px;"><img style="position: relative; top: 15px;" src="<c:url value="/resources/images/layer_182.png"/>">&nbsp;&nbsp;&nbsp;Сравнение<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; с конкурентом</div></button>
            <div id="leftconcuritems" class="dropdown-content">
            <form id="compareform"></form>

            </div>
        </div>


            <div style="position: absolute; top: 570px; left: 30px; float: left; margin-left: 15px; font-size: 14px;"><a href="www.inlimited.com.ua" style="color: white;">www.inlimited.com.ua</a></div>

            <div style="position: absolute; top: 520px; left: 40px; float: left; margin-left: 25px;"><a href="https://www.facebook.com/InlimitedTM/"><img width="35" height="35" src="<c:url value="/resources/images/facebook_left.png"/>"></a>
                <a href="https://www.linkedin.com/company-beta/10545169/" target="_blank"><img width="35" height="35" style=" margin-left: 20px; " src="<c:url value="/resources/images/linkedin_left.png"/>"> </a>
            </div>
        </div>


            <div id="maincol" style="width:80%; min-width: 1040px; min-height:600px; margin-left:20%;background: url(<c:url value="/resources/images/infobackground.png"/>) repeat-x;">
                <div id="graphiccommon" style="display: none">
                            <div class="labelsup" style="height:40px; margin-right: 28px; margin-top: 20px; background-color: white;">&nbsp;&nbsp;&nbsp;КОЛИЧЕСТВО УПОМИНАНИЙ
                                <input type="button" class="remindersbuttons" id="buttonmonth" value="Месяцы">
                                <input type="button" class="remindersbuttons" id="buttonweeks" value="Недели">
                                <input type="button" class="remindersbuttons"  id="buttondays" value="Дни">
                            </div>
                        <div id="graphic"></div>
                </div>
                <div id="labelclient" class="labelsup" style="display: none; margin-top: 30px;" >&nbsp;&nbsp;&nbsp;Клиент</div>
                <div id="graphic2" style="display: none;">
                        <div  style="border-right: solid 1px darkgray; width:25%;height: 200px; float: left">
                            <div style="border-bottom: solid 1px darkgray; height: 38px;">
                                <div class="labelsup" style="position: relative;top:30%; margin-left: 0px; ">&nbsp;&nbsp;&nbsp;РЕСУРС</div>
                            </div>
                            <div id="graphic2resources" style="width:30%; float: left" >
                            </div>


                        </div>
                        <div id="graphic2sentiment" style="float:left; width:70%"></div>
                </div>

                <div id="labelconc0" class="labelsup" style="display: none; margin-top: 30px;" >&nbsp;&nbsp;&nbsp;Конкурент</div>
                <div id="concgraphic0" style="display: none">
                    <div  style="border-right: solid 1px darkgray; width:25%;height: 200px;float: left ">
                        <div style="border-bottom: solid 1px darkgray; height: 38px;">
                            <div class="labelsup" style="position: relative;top:30%; margin-left: 0px; ">&nbsp;&nbsp;&nbsp;РЕСУРС</div>
                        </div>
                        <div id="concgraphicres0" style="width:30%; float: left">
                        </div>


                    </div>
                    <div id="concgraphicsen0" style="float: left; width: 70%"></div>
                </div>

                <div id="labelconc1" class="labelsup" style="display: none; margin-top: 30px;" >&nbsp;&nbsp;&nbsp;Конкурент</div>
                <div id="concgraphic1" style="display: none">
                    <div  style="border-right: solid 1px darkgray; width:25%;height: 200px;float: left ">
                        <div style="border-bottom: solid 1px darkgray; height: 38px;">
                            <div class="labelsup" style="position: relative;top:30%; margin-left: 0px; ">&nbsp;&nbsp;&nbsp;РЕСУРС</div>
                        </div>
                        <div id="concgraphicres1" style="width:30%; float: left">
                        </div>


                    </div>
                    <div id="concgraphicsen1" style="float: left; width: 70%"></div>
                </div>







    </div>
</div>

    <script>

        $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

            console.log(useraccount);

            document.getElementById('customername').innerHTML=useraccount[0];

            document.getElementById('lefttheme').innerHTML=useraccount[0];

            document.getElementById('labelclient').innerHTML=useraccount[0];



        });
    </script>

<script>

    var countconcur;
    var concurnames = [];

    $.ajax({type: 'get',
        url: '<c:url value="/getconcurrentnames"/>',
        success: function(json){
            console.log(json);
            countconcur = Object.keys(json).length;
            concurnames = [];
         //   document.getElementById('leftconcuritems').innerHTML = '<form id="compareform" action="/jjj">';
            for (i=0;i<Object.keys(json).length; i++){

                concurnames.push(json[i].name);

                document.getElementById('compareform'). innerHTML =
                        document.getElementById('compareform').innerHTML +
                        '<label><input type="checkbox"' + 'id="checkleft' + i + '" name="' + json[i].id + '">' + json[i].name + '</label>';

              /*      document.getElementById('leftconcuritems').innerHTML =
                            document.getElementById('leftconcuritems').innerHTML +
                            '<label><input type="checkbox">' + json[i].name + '</label>';
                */            //'<a href="#" onclick="idconcur=' + json[i].id + ';showAll();">' + json[i].name + '</a>';
            }
            document.getElementById('compareform').innerHTML =
                    document.getElementById('compareform').innerHTML  +
            '<input class="dropbtn" style="color: white" type="submit" value="Сравнить">';
        }});


</script>
<!--
<div id="concurformdiv" style="background-color:white;
position:absolute; top: 300px; text-align: center; left:490px; border: solid 2px dimgray;width: 300px; height: 200px;border-radius: 3px">

    <script>

        $.ajax({type: 'get',
                url: '<c:url value="/getconcurrentnames"/>',
                success: function(json){
                    console.log(json);
                    for (i=0;i<Object.keys(json).length; i++){
                    //    document.getElementById('leftconcurentnames').innerHTML =
                    //            document.getElementById('leftconcurentnames').innerHTML +
                    //            '<a href="" style="height: 36px;background-color: #0f9c19" value="' + json[i].id + '">' + json[i].name + '</a>';
                    }
                }})
    </script>
    <form id='concurchoiseform' action="<c:url value="/acitest"/>">

        Сравнить с конкурентом из списка<br><br><br>
        <select id="concurradiofield">
            <option selected disabled hidden>Выберите из списка</option>


            </select>

            <br>
            <br>
            <br>
        <button type="submit" name="Buttonpress" value="Buttonvalue">Выбрать</button>

    </form>
-->
</div>





</body>
</html>