<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"> </script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/1636400.css"/>" type="text/css"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/simplePagination.css"/>"/>

    <script>

        var itemCount = 1;
        console.log(window.itemCount);

        var storeItems = {};

        var storeItemsUsers = {};
        
        function mailMessage(text, link) {

            document.location.href = "mailto:?subject=Attention, please!"
                    + "&body=" + encodeURIComponent(text + link);
            
        }

        function checkInList(i) {
            var pos;
            if (!window.storeItems[itemCount*10 +i]){
            window.storeItems[itemCount*10 + i] = true;
            document.getElementById("elebutton2"+i).innerHTML = '<img  src="<c:url value="/resources/images/smallstarchecked.png"/>">' +
                    '<a> Отметить пост <br></a>';

            }
            else {
                window.storeItems[itemCount*10 + i] = false;
                document.getElementById("elebutton2"+i).innerHTML = '<img  src="<c:url value="/resources/images/starsmall.png"/>">' +
                        '<a> Отметить пост <br></a>';

            }

            console.log(storeItems);
        }

        function checkInListShow(i) {
            var pos;
            if (window.storeItems[itemCount*10 +i]){
                document.getElementById("elebutton2"+i).innerHTML = '<img  src="<c:url value="/resources/images/smallstarchecked.png"/>">' +
                        '<a> Отметить пост <br></a>';

            }
            else {

                document.getElementById("elebutton2"+i).innerHTML = '<img  src="<c:url value="/resources/images/starsmall.png"/>">' +
                        '<a> Отметить пост <br></a>';
            }


        }
        function checkInListUser(i) {
            var pos;
            if (!window.storeItemsUsers[itemCount*10 +i]){
                window.storeItemsUsers[itemCount*10 + i] = true;
                document.getElementById("elebutton3"+i).innerHTML = '<img src="<c:url value="/resources/images/dontshowsmallchecked.png"/>" >' +
                        '<a> Не отображать автора <br></a>';

                addUserToBanList(document.getElementById('elename' + i).innerHTML,true);
            }
            else {
                window.storeItemsUsers[itemCount*10 + i] = false;
                document.getElementById("elebutton3"+i).innerHTML = '<img src="<c:url value="/resources/images/dontShowSmall.png"/>" >' +
                        '<a> Не отображать автора <br></a>';

                addUserToBanList(document.getElementById('elename' + i).innerHTML,false);

            }


        }

        function checkInListUserShow(i) {
            var pos;
            if (window.storeItemsUsers[itemCount*10 +i]){

                document.getElementById("elebutton3"+i).innerHTML = '<img src="<c:url value="/resources/images/dontshowsmallchecked.png"/>" >' +
                        '<a> Не отображать автора <br></a>';
                pos = itemCount*10 + i;
                console.log('checked ' + pos);
            }
            else {

                document.getElementById("elebutton3"+i).innerHTML = '<img src="<c:url value="/resources/images/dontShowSmall.png"/>" >' +
                        '<a> Не отображать автора <br></a>';
                pos = itemCount*10 + i;
                console.log('unchecked ' + pos  );
            }

            console.log(storeItems);
        }

        function selectAllSources() {
            console.log('select all sources!!!');

            document.getElementById('fbsource').checked = 'checked';
            document.getElementById('twisource').checked = 'checked';
            document.getElementById('vksource').checked = 'checked';
            document.getElementById('igsource').checked = 'checked';
            document.getElementById('ytsource').checked = 'checked';
            document.getElementById('blogsource').checked = 'checked';
            document.getElementById('forumsource').checked = 'checked';
            document.getElementById('websource').checked = 'checked';

        }



    </script>



    <title>Inlimited</title>
