<%-- 
    Document   : createquestion
    Created on : Jan 28, 2021, 12:55:37 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Question Page</title>
    </head>
    <body>
        <div class="action" style="margin-right: auto;margin-left: auto">
            <a href="adminPage" style="text-decoration: none"> Home </a>
            <a href="logout" style="text-decoration: none"> Logout </a>
        </div>
        <c:set var="subjects" value="${sessionScope.subjectList}"/>
        <form action="createquestion" method="Post">
            <select name="cbxsubject">
                <c:forEach var="subject" items="${subjects}">
                    <c:choose>
                        <c:when test="${pageScope.subject.subjectID eq requestScope.cbxsubject}">
                            <option value="${pageScope.subject.subjectID}" selected="">${pageScope.subject.subjectName}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${pageScope.subject.subjectID}" >${pageScope.subject.subjectName}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select></br>
            <table border="1">
                <tbody>
                    <tr>
                        <td>Question:</td>
                        <td><input type="text" name="txtQuestion" value="${param.txtQuestion}" size="100" /></td>
                        <td><font style="color: red">${requestScope.questionError}</font></td>
                    </tr>
                    <tr>
                        <td>Answer Correct:</td>
                        <td><input type="text" name="txtAnswerCorrect" value="${param.txtAnswerCorrect}" size="100" /></td>
                        <td><font style="color: red">${requestScope.answerCorrectError}</font></td>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><input type="text" name="txtAnswer1" value="${param.txtAnswer1}" size="100" /></td>
                        <td><font style="color: red">${requestScope.answer1Error}</font></td>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><input type="text" name="txtAnswer2" value="${param.txtAnswer2}" size="100" /></td>
                        <td><font style="color: red">${requestScope.answer2Error}</font></td>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><input type="text" name="txtAnswer3" value="${param.txtAnswer3}" size="100" /></td>
                        <td><font style="color: red">${requestScope.answer3Error}</font></td>
                    </tr>
                </tbody>
            </table>
                    <div class="button">
                        <input type="submit" value="Create" />
                        <input type="reset" value="Reset" />
                    </div>
        </form>
    </body>
</html>
