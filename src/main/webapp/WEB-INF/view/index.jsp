<%@ page import="ua.com.danserhiy.idol.Connect.RecordItem" %>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Cabinet</jsp:attribute>


    <jsp:body>


        <script type="text/javascript" src="jquery.js"></script>
        <script>

            $(function(){
                $('#test_form').submit(function(e){
//отменяем стандартное действие при отправке формы
                    e.preventDefault();
//берем из формы метод передачи данных
                    var m_method=$(this).attr('method');
//получаем адрес скрипта на сервере, куда нужно отправить форму
                    var m_action=$(this).attr('action');
//получаем данные, введенные пользователем в формате input1=value1&input2=value2...,
//то есть в стандартном формате передачи данных формы
                    var m_data=$(this).serialize();
                    $.ajax({
                        type: m_method,
                        url: m_action,
                        data: m_data,
                        success: function(json){


                                console.log(json);
                                var div = document.getElementById('resultsset');
                                div.innerHTML='';
                                for (var i=0;i<5;i++) {
                                    div.innerHTML = div.innerHTML + '<br>new one' + i+ '<br><br>' + json[i].link;

                                }}}
                            );

                        }
                );
            }

                );



        </script>
        <div id="leftcol" style=
                "float: left;
            background: #f0f0f0;
            width: 25%;
            height: 95%;">Левая колонка</div>
        <div id="centercol" style="float: left;
            background: #fc0;
            width: 50%;
            height: 95%;">
            <form action="/gettextquery" method="GET" id="test_form">
                <p style="font-family: Verdana; font-size: 11px;">Input text</p>
                <input type="text" style="background: #b3ff3e" name="text" id="text">
                <input type="submit" value="Отправить" />

            </form>
            <div id="facebookcount" style="background-color: #bce8f1; width: 12%; float: left; position: relative; top: 5%;min-height: 40px;margin: 1px;">FB</div>
            <div id="twittercount" style="background-color: #bce8f1; width: 12%; float: left; position: relative; top: 5%;min-height: 40px;margin: 1px;">TWI</div>
            <div id="vkcount" style="background-color: #bce8f1; width: 12%; float: left; position: relative; top: 5%;min-height: 40px;margin: 1px;">VK</div>
            <div id="webcount" style="background-color: #bce8f1; width: 12%; float: left; position: relative; top: 5%;min-height: 40px;margin: 1px;">WEB</div>
            <div id="results">drsawd</div>






            центральная колонка

<div id="resultsset">
    <button id="getresults"> test get results</button>
    <script>



        $(document).ready(function(){                            // по завершению загрузки страницы
            $('#getresults').click(function(){                    // вешаем на клик по элементу с id = example-4
                $.getJSON('/getresults', {}, function(json){  // загрузку JSON данных из файла example.json

                    console.log(json);
                    var div = document.getElementById('resultsset');
                    for (var i=0;i<5;i++) {
                        div.innerHTML = div.innerHTML + '<br><br><br>' + json[i].link;

                    }
                });
            })

            $('#pageBackward').click(function(){                    // вешаем на клик по элементу с id = example-4
                $.getJSON('/pages?movement=-1', {}, function(json){  // загрузку JSON данных из файла example.json

                    console.log(json);
                    var div = document.getElementById('resultsset');
                    for (var i=0;i<5;i++) {
                        div.innerHTML = div.innerHTML + '<br><br><br>' + json[i].link;

                    }
                });
            })

            $('#pageForward').click(function(){                    // вешаем на клик по элементу с id = example-4
                $.getJSON('/pages?movement=1', {}, function(json){  // загрузку JSON данных из файла example.json

                    console.log(json);
                    var div = document.getElementById('resultsset');
                    for (var i=0;i<5;i++) {
                        div.innerHTML = div.innerHTML + '<br><br><br>' + json[i].link;

                    }
                });
            })
        });

    </script>




</div>


        </div>



        <div id="rightcol" style="float: left;
        background: #aacc00;
        width: 25%;
        height: 95%;">

            <script>

                $(function(){
                    $('#settingsForm').submit(function(e){
//отменяем стандартное действие при отправке формы
                        e.preventDefault();
//берем из формы метод передачи данных
                        var m_method=$(this).attr('method');
//получаем адрес скрипта на сервере, куда нужно отправить форму
                        var m_action=$(this).attr('action');
//получаем данные, введенные пользователем в формате input1=value1&input2=value2...,
//то есть в стандартном формате передачи данных формы
                        var m_data=$(this).serialize();
                        $.ajax({
                            type: m_method,
                            url: m_action,
                            data: m_data,
                            success: function(result){
                                alert("!!!");

                            }
                        });
                    });
                });


            </script>
        <form action="/aci" method="get" id="settingsForm">

            <p style="font-family: Verdana; font-size: 11px;">Date</p>


            <input type="date" name="dateQuery">
            <br>
            <p style="font-family: Verdana; font-size: 11px;">Source Type</p>
            <select name="source">
                <option value=""></option>
                <option value="Facebook">Facebook</option>
                <option value="VKONTAKTE">Vkontakte</option>
                <option value="Twitter">Twitter</option>
                <option value="Web">Web</option>
            </select>
            <br>
            <p style="font-family: Verdana; font-size: 11px;">Post Type</p>
            <select name="posttype">
                <option value=""></option>
                <option value="Post">Post</option>
                <option value="Like">Like</option>
                <option value="Shared">Shared</option>
                <option value="Comment">Comment</option>
            </select>

            <p style="font-family: Verdana; font-size: 11px;">Vibes</p>
            <select name="vibe">
                <option value=""></option>
                <option value="Positive">Positive</option>
                <option value="Neutral">Neutral</option>
                <option value="Negative">Negative</option>
            </select>

            <p style="font-family: Verdana; font-size: 11px;">Language</p>
            <select name="language">
                <option value=""></option>
                <option value="English">English</option>
                <option value="Russian">Russian</option>
                <option value="Ukrainian">Ukrainian</option>
            </select>

            <br>

            <input type="submit">
        </form></div>


    </jsp:body>

</page:template>
