<%-- 
    Document   : update
    Created on : Jan 29, 2021, 8:52:41 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1>Update Question</h1>
        <div class="action" style="margin-right: auto;margin-left: auto">
            <a href="adminPage" style="text-decoration: none"> Home </a>
            <a href="logout" style="text-decoration: none"> Logout </a>
        </div>
        <c:set var="subjects" value="${sessionScope.subjectList}"/>
        <c:set var="answers" value="${requestScope.answers}"/>
        <c:if test="${not empty answers}">
            <h2 style="color: red"> 
                ${requestScope.message}
            </h2>
            <form action="Update" method="POST">

                <table border="0">
                    <tbody>
                        <tr>
                            <td>Subject</td>
                            <td>
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
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Question:</td>
                            <td><input type="text" name="txtQuestion" value="${txtQuestion}" size="100" maxlength="8000"/></td>
                            <td>IsRight</td>
                        </tr>
                        <c:forEach var="answer" items="${answers}">
                            <tr>
                                <td>Answer</td>
                                <td>
                                    <input type="text" name="txtAnswer" value="${answer.answer}" size="100" maxlength="8000"/>
                                    <input type="hidden" name="txtChoiceID" value="${answer.choiceID}" />
                                </td>
                                <td>
                                    <c:if test="${answer.isRight == true}">
                                        <input name="isRight" type="radio" value="${answer.choiceID}" checked="checked" />
                                    </c:if>
                                    <c:if test="${answer.isRight == false}">
                                        <input name="isRight" type="radio" value="${answer.choiceID}" />
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>Status</td>
                            <td>
                                <select name="cbxStatus">
                                    <c:if test="${requestScope.cbxStatus ==true}">
                                        <option value="false" >Activate</option>
                                        <option value="true"  selected="">Deactivate</option>                                            
                                    </c:if>
                                    <c:if test="${requestScope.cbxStatus ==false}">
                                        <option value="false" selected="" >Activate</option>
                                        <option value="true"  >Deactivate</option>                                            
                                    </c:if>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <input type="hidden" name="txtQuestionID" value="${requestScope.txtQuestionID}" />
                <input type="submit" value="Save" />
            </form>
        </c:if>
        <c:if test="${empty answers}">
            <h2 style="color: red">please visit sequentially</h2>
        </c:if>
            <c:set var="nameT" value="nameType"/>
        <c:url var="cancel" value="search">
            <c:param name="typeSearch" value="${sessionScope.typeSearch}"/>
            <c:if test="${typeSearch eq nameT}">
                <c:param name="txtSearch" value="${sessionScope.txtSearch}"/>
                <c:param name="dataSearch" value="${sessionScope.txtSearch}"/>
            </c:if>
            <c:if test="${typeSearch ne nameT}">
                <c:param name="dataSearch" value="${sessionScope.dataSearch}"/>
            </c:if>
            <c:param name="pageIndex" value="${sessionScope.pageIndex}"/>
        </c:url>
        <a href="${cancel}"> Cancel</a>
    </body>
</html>
