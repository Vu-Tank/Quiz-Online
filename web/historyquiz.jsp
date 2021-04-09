<%-- 
    Document   : historyquiz
    Created on : Jan 31, 2021, 10:51:11 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
    </head>
    <body>
        <h2> <font style="color: activecaption"> ${sessionScope.USER.fullName} </font> </h2>
        <div class="action" style="margin-right: auto;margin-left: auto">
            <a href="studentPage" style="text-decoration: none"> Home </a>
            <a href="logout" style="text-decoration: none"> Logout </a>            
        </div>
        <div class="search">
            <c:set var="subjects" value="${sessionScope.subjectList}"/>
            <form action="viewhistory">
                <select name="dataSearch">
                    <c:forEach var="subject" items="${subjects}">
                        <c:choose>
                            <c:when test="${pageScope.subject.subjectID eq sessionScope.dataSearch}">
                                <option value="${pageScope.subject.subjectID}" selected="">${pageScope.subject.subjectName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${pageScope.subject.subjectID}" >${pageScope.subject.subjectName}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <input type="submit" value="Search" />
            </form>
        </div>
        <div class="result">
            <c:choose>
                <c:when test="${not empty sessionScope.quizs}">
                    <c:set var="quizs" value="${sessionScope.quizs}"></c:set>
                        <div class="data">
                            <table border="1">
                                <tbody>
                                    <tr>
                                        <td>No</td>
                                        <td>Date</td>
                                        <td>Number Of Question</td>
                                        <td>Number Of Correct</td>
                                        <td>Mark</td>
                                        <td>Status</td>
                                    </tr>
                                <c:forEach var="quiz" items="${quizs}" varStatus="counter">
                                    <tr>
                                        <td>${((sessionScope.pageSize*sessionScope.pageIndex)-sessionScope.pageSize) + (counter.count)}</td>
                                        <td>${quiz.quizDate}</td>
                                        <td>${quiz.numOfQuestion}</td>
                                        <td>${quiz.numOfCorrect}</td>
                                        <td>${quiz.numOfCorrect/quiz.numOfQuestion*10}</td>
                                        <td>${quiz.status}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div> 
                    <div class="paging">
                    <c:set var="endPage" value="${sessionScope.pageEnd}"/>
                        <c:if test="${endPage>1}">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <c:url var="paging" value="viewhistory">
                                    <c:param name="dataSearch" value="${sessionScope.dataSearch}"/>
                                    <c:param name="pageIndex" value="${i}"/>
                                </c:url>
                                <a href="${paging}" >${i}</a>
                            </c:forEach>
                        </c:if>
                    </div>
                </c:when>
                <c:otherwise>
                    <h2> Result:0 </h2>
                </c:otherwise>
            </c:choose>          
        </div>
    </body>
</html>
