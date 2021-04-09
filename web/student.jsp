<%-- 
    Document   : student
    Created on : Jan 28, 2021, 11:52:26 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
    </head>
    <body>
        <h2> <font style="color: activecaption"> ${sessionScope.USER.fullName} </font> </h2>
        <div class="action" style="margin-right: auto;margin-left: auto">
            <a href="logout" style="text-decoration: none"> Logout </a>
            <a href="historyPage" style="text-decoration: none"> View History Quiz </a>
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.quiz}">
            <h3 style="color: red">You have not completed the quiz</h3>
            <form action="takeQuiz">
                <input type="hidden" name="numOfQuestion" value="${sessionScope.quiz.numOfQuestion}" />
                <input type="submit" value="Continue" />
            </form>
            <form action="doQuiz">
                <input type="hidden" name="questionIndexNow" value="1" />
                <input type="submit" value="finish" name="btnAction" />
            </form>
            </c:when>
            <c:otherwise>
                <div id="createQuiz">
                    <form action="takeQuiz">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Subject</td>
                                    <td>number of Question</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="subjectID">
                                            <c:forEach var="subject" items="${sessionScope.subjectList}">
                                                <option value="${pageScope.subject.subjectID}" <c:if test="${pageScope.subject.subjectID eq param.subjectID}"> selected=""</c:if> >${pageScope.subject.subjectName}</option>
                                            </c:forEach>    
                                        </select>
                                    </td>
                                    <td><input type="number" name="numOfQuestion" value="${param.numOfQuestion}" min="1"/></td>
                                    <td><input type="submit" value="Take Quiz" /></td>
                                </tr>
                            </tbody>
                        </table>     
                    </form>
                </div>
                <h2 style="color: red">${requestScope.message}</h2>
                <c:if test="${not empty requestScope.numOfCor}">
                    Number Of Question: ${requestScope.numOfQuestion}</br>
                    Number Of correct ${requestScope.numOfCor}</br>
                    Result: ${(requestScope.numOfCor/requestScope.numOfQuestion)*10}</br>
                </c:if>
            </c:otherwise>
        </c:choose>
    </body>
</html>
