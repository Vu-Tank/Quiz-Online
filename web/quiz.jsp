<%-- 
    Document   : quiz
    Created on : Jan 30, 2021, 10:00:04 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>
        <script>
            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;
                var time = setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;

                    if (--timer < 0) {
                        clearInterval(time);
                        document.getElementById("timeout").innerHTML = "Time Out";
                        var button=document.getElementById("finish");
                        button.click();
                    }
                }, 1000);
            }

            window.onload = function () {
                var time = document.getElementById("time").innerHTML,
                        display = document.querySelector('#time');
                var timeArr = time.split(":");
                var duration = parseInt(timeArr[0]) * 60 + parseInt(timeArr[1]);

                startTimer(duration, display);
            };
        </script>
    </head>
    <body>
        <h1><font style="color: activecaption"> ${sessionScope.USER.fullName} </font></h1>
        <div id="timeout">Quiz closes in <span id="time" >${requestScope.m}:${requestScope.s}</span> minutes</div>

        <form action="doQuiz" method="POST">
            <div id="question">
                <c:set   var="question" value="${requestScope.question}"/>
                <p>${requestScope.questionIndex}.${question.questionName}</p>
                <c:forEach var="answer" items="${question.questionChoice}">
                    <c:if test="${question.userAnswer eq answer.choiceID}">
                        <input name="userAnswer" type="radio" value="${answer.choiceID}" checked="checked" />   ${answer.answer}</br></br>
                    </c:if>
                    <c:if test="${question.userAnswer ne answer.choiceID}">
                        <input name="userAnswer" type="radio" value="${answer.choiceID}" />   ${answer.answer}</br></br>
                    </c:if>
                </c:forEach> 
            </div>
                <div class="action">
                    <input type="hidden" name="questionIndexNow" value="${requestScope.questionIndex}" />
                    <input type="submit" value="previous" name="btnAction" />
                    <input type="submit" value="next" name="btnAction" />
                    <input type="submit" value="finish" name="btnAction" id="finish"/>
                </div>
            <div class="paging">
                <c:set var="endPage" value="${requestScope.questionEnd}"/>
                <c:if test="${endPage>1}">
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <input type="submit" value="${i}" name="questionIndex" />
                    </c:forEach>
                </c:if>
            </div>
        </form>
    </body>
</html>