</head>
<body>

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

    <script>
        function showBriefItem(i) {
            document.getElementById('eletext'+i).innerHTML = document.getElementById('fulltext'+i).innerHTML.substr(0,200) +
                    '<div  style="color: #4e6473; cursor: pointer  " onclick="showFullItem(' + i + ')">Показать</div>';
            $("#leftcol").height($("#maincol").height()+150);
        }

        function showFullItem(i){
            document.getElementById('eletext'+i).innerHTML = document.getElementById('fulltext'+i).innerHTML
                    +
                    '<div style="color: #4e6473; cursor: pointer  " onclick="showBriefItem(' + i + ')">Скрыть</div>';
            $("#leftcol").height($("#maincol").height()+150);
        }

        function resultItemShow(jsonitem,i) {
            document.getElementById("elesourse"+i).innerHTML = jsonitem.source;
            if (jsonitem.source == 'FACEBOOK') document.getElementById("elesourse"+i).innerHTML = '<img style="position:relative; top: 0px;" src="<c:url value="/resources/images/FBicon.png"/>">';
            if (jsonitem.source == 'VK') document.getElementById("elesourse"+i).innerHTML = '<img style="position:relative; top: 3px;" src="<c:url value="/resources/images/layer_175.png"/>">';
            if (jsonitem.source == 'INSTAGRAM') document.getElementById("elesourse"+i).innerHTML = '<img style="position:relative; top: 3px;" src="<c:url value="/resources/images/instagram.png"/>">';
            document.getElementById("fulltext"+i).innerHTML = jsonitem.content;
            document.getElementById("eletext"+i).innerHTML = jsonitem.content.substr(0,200) +
            '<div style="color: #4e6473; cursor: pointer " onclick="showFullItem(' + i + ')">Показать</div>';

            document.getElementById('elephoto' + i).innerHTML = '<img style="display: block; margin: auto;" src="<c:url value="/resources/images/logoInlimited.png"/>">';

            document.getElementById("elecomm"+i).innerHTML = '<img style="position:relative; top: 3px;" src="<c:url value="/resources/images/cloudsmall.png"/>">' + jsonitem.commentqty;


            if (jsonitem.follqty == 'Unknown') document.getElementById("elefoll"+i).innerHTML = 'Followers: 0';
                else document.getElementById("elefoll"+i).innerHTML = 'Followers: ' + jsonitem.follqty;
            document.getElementById("elelikes"+i).innerHTML = '<img style="position:relative; top: 3px;" src="<c:url value="/resources/images/heart.png"/>">' + jsonitem.likesqty;
            document.getElementById("elename"+i).innerHTML = jsonitem.userName;
            if (jsonitem.sentiment == 'NEUTRAL' || jsonitem.sentiment == 'UNKNOWN' ) document.getElementById("elesentiment"+i).innerHTML = 'Тональность <img style="position:relative; top: 3px;" src="<c:url value="/resources/images/sentiment_neutral.png"/>">';
            if (jsonitem.sentiment == 'NEGATIVE') document.getElementById("elesentiment"+i).innerHTML = 'Тональность <img style="position:relative; top: 3px;" src="<c:url value="/resources/images/sentiment_negative.png"/>">';
            if (jsonitem.sentiment == 'POSITIVE') document.getElementById("elesentiment"+i).innerHTML = 'Тональность <img style="position:relative; top: 3px;" src="<c:url value="/resources/images/sentimentPositive.png"/>">';

            document.getElementById("eledate"+i).innerHTML = '<img style="position:relative; top: 3px;" src="<c:url value="/resources/images/calendarsmall.png"/>">' + jsonitem.date;
            document.getElementById("linkbutton5" + i).setAttribute('href',jsonitem.link);
            document.getElementById("linkbutton1" + i).setAttribute('href',jsonitem.authorLink);
            checkInListShow(i);
            checkInListUserShow(i);
            document.getElementById("eleitem"+i).style.visibility = "visible";
        }


    </script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

        // Load the Visualization API and the corechart package.
        google.charts.load('current', {'packages':['corechart']});






        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);



        function drawChart() {

            var data = new google.visualization.DataTable();
            data.addColumn('date', 'date');
            data.addColumn('number', 'total');
         /*   data.addColumn('number', 'post');
            data.addColumn('number', 'positive');
            data.addColumn('number', 'negative');

*/



            $.getJSON('<c:url value="/statement1"/>', {}, function(json){  // загрузку JSON данных из

                console.log(json);

                for (var i=0;i<Object.keys(json).length;i++) {
                    data.addRow([new Date(json[i].date),json[i].total]);//, json[i].postqty, json[i].positiveqty, json[i].negativeqty]);

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



    <div id="wrapper" class="clearfix">
        <div id="twocols">
            <div id="maincol">
                <div style="min-width: 80%; min-height: 40px; margin-top: 30px; margin-left: 20px; margin-right: 15px; background: #ffffff;padding-top: 5px">
                    <span style="margin-left: 20px;margin-top: 10px;">КОЛИЧЕСТВО УПОМИНАНИЙ</span>
                <input type="button" class="remindersbuttons" id="buttonmonth"  onclick="drawChartMonth()" value="Месяцы">
                    <input type="button" class="remindersbuttons" id="buttonweeks" onclick="drawChartWeek()" value="Недели">
                    <input type="button" class="remindersbuttons"  id="buttondays" onclick="drawChart()" value="Дни">
                </div>
                <div id="graphic"></div>
                <div>

                    <script>

                        $(function(){
                                    $('#textquery').submit(function(e){

                                                e.preventDefault();
                                                storeItems = {};

                                                    storeItemsUsers = {};

                                                var m_method=$(this).attr('method');

                                                var m_action=$(this).attr('action');

                                                var m_data=$(this).serialize();

                                                console.log("text query method is called now ");
                                                $.ajax({
                                                    type:'get',
                                                    url: '<c:url value="/gettextqueryfull"/>',
                                                    data: m_data
                                                });


                                             //   $.getJSON('<c:url value="/gettextqueryfull"/>',m_data);


                                        $.getJSON('<c:url value="/gettextquery"/>', {text : '1'}, function(jsontextqueryrequest){

                                            console.log(jsontextqueryrequest);
                                            console.log('sssasas');
                                            for (var i=0;i<10;i++) {

                                                document.getElementById("eleitem"+i).style.visibility = "hidden";


                                            }


                                            for (var i=0;i<Object.keys(jsontextqueryrequest).length;i++) {
                                                resultItemShow(jsontextqueryrequest[i],i);
                                            }
                                            $("#leftcol").height($("#maincol").height()+150);
                                            console.log("end!!")
                                        });

/*
                                                $.ajax({
                                                    type: m_method,
                                                    url: m_action,
                                                    data: m_data,
                                                    success: function(json){


                                                        console.log(json);
                                                        for (var i=0;i<10;i++) {

                                                            document.getElementById("eleitem"+i).style.visibility = "hidden";


                                                        }


                                                        for (var i=0;i<Object.keys(json).length;i++) {

                                                            resultItemShow(json[i],i);



                                                        }
                                                        $("#leftcol").height($("#maincol").height()+150);


                                                    }}
                                                );
*/
                                            }
                                    );
                                }

                        );



                    </script>

                    <div id="totaltable">
                        <table style="min-width: 96%; text-align: center; margin: 20px; margin-left: 18px; margin-right: 20px; table-layout: fixed;">
                            <tr>
                                <td><img src="<c:url value="/resources/images/all.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/fb.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/twitter.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/layer_175.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/instagram.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/blogs.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/layer_176.png"/>"></td>
                                <td><img src="<c:url value="/resources/images/cmi.png"/>"></td>
                            <tr>
                                <td>Все</td>
                                <td>Facebook</td>
                                <td>Twitter</td>
                                <td>VK</td>
                                <td>Instagram</td>
                                <td>Blogs</td>
                                <td>Forums</td>
                                <td>СМИ</td>
                            </tr>
                            <tr style="font-size: 24px; height: 55px;

                                    vertical-align: bottom;">
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);" id="total">0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totalfb">0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totaltwitter">0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totalvk">0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totalinstagram">0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totalblog" >0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totalforum">0</td>
                                <td class="lownumbers" style="background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>);"id="totalsmi">0</td>
                            </tr>

                        </table>
                    </div>
                    <div>
                        <div style="float: left">
                    <form action="<c:url value="/gettextquery"/>" method="GET" id="textquery">
                        <input style="height: 40px;width: 400px; padding-left: 10px;" type="text"  name="text" id="text" placeholder="Поиск..">
                        <input class="search_button"  type="submit" value="От" />

                    </form>
                    </div>


                    <div id="compact-pagination" class="pagination" style="float: right; margin-right: 10px; ">
                        <script src="<c:url value="/resources/js/jquery.simplePagination.js"/>"></script>
                        <script>
                            $(function() {
                                $("#compact-pagination").pagination({
                                    items: 1000,
                                    itemsOnPage: 10,
                                    cssStyle: 'compact-theme',
                                    onPageClick: function(pageNumber){
                                        $.getJSON('<c:url value="/pages"/>', {pageNumber: pageNumber}, function(jsonback){

                                            window.itemCount = pageNumber;
                                            console.log(window.itemCount);

                                            console.log(jsonback);
                                            for (var i=0;i<10;i++) {

                                                document.getElementById("eleitem"+i).style.visibility = "hidden";


                                            }

                                            for (var i=0;i<Object.keys(jsonback).length;i++) {
                                                resultItemShow(jsonback[i],i);


                                            }
                                            $("#leftcol").height($("#maincol").height()+150);

                                        });

                                }
                            })})
                        </script>

                        </div>







                    </div>


                </div>
                <div id="resultset" style=" position: relative; top: 10px; left: 20px;width: 100%">
                    <div id="eleitem0" style="background-color:#ffffff; width:733px; min-height:50px; visibility: hidden; vertical-align: top;   margin-top: 70px; margin-right: 40px;">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse0" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment0" style=" width:120px" >Sentiment</td>
                                <td id="elefoll0" style=" width:130px;  position: relative; top:1px" >Followers</td>
                                <td id="elelikes0" style=" width:100px" >Likes</td>
                                <td id="elecomm0" style=" width:100px" >Comments</td>
                                <td id="eledate0" style=" width:150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td  id = "elephoto0" style="width:15%;" >
                                    Avatar<br> photo <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename0"> name of afkbi</div>
                                    <div id="eletext0" style="color: #888888">textjogkmjkglasekmgvklrevmklmdfsklamklvmfsdvgkvnjdsfnvfmvkms
                                    mvmvnmklsdfnjksbjufbsabjksfdnmbmnbjsfnbjnbjrjkeanjhghq;g</div>
                                </td>
                            </tr>

                        </table>
                        <div id="fulltext0" style="display: none">Text for hiding full text</div>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton10" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton10"  target="_blank"> Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton20" style="width: 18%; cursor: pointer;" onclick="checkInList(0)">
                                    <img id="iconbutton20" src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton30" style="width: 25%; cursor: pointer  " onclick="checkInListUser(0)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>" >
                                    <a> Не отображать автора <br></a>
                                </td>
                                <td id="elebutton40" style="width: 15%; cursor: pointer  "onclick="mailMessage(document.getElementById('eletext0').innerHTML, ' ')">
                                    <img  src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a> Отправить <br></a>
                                </td>
                                <td id="elebutton50" style="width:11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton50" target="_blank"> Ответить <br></a>
                                </td>
                            </tr>

                        </table>

                    </div>

                    <div id="eleitem1" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse1" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment1" style=" width:120px" >Sentiment</td>
                                <td id="elefoll1" style=" width:130px;  position: relative; top:1px" >Followers</td>
                                <td id="elelikes1" style=" width:100px" >Likes</td>
                                <td id="elecomm1" style=" width:100px" >Comments</td>
                                <td id="eledate1" style=" width:150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto1" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename1"> name of afkbi</div>
                                    <div id="eletext1" style="color: #888888">textjogkmjkglasekmgvklrevmklmdfsklamklvmfsdvgkvnjdsfnvfmvkms
                                        mvmvnmklsdfnjksbjufbsabjksfdnmbmnbjsfnbjnbjrjkeanjhghq;g</div>
                                </td>
                            </tr>

                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext1" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton11" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton11"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton21" style="width: 18%; cursor: pointer;" onclick="checkInList(1)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton31" style="width: 25%; cursor: pointer  " onclick="checkInListUser(1)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>" >
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton41" style="width: 15%; cursor: pointer  "    onclick="mailMessage(document.getElementById('eletext1').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton51" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton51" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>

                    </div>

                    <div id="eleitem2" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;   visibility: hidden; ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse2" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment2" style=" width:120px" >Sentiment</td>
                                <td id="elefoll2" style=" width:130px;  position: relative; top:1px" >Followers</td>
                                <td id="elelikes2" style=" width:100px" >Likes</td>
                                <td id="elecomm2" style=" width:100px" >Comments</td>
                                <td id="eledate2" style=" width:150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto2" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename2"> name of afkbi</div>
                                    <div id="eletext2" style="color: #888888">textjogkmjkglasekmgvklrevmklmdfsklamklvmfsdvgkvnjdsfnvfmvkms
                                        mvmvnmklsdfnjksbjufbsabjksfdnmbmnbjsfnbjnbjrjkeanjhghq;g</div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext2" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton12" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton12"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton22" style="width: 18%; cursor: pointer;" onclick="checkInList(2)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton32" style="width: 25%; cursor: pointer  "  onclick="checkInListUser(2)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton42" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext2').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton52" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton52" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>

                    </div>

                    <div id="eleitem3" style="background-color:#ffffff; width:733px; min-height:50px;  vertical-align: top;  margin-top: 20px;  visibility: hidden;">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse3" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment3" style="width: 120px" >Sentiment</td>
                                <td id="elefoll3" style="width: 130px;  position: relative; top:1px" >Followers</td>
                                <td id="elelikes3" style = "width: 100px" >Likes</td>
                                <td id="elecomm3" style="width: 100px" >Comments</td>
                                <td id="eledate3" style = "width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto3" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename3"> name of afkbi</div>
                                    <div id="eletext3" style="color: #888888">textjogkmjkglasekmgvklrevmklmdfsklamklvmfsdvgkvnjdsfnvfmvkms
                                        mvmvnmklsdfnjksbjufbsabjksfdnmbmnbjsfnbjnbjrjkeanjhghq;g</div>
                                </td>
                            </tr>

                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext3" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton13" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton13"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton23" style="width: 18%; cursor: pointer;" onclick="checkInList(3)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton33" style="width: 25%; cursor: pointer  " onclick="checkInListUser(3)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton43" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext3').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton53" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton53" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>

                    </div>


                    <div id="eleitem4" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse4" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment4" style="width: 120px" >Sentiment</td>
                                <td id="elefoll4" style="width: 130px;  position: relative; top:1px">Followers</td>
                                <td id="elelikes4" style="width: 100px" >Likes</td>
                                <td id="elecomm4" style="width: 100px" >Comments</td>
                                <td id="eledate4" style="width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto4" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename4"> name of afkbi</div>
                                    <div id="eletext4" style="color: #888888">textjogkmjkglasekmgvklrevmklmdfsklamklvmfsdvgkvnjdsfnvfmvkms
                                        mvmvnmklsdfnjksbjufbsabjksfdnmbmnbjsfnbjnbjrjkeanjhghq;g</div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext4" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton14" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton14"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton24" style="width: 18%; cursor: pointer;" onclick="checkInList(4)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton34" style="width: 25%; cursor: pointer  " onclick="checkInListUser(4)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton44" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext4').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton54" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton54" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>


                    </div>


                    <div id="eleitem5" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse5" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment5" style="width: 120px" >Sentiment</td>
                                <td id="elefoll5" style="width: 130px;  position: relative; top:1px">Followers</td>
                                <td id="elelikes5" style="width: 100px" >Likes</td>
                                <td id="elecomm5" style="width: 100px" >Comments</td>
                                <td id="eledate5" style="width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto5" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename5"> name of afkbi</div>
                                    <div id="eletext5" style="color: #888888"></div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext5" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton15" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton15"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton25" style="width: 18%;cursor: pointer;" onclick="checkInList(5)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton35" style="width: 25%; cursor: pointer  " onclick="checkInListUser(5)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton45" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext4').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton55" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton55" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>


                    </div>

                    <div id="eleitem6" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse6" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment6" style="width: 120px" >Sentiment</td>
                                <td id="elefoll6" style="width: 130px;  position: relative; top:1px">Followers</td>
                                <td id="elelikes6" style="width: 100px" >Likes</td>
                                <td id="elecomm6" style="width: 100px" >Comments</td>
                                <td id="eledate6" style="width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto6" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename6"> name of afkbi</div>
                                    <div id="eletext6" style="color: #888888"></div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext6" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton16" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton16"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton26" style="width: 18%; cursor: pointer;" onclick="checkInList(6)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton36" style="width: 25%; cursor: pointer  " onclick="checkInListUser(6)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton46" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext4').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton56" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton56" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>


                    </div>

                    <div id="eleitem7" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse7" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment7" style="width: 120px" >Sentiment</td>
                                <td id="elefoll7" style="width: 130px;  position: relative; top:1px">Followers</td>
                                <td id="elelikes7" style="width: 100px" >Likes</td>
                                <td id="elecomm7" style="width: 100px" >Comments</td>
                                <td id="eledate7" style="width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto7" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename7"> name of afkbi</div>
                                    <div id="eletext7" style="color: #888888"></div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext7" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton17" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton17"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton27" style="width: 18%; cursor: pointer;" onclick="checkInList(7)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton37" style="width: 25%; cursor: pointer  " onclick="checkInListUser(7)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton47" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext4').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton57" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton57" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>


                    </div>

                    <div id="eleitem8" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse8" align="center"  style=" width:15%;">source</td>
                                <td id="elesentiment8" style="width: 120px" >Sentiment</td>
                                <td id="elefoll8" style="width: 130px;  position: relative; top:1px">Followers</td>
                                <td id="elelikes8" style="width: 100px" >Likes</td>
                                <td id="elecomm8" style="width: 100px" >Comments</td>
                                <td id="eledate8" style="width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto8" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename8"> name of afkbi</div>
                                    <div id="eletext8" style="color: #888888"></div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext8" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton18" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton18"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton28" style="width: 18%; cursor: pointer;" onclick="checkInList(8)">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton38" style="width: 25%; cursor: pointer  " onclick="checkInListUser(8)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton48" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext4').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton58" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton58" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>


                    </div>

                    <div id="eleitem9" style="background-color:#ffffff; width:733px; min-height:50px; vertical-align: top;   margin-top: 20px;  visibility: hidden;  ">
                        <table style="min-height: 10px; min-width: 100%;">
                            <tr>
                                <td id="elesourse9" align="center"  style=" width:15%;" >source</td>
                                <td id="elesentiment9" style="width: 120px" >Sentiment</td>
                                <td id="elefoll9" style="width: 130px;  position: relative; top:1px">Followers</td>
                                <td id="elelikes9" style="width: 100px" >Likes</td>
                                <td id="elecomm9" style="width: 100px" >Comments</td>
                                <td id="eledate9" style="width: 150px" >Date</td>
                            </tr>
                        </table>
                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <table style="min-height:10px;width:100%;">
                            <tr>
                                <td id="elephoto9" style="width: 15%;">
                                    Avatarka <br>
                                </td>
                                <td  style="width:85%;">
                                    <div id="elename9"> name of afkbi</div>
                                    <div id="eletext9" style="color: #888888">textjogkmjkglasekmgvklrevmklmdfsklamklvmfsdvgkvnjdsfnvfmvkms
                                        mvmvnmklsdfnjksbjufbsabjksfdnmbmnbjsfnbjnbjrjkeanjhghq;g</div>
                                </td>
                            </tr>

                        </table>

                        <hr style="color: #e5f634; margin:0px; min-width:100%;">
                        <div id="fulltext9" style="display: none">Text for hiding full text</div>
                        <table style="min-height:10px;width:100%; font-size: 14px;">
                            <tr>
                                <td id="elebutton19" style="width: 31%;">
                                    <img src="<c:url value="/resources/images/humansmall.png"/>">
                                    <a id="linkbutton19"  target="_blank">Просмотреть страницу автора <br></a>
                                </td>
                                <td id="elebutton29" style="width: 18%;cursor: pointer;" onclick="checkInList(9) ">
                                    <img src="<c:url value="/resources/images/starsmall.png"/>">
                                    <a>Отметить пост <br></a>
                                </td>
                                <td id="elebutton39" style="width: 25%; cursor: pointer  " onclick="checkInListUser(9)">
                                    <img src="<c:url value="/resources/images/dontShowSmall.png"/>">
                                    <a>Не отображать автора <br></a>
                                </td>
                                <td id="elebutton49" style="width: 15%; cursor: pointer  " onclick="mailMessage(document.getElementById('eletext4').innerHTML, ' ')">
                                    <img src="<c:url value="/resources/images/envelopeSmall.png"/>">
                                    <a>Отправить <br></a>
                                </td>
                                <td id="elebutton59" style="width: 11%;">
                                    <img src="<c:url value="/resources/images/arrowSmall.png"/>">
                                    <a id="linkbutton59" target="_blank">Ответить <br></a>
                                </td>
                            </tr>

                        </table>


                    </div>




                </div>


            </div>
            <div id="rightcol">
                <div style="min-height:30px; background-color: #6f757f; text-align: center;">
                    <p id="filtersname" >ФИЛЬТРЫ</p>
                </div>

                <script>

                    $(function(){
                        $('#settingsForm').submit(function(e){

                            e.preventDefault();

                            var m_method=$(this).attr('method');

                            var m_action=$(this).attr('action');

                            var m_data=$(this).serialize();

                            $.ajax({
                                type: m_method,
                                url: m_action,
                                data: m_data,
                                success: function(result){




                                    for (var i=0;i<10;i++) {

                                        document.getElementById("eleitem"+i).style.visibility = "hidden";


                                    }
                         /*           for (var i=0;i<Object.keys(result).length;i++) {
                                        resultItemShow(result[i],i);
                                    }
                           */         $("#leftcol").height($("#maincol").height()+150);
                                }
                            });

                            console.log('send data filters');

                            getResults();
  /*                          $.getJSON('<c:url value="/gettextquery"/>', {text : text}, function(jsonbackfiltered){

                                console.log(jsonbackfiltered);
                                for (var i=0;i<10;i++) {

                                    document.getElementById("eleitem"+i).style.visibility = "hidden";


                                }


                                for (var i=0;i<Object.keys(jsonbackfiltered).length;i++) {
                                    resultItemShow(jsonbackfiltered[i],i);
                                }
                                $("#leftcol").height($("#maincol").height()+150);
                                console.log("end!!")
                            });
*/
                        });
                    });


                </script>
                <form style="margin:15px; color: #1f5b55; font-size: 14px;" action="<c:url value="/acitest"/>" method="get" id="settingsForm">
                    <p class="textfilters">ДАТА</p>
                    <input name="dateQuery" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')" style="width: 100px; height: 25px;">
                     - <input name="dateQuery2" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')" style="width: 100px; height: 25px;">
                    <script src="<c:url value="/resources/js/modernizr-custom.min-2.js"/>"></script>
                    <script>
                        if (!Modernizr.inputtypes.date) {
                        $('input[type=date]').datepicker({
                            // Consistent format with the HTML5 picker
                            dateFormat: 'yy-mm-dd'
                        });
                    }
                    </script>


                    <p class="textfilters">ТИП ИСТОЧНИКА</p>
                    <label><input type="checkbox" name="fbsource" id="fbsource"checked> Facebook<br></label>
                    <label><input type="checkbox" name="twisource" id="twisource"checked> Twitter<br></label>
                    <label><input type="checkbox" name="vksource" id="vksource"checked> VK<br></label>
                    <label><input type="checkbox" name="igsource" id="igsource"checked> Instagram<br></label>
                    <label><input type="checkbox" name="ytsource" id="ytsource"checked> Youtube<br></label>
                    <label><input type="checkbox" name="blogsource" id="blogsource"checked> Блоги<br></label>
                    <label><input type="checkbox" name="forumsource" id="forumsource"checked> Форумы<br></label>
                    <label><input type="checkbox" name="websource" id="websource"checked> СМИ<br></label><br>
                    <label><a onclick="selectAllSources()" style="cursor:pointer;">Выбрать все источники</a></label>

                    <p class="textfilters">ТИП КОНТЕНТА</p>
                    <label><input type="checkbox" name="posttype" checked> Пост/статус<br></label>
                    <label><input type="checkbox" name="liketype" checked> Like<br></label>
                    <label><input type="checkbox" name="taggedtype" checked> Tagged<br></label>
                    <label><input type="checkbox" name="sharetype" checked> Share<br></label>
                    <label><input type="checkbox" name="commenttype" checked> Comment<br></label>

                    <p class="textfilters">ТОНАЛЬНОСТЬ</p>
                    <label><input type="checkbox" name="posvibe" checked> Позитивный<br></label>
                    <label><input type="checkbox" name="negvibe" checked> Негативный<br></label>
                    <label><input type="checkbox" name="neuvibe" checked> Нейтральный<br></label>

                    <p class="textfilters">МЕСТОПОЛОЖЕНИЕ</p>
                    <select name="country">
                        <option value="NONE"></option>
                        <option value="УКРАИНА">Украина</option>
                        <option value="Зарубеж">Зарубеж</option>
                        <option value="РОССИЯ">Россия</option>

                    </select>

                    <p class="textfilters">ЯЗЫК</p>
                    <select name="language">
                        <option value="NONE"></option>
                        <option value="UKRAINIAN">Украинский</option>
                        <option value="ENGLISH">Английский</option>
                        <option value="RUSSIAN">Русский</option>

                    </select>

                    <p class="textfilters">АВТОР</p>
                    <select name="author">
                        <option value="NONE"></option>
                        <option value="OWN">Свои</option>
                        <option value="OTHERS">Другие</option>
                    </select>


                    <p class="textfilters">ПОЛ</p>
                    <select name="sex">
                        <option value="NOTHING"></option>
                        <option value="n/a">N/A</option>
                        <option value="MALE">Мужской</option>
                        <option value="FEMALE">Женский</option>
                    </select>

                    <p class="textfilters">ВОЗРАСТ</p>
                    <label><input type="checkbox" name="age0017" checked> Меньше 18<br></label>
                    <label><input type="checkbox" name="age1824" checked> 18-24 лет<br> </label>
                    <label><input type="checkbox" name="age2534" checked> 25-34 лет<br> </label>
                    <label><input type="checkbox" name="age3544" checked> 35-44 лет<br> </label>
                    <label><input type="checkbox" name="age4554" checked> 45-54 лет<br> </label>
                    <label><input type="checkbox" name="age5599" checked> 55 лет и старше<br> </label>


                    <p class="textfilters">ТИП КОММЕНТАРИЯ</p>
                    <label><input type="checkbox" name="likecomm" checked> Like(like,love,haha,wow,sad,angry)<br></label>
                    <label><input type="checkbox" name="sharecomm" checked> Share(retweet)<br></label>
                    <label><input type="checkbox" name="commcomm" checked><span></span> Comment<br></label>
                    <label><input type="checkbox" name="discomm" checked> Dislike<br></label>
                    <br><br>

                    <input type="submit" value="ПРИМЕНИТЬ" style="width: 100%;
                    border: solid 2px #e0e0e8;
                    border-radius: 1px;
                     background-color: #ffffff; text-align: center; height: 30px; font-family: 'Myriad Pro'; font-size: 16px;">



                </form>
            </div>
        </div>

        <div id="leftcol" style="background-image: url(<c:url value="/resources/images/background.png"/>);">
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
        <script>

           function getSearchText(text) {
               var storeItems = {};

               var storeItemsUsers = {};

               $.ajax({
                   type: 'get',
                   url: '<c:url value="/gettextqueryfull"/>',
                   data: {text: text}
               });
           }


            function getResults() {


                $.getJSON('<c:url value="/gettextquery"/>', {text : 'results'}, function(jsontextback){
                        console.log('getREsults');
                    console.log(jsontextback);
                    for (var i=0;i<Object.keys(jsontextback).length;i++) {

                        document.getElementById("eleitem"+i).style.visibility = "hidden";


                    }


                    for (var i=0;i<Object.keys(jsontextback).length;i++) {
                            resultItemShow(jsontextback[i],i);
                    }
                    $("#leftcol").height($("#maincol").height()+150);
                    console.log("end!!")
                });

            }

            setTimeout(getSearchText('initiallaunch'),1000);
            setTimeout(getResults(),7000);
            
            
            function addUserToBanList(name,flag) {

                console.log(name);
                $.ajax({
                    type:'get',
                    url: '/addbanneduser',
                    data:{'text':name, 'isAdded':flag}
                });
                
            }
        </script>
    </div>
</div>

<script>

    $.getJSON('<c:url value="/getforinfototal"/>', {}, function(json){  // загрузку JSON данных из

        console.log(json);
        document.getElementById("total").innerHTML = json[0].total;
        document.getElementById("totalfb").innerHTML = json[0].facebook;
        document.getElementById("totalvk").innerHTML = json[0].vk;
        document.getElementById("totaltwitter").innerHTML = json[0].twitter;
        document.getElementById("totalinstagram").innerHTML = json[0].instagram;
        document.getElementById("totalblog").innerHTML = json[0].blog;
        document.getElementById("totalforum").innerHTML = json[0].forum;
        document.getElementById("totalsmi").innerHTML = json[0].smi;

    });

    $.ajax({type: 'get',
        url: '<c:url value="/getconcurrentnames"/>',
        success: function(json){
            console.log(json);
            for (i=0;i<Object.keys(json).length; i++){
                document.getElementById('leftconcuritems').innerHTML =
                        document.getElementById('leftconcuritems').innerHTML +
                        '<a href="#" onclick="idconcur=' + json[i].id + ';showAll();">' + json[i].name + '</a>';
            }
        }});

/*    $.ajax({type: 'get',
        url: '<c:url value="/accountsettings"/>',
        success: function(useraccount){
            console.log(useraccount);
            document.getElementById('customername').innerHTML=useraccount[0];

            document.getElementById('lefttheme').innerHTML=useraccount[0];

        }});
*/
    $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

        console.log(useraccount);

        document.getElementById('customername').innerHTML=useraccount[0];

        document.getElementById('lefttheme').innerHTML=useraccount[0];



    });
    //
</script>

<script>


    $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

        console.log(useraccount);

        document.getElementById('customername').innerHTML=useraccount[0];

        document.getElementById('lefttheme').innerHTML=useraccount[0];



    });
</script>



</body>
</html>
