<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"> </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/analytics.css"/>" type="text/css"/>
    <title>Inlimited</title>
</head>
<body>


<header id="header">
    <div>

        <p href="<c:url value="/home"/>" style="float:left; position: relative; left:1%; margin-top: 0px; margin-left:25px;height: 8%; width: 20%;"><img  src="<c:url value="/resources/images/logo.png"/>"></p>
        <p style="position:relative; left: 0%; float: left; width: 20%;"><span c>Проект</span><br><span id="customername">тема мониторинга</span></p>

        <p style="position:relative;   float:right; width: 40%; text-align: right; margin-right: 15px; font-size: 18px;">
            <a href="<c:url value="/account"/>" class="exit_icon"><img src="<c:url value="/resources/images/account.png"/>" alt="" width="19" height="20">

                Настройки аккаунта</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="<c:url value="/j_spring_security_logout"/>" class="account"><img src="<c:url value="/resources/images/exit_icon.png"/>" alt="" width="19" height="19">
                Выйти</a></p></div>
</header>
<div id="all">

    <div id="leftcol" style="min-height: 1900px;float: left;width: 240px;background-image: url(<c:url value="/resources/images/background.png"/>);">
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


    <div id="maincol" style="min-width: 1040px; min-height:1900px; margin-left:240px; background-image: url(<c:url value="/resources/images/analytics-background.png"/>); background-repeat: repeat">


        <table width="100%" style=" margin-left: 0px; margin-right: 20px; text-align: center; vertical-align: bottom; margin-top: 30px;">
            <tr>
                <td><img src="<c:url value="/resources/images/results.png"/>"></td>
                <td><img src="<c:url value="/resources/images/ohvat.png"/>"></td>
                <td><img src="<c:url value="/resources/images/likes.png"/>"></td>
                <td><img src="<c:url value="/resources/images/comments.png"/>"></td>
                <td><img src="<c:url value="/resources/images/repost.png"/>"></td>
                <td><img src="<c:url value="/resources/images/positive.png"/>"></td>
                <td><img src="<c:url value="/resources/images/negative.png"/>"></td>
            </tr>
            <tr>
                <td>Количество<br>результатов</td>
                <td>Охват<br>аудитории</td>
                <td>Количество<br>лайков</td>
                <td>Количество<br>комментариев</td>
                <td>Количество<br>репостов</td>
                <td>Количество<br>позитивных<br>откликов</td>
                <td>Количество<br>негативных<br>откликов</td>
            </tr>
            <tr style="font-size: 24px; height: 55px; background-image: url(<c:url value="/resources/images/layer_158_copy_8.png"/>); background-position: center;
                    background-repeat: no-repeat;
                    background-size: contain;
                    vertical-align: bottom;">
                <td class="lownumbers" id="postnumup">0</td>
                <td class="lownumbers" id="ohvatnumup">0</td>
                <td class="lownumbers" id="likesnumup">0</td>
                <td class="lownumbers" id="commentsnumup">0</td>
                <td class="lownumbers" id="repostnumup">0</td>
                <td class="lownumbers" id="positivenumup">0</td>
                <td class="lownumbers" id="negativenumup">0</td>

            </tr>

        </table>

        <script>

            $.getJSON('<c:url value="/getalldatainfographics"/>', {}, function(infoall){  // загрузку JSON данных из

                console.log(infoall);

                document.getElementById('postnumup').innerHTML=infoall.postqty;
                document.getElementById('ohvatnumup').innerHTML=infoall.authorqty;
                document.getElementById('positivenumup').innerHTML=infoall.positiveqty;
                document.getElementById('negativenumup').innerHTML=infoall.negativeqty;
                document.getElementById('likenumup').innerHTML=infoall.likeqty;
                document.getElementById('repostnumup').innerHTML=infoall.repostqty;




            });
        </script>

        <table style=" margin-left: 8px;  margin-right: 8px; margin-top: 25px ">
            <tr style="border-width: 2px; border-color: #6f757f;">
                <td width="25%"><table  align="center" style="border: 1px solid #e0e0e8; border-color: #e0e0e8;">
                    <tr><td class="upperitemstable2">
                        <img style="position: relative; top: 10px; padding-left: 10px" src="<c:url value="/resources/images/texticon.png"/>">&nbsp;&nbsp;Текстовые сообщения</td></tr>
                    <tr><td style="color: #92cea5; font-size: 24px; background-color: #ffffff; height: 30px; width: 24%; margin-right: 1%; margin-left: 1%; text-align: center" id="textqty">0</td></tr></table>

                </td>

                <td width="25%"><table align="center"style="border: 1px solid #e0e0e8; border-color: #e0e0e8;">
                    <tr><td align="center" class="upperitemstable2">
                        <img style="position: relative; top: 10px; padding-left: 10px" src="<c:url value="/resources/images/picicon.png"/>">&nbsp;&nbsp;Изображения</td></tr>
                    <tr><td style="color: #92cea5; font-size: 24px; background-color: #ffffff; height: 30px; width: 24%; margin-right: 1%; margin-left: 1%; text-align: center" id="picqty">
                        0
                    </td></tr></table>

                </td>

                <td width="25%"><table align="center" style="border: 1px solid #e0e0e8; border-color: #e0e0e8;">
                    <tr><td align="center" class="upperitemstable2">
                        <img style="position: relative; top: 10px; padding-left: 10px" src="<c:url value="/resources/images/videpicon.png"/>">&nbsp;&nbsp;Видео файлы
                    </td></tr>
                    <tr><td style="color: #92cea5; font-size: 24px; background-color: #ffffff; height: 30px; width: 24%; margin-right: 1%; margin-left: 1%; text-align: center" id="videoqty">0</td></tr></table>

                </td>

                <td width="25%"><table align="center" style="border: 1px solid #e0e0e8; border-color: #e0e0e8;">
                    <tr><td align="center" valign="center" class="upperitemstable2" >
                        <img style="position: relative; top: 10px; padding-left: 10px" src="<c:url value="/resources/images/picicon.png"/>">&nbsp;&nbsp;Аудио файлы
                    </td></tr>
                    <tr><td style="color: #92cea5; font-size: 24px; background-color: #ffffff; height: 30px; width: 24%; margin-right: 1%; margin-left: 1%; text-align: center" id="audioqty">0</td></tr></table>

                </td>


            </tr>

        </table>

        </table>

        <div id="graphiclabel">&nbsp;&nbsp;ПОПУЛЯРНЫЕ АВТОРЫ</div>
        <div id="graphic">
            <script type="text/javascript">
                google.charts.load('current', {'packages':['table']});
                google.charts.setOnLoadCallback(drawTable);

                function drawTable() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string','№');
                    data.addColumn('string', 'Имя автора');
                    data.addColumn('string', 'Ресурс');
                    data.addColumn('string', 'Кол-во друзей');
                    data.addColumn('string', 'Город');
                    var temp = '';


                    $.getJSON('<c:url value="/top10users"/>', {}, function(json){  // загрузку JSON данных из
                        console.log('start!');
                        console.log(json);

                        for (var i=0;i<Object.keys(json).length;i++) {

                            data.addRow([temp+(i+1),json[i].name, json[i].link,
                                json[i].followers, json[i].city]);
                            data.setCell(i,0, temp+(i+1), null, {style: 'width:5%;'});
                            data.setCell(i,1, json[i].name, null, {style: 'width:45%;'});
                            //, json[i].commentqty, json[i].shareqty, json[i].likeqty]);
                        }
                        console.log(data);
                        //data.setCell(1,0, 'Fifteen', null, {style: 'font-style:bold; font-size:22px;'})
                        table = new google.visualization.Table(document.getElementById('graphic'));
                        table.draw(data, {alternatingRowStyle: true, allowHtml: true, showRowNumber: false, cssClassNames:{headerRow: 'classgraph1header',tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows1'}, width: '100%', height: '100%'});
                        console.log(data);





                    });
                    // console.log(data);
                    //   data.setCell(1,1,'erga');
                    //   table = new google.visualization.Table(document.getElementById('graphic'));


                    //     table.draw(data, {alternatingRowStyle: false, allowHtml: true, showRowNumber: true, cssClassNames:{headerRow: 'classgraph1header',tableRow: 'tableRowsClassCss'}, width: '100%', height: '100%'});



                }
            </script>

        </div>



        <div id="graphic2">
            <div id="graphic2left">

                <div id="graphic2label">&nbsp;&nbsp;ГОРЯЧИЕ ДАТЫ</div>
            <div id="graphic2leftg"> <script type="text/javascript">
                google.charts.load('current', {'packages':['table']});
                google.charts.setOnLoadCallback(drawTable);

                function drawTable() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string','№');
                    data.addColumn('string', 'Дата');
                    data.addColumn('string', 'Количество упоминаний');
                    data.addColumn('string', 'Ресурс');
                    var temp = '';
                    $.getJSON('<c:url value="/top10dates"/>', {}, function(json){  // загрузку JSON данных из
                        console.log('start!');
                        console.log(json);

                        for (var i=0;i<Object.keys(json).length;i++) {

                            data.addRow([temp+(i+1),json[i].date, json[i].postqty, json[i].source]);//, json[i].commentqty, json[i].shareqty, json[i].likeqty]);
                            data.setCell(i,0, temp+(i+1), null, {style: 'width:5%;'});

                        }
                        var table = new google.visualization.Table(document.getElementById('graphic2leftg'));

                        table.draw(data, {alternatingRowStyle: true, allowHtml: true, showRowNumber: false, cssClassNames:{headerRow: 'classgraph2header', tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows2'}});



                    });


                }
            </script></div></div>
            <div id="graphic2right">
                <div id="graphic2label2">&nbsp;&nbsp;ПОПУЛЯРНЫЕ РЕСУРСЫ</div>
                <div id="graphic2rightg">
                <script>
                    google.charts.load('current', {'packages':['table']});
                    google.charts.setOnLoadCallback(drawTable);

                    function drawTable() {
                        var data2 = new google.visualization.DataTable();
                        data2.addColumn('string','№');
                        data2.addColumn('string', 'Название ресурса');
                        data2.addColumn('string', 'Количество упоминаний');
                        var temp = '';

                        $.getJSON('<c:url value="/top10sources"/>', {}, function (json) {  // загрузку JSON данных из
                            console.log('start!');
                            console.log(json);

                            for (var i = 0; i < Object.keys(json).length; i++) {

                                data2.addRow([temp+(i+1),json[i].source, json[i].postqty]);//, json[i].commentqty, json[i].shareqty, json[i].likeqty]);
                                data2.setCell(i,0, temp+(i+1), null, {style: 'width:5%;'});
                            }
                            var table = new google.visualization.Table(document.getElementById('graphic2rightg'));

                            table.draw(data2, {
                                alternatingRowStyle: true,
                                allowHtml: true,
                                showRowNumber: false,
                                cssClassNames: {headerRow: 'classgraph3header', tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows3'}
                            });


                        });
                    }
                </script>
            </div>
            </div>



        </div>
        <div id="graphic3label">&nbsp;&nbsp;АКТИВНЫЕ ПОЛЬЗОВАТЕЛИ</div>
        <div id = "graphic3">
            <script type="text/javascript">
                google.charts.load('current', {'packages':['table']});
                google.charts.setOnLoadCallback(drawTable);
                function drawTable() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string','№');
                    data.addColumn('string', 'Имя пользователя');
                    data.addColumn('string', 'Упоминаний о бренде');
                    data.addColumn('string', 'Подписчики');
                    data.addColumn('string', 'Лайки');
                    data.addColumn('string', 'Репосты');
                    temp = "";
        /*            data.addRows([
                        ['1',"аукцион украина везунчик; )", "137", "6885", "183", "251" ],
                        ['2',"аукцион - купи-ка", "118", "1970", "81", "226" ],
                        ['3',"sun_shops", "96", "1260", "0","140"],
                        ['4',"купить ray-ban aviator украина", "92", "958", "16","237"],
                        ['5',"аукцион, монеты, боны, нумизматика, аукціон", "87", "6053", "53", "101"],
                        ['6',"kosherна bloxa  #нумізматика #антикваріат", "81", "2582", "14", "52"],
                        ['7',"аукціон блоха #аукціон #нумізматика #антикваріат", "77", "2251", "150", "245"],
                        ['8',"школа макияжа карины браги ♥makeup-planet.com.ua", "75", "23955", "121","217"],
                        ['9',"katrin κузьмина", "69", "983", "182", "192"],
                        ['10',"для-красивых-мам и-любимых-деток","69", "3362", "136", "857"]
                    ]);
     */
                    $.getJSON('<c:url value="/top10posts"/>', {}, function (json) {  // загрузку JSON данных из
                        console.log('start!');
                        console.log(json);

                        for (var i = 0; i < Object.keys(json).length; i++) {

                            data.addRow(['1', json[i].name, json[i].postqty, json[i].followers, json[i].likes, json[i].reposts]);
                            data.setCell(i, 0, '1', null, {style: 'width:5%;'});
                        }




                    var temp = '';
                    for (var i=0;i<Object.keys(json).length;i++){
                        data.setCell(i,0, temp+(i+1), null, {style: 'width:5%;'});
                        data.setCell(i,1,data.getValue(i,1), null, {style: 'width:45%; '});
                        data.setCell(i,2,data.getValue(i,2), null, {style: 'width:10%; '});
                        data.setCell(i,3,data.getValue(i,3), null, {style: 'width:10%; '});
                        data.setCell(i,4,data.getValue(i,4), null, {style: 'width:10%; '});
                    }

                    var table = new google.visualization.Table(document.getElementById('graphic3'));

                    table.draw(data, {alternatingRowStyle: true, allowHtml: true, showRowNumber: false, cssClassNames:{headerRow: 'classgraph4header', tableRow: 'tableRowsClassCss', oddTableRow : 'tableOddRows4' }});
                    });
                    }
            </script>



        </div>

    </div>


</div>

<script>

    $.getJSON('<c:url value="/getalldatainfographics"/>', {}, function(infoall){  // загрузку JSON данных из

        console.log(infoall);

        document.getElementById('postnumup').innerHTML=infoall.postqty;
        document.getElementById('textqty').innerHTML=infoall.postqty;
        document.getElementById('ohvatnumup').innerHTML=infoall.authorqty;
        document.getElementById('positivenumup').innerHTML=infoall.positiveqty;
        document.getElementById('negativenumup').innerHTML=infoall.negativeqty;
        document.getElementById('likenumup').innerHTML=infoall.likeqty;
        document.getElementById('repostnumup').innerHTML=infoall.repostqty;




    });
</script>

<script>

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

    $.getJSON('<c:url value="/accountsettings"/>', {}, function(useraccount){  // загрузку JSON данных из

        console.log(useraccount);

        document.getElementById('customername').innerHTML=useraccount[0];

        document.getElementById('lefttheme').innerHTML=useraccount[0];



    });


</script>

</body>

</html>