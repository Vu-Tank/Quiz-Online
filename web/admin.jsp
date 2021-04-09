<%-- 
    Document   : admin
    Created on : Jan 28, 2021, 7:49:57 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $("input[value='subjectType']").click(function () {
                    $("#subject").show();
                    $("#name").hide();
                    $("#status").hide();
                })
                $("input[value='nameType']").click(function () {
                    $("#name").show();
                    $("#subject").hide();
                    $("#status").hide();
                })
                $("input[value='statusType']").click(function () {
                    $("#status").show();
                    $("#name").hide();
                    $("#subject").hide();
                })
            })
        </script>
    </head>
    <body>
        <h2> <font style="color: activecaption"> ${sessionScope.USER.fullName} </font> </h2>
        <div class="action" style="margin-right: auto;margin-left: auto">
            <a href="createPage" style="text-decoration: none"> Create Question </a>
            <a href="logout" style="text-decoration: none"> Logout </a>
        </div>
        <div class="search">
            <c:set var="subjects" value="${sessionScope.subjectList}"/>
            <c:set var="subT" value="subjectType"/>
            <c:set var="nameT" value="nameType"/>
            <c:set var="stusT" value="statusType"/>           
            <c:if test="${requestScope.typeSearch eq subT}">
                <p><input type="radio" name="typeSearch" value="subjectType" checked=""> Subject</p>
                </c:if>
                <c:if test="${requestScope.typeSearch ne subT}">
                <p><input type="radio" name="typeSearch" value="subjectType"> Subject</p>
                </c:if>
                <c:if test="${requestScope.typeSearch eq nameT}">
                <p><input type="radio" name="typeSearch" value="nameType" checked=""> Question Name</p>
                </c:if>
                <c:if test="${requestScope.typeSearch ne nameT}">
                <p><input type="radio" name="typeSearch" value="nameType"> Question Name</p>
                </c:if>
                <c:if test="${requestScope.typeSearch eq stusT}">
                <p><input type="radio" name="typeSearch" value="statusType" checked=""> Status</p>
                </c:if>
                <c:if test="${requestScope.typeSearch ne stusT}">
                <p><input type="radio" name="typeSearch" value="statusType"> Status</p>
                </c:if> 
            <div id="subject" style="display: none">
                <form action="search">
                    <select name="dataSearch">
                        <option value="all">All</option>
                        <c:forEach var="subject" items="${subjects}">
                            <c:choose>
                                <c:when test="${pageScope.subject.subjectID eq requestScope.dataSearch}">
                                    <option value="${pageScope.subject.subjectID}" selected="">${pageScope.subject.subjectName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${pageScope.subject.subjectID}" >${pageScope.subject.subjectName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="typeSearch" value="${subT}" />
                    <input type="submit" value="Search" />
                </form>
            </div>
            <div id="name" style="display: none">
                <form action="search">
                    <input type="hidden" name="typeSearch" value="${nameT}" />
                    <input type="text" name="dataSearch" value="${txtSearch}" size="50" maxlength="8000"/>
                    <input type="submit" value="Search" />
                </form>
            </div>
            <div id="status" style="display: none">
                <form action="search">
                    <select name="dataSearch">
                        <c:set var="t" value="true"/>
                        <c:set var="f" value="false"/>
                        <c:choose>
                            <c:when test="${requestScope.dataSearch eq t}">
                                <option value="all">All</option>
                                <option value="false" >Activate</option>
                                <option value="true"  selected="">Deactivate</option>                                            
                            </c:when>
                            <c:when test="${requestScope.dataSearch eq f}">
                                <option value="all">All</option>
                                <option value="false" selected="" >Activate</option>
                                <option value="true"  >Deactivate</option>                                            
                            </c:when>
                            <c:otherwise>
                                <option value="all" selected="">All</option>
                                <option value="false">Activate</option>
                                <option value="true"  >Deactivate</option>  
                            </c:otherwise>
                        </c:choose>
                    </select>
                        <input type="hidden" name="typeSearch" value="${stusT}" />
                    <input type="submit" value="Search" />
                </form>
            </div>
        </div>
        <h3>${requestScope.message}</h3>
        <c:set var="QuestionList" value="${requestScope.QuestionS}"/>
        <c:if test="${not empty QuestionList}">
            <div class="question">
                <table border="1" style="width: 100%">
                    <tbody>
                        <tr>
                            <td>No</td>
                            <td colspan="4" style="text-align: center">Question</td>
                        </tr>
                        <c:set var="count" value="${0}"/>
                        <c:set var="subj" value="all"/>
                        <c:forEach var="question" items="${QuestionList}">
                            <c:set var="count" value="${count +1}"/>
                            <tr>
                                <td colspan="5" style="text-align: center">
                                    <c:if test="${question.subjectID ne subj}">
                                        <h3>${question.subjectID}</h3>
                                        <c:set var="subj" value="${question.subjectID}"/>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>${requestScope.pageSize*requestScope.pageIndex-(requestScope.pageSize-count)}</td>
                                <td>${question.questionName}</td>
                                <td>
                                    <c:if test="${question.status == false}">
                                        <font>Activate</font>
                                    </c:if>
                                    <c:if test="${question.status == true}">
                                        <font>Deactivate</font>
                                    </c:if>
                                </td>
                                <td style="width: 100px;text-align: center">
                                    <form action="updateStatus">
                                        <input type="hidden" name="dataSearch" value="${param.dataSearch}" />
                                        <input type="hidden" name="typeSearch" value="${param.typeSearch}" />
                                        <input type="hidden" name="pageIndex" value="${requestScope.pageIndex}" />
                                        <c:choose>
                                            <c:when test="${question.status == false}">
                                                <input type="hidden" name="txtQuestionID" value="${question.questionID}" />
                                                <input type="hidden" name="txtstatus" value="${question.status}" />
                                                <input type="submit" value="Delete" onclick="return confirm('Do you want to delete ?')" />
                                            </c:when>
                                            <c:otherwise>                                        
                                                <input type="hidden" name="txtQuestionID" value="${question.questionID}" />
                                                <input type="hidden" name="txtstatus" value="${question.status}" />
                                                <input type="submit" value="Activate" />
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </td>
                                <td style="width: 100px;text-align: center">
                                    <form action="UpdateView" method="POST">
                                        <input type="hidden" name="txtQuestionID" value="${question.questionID}" />
                                        <input type="submit" value="Update" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <div class="answers" style="margin-left: 100px">
                                        <c:set var="answers" value="${question.questionChoice}"/>
                                        <c:forEach var="answer" items="${answers}" varStatus="counter">
                                            <c:choose>
                                                <c:when test="${answer.isRight}">
                                                    <h3><font style="background-color: chartreuse">${counter.count}.${answer.answer}</font></h3>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <h3><font>${counter.count}.${answer.answer}</font></h3>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty QuestionList}">
            <h2> Result:0 </h2>
        </c:if>
        <div class="paging">
            <c:set var="endPage" value="${requestScope.pageEnd}"/>
            <c:if test="${endPage>1}">
                <c:forEach begin="1" end="${endPage}" var="i">
                    <c:url var="paging" value="search">
                        <c:param name="dataSearch" value="${param.dataSearch}"/>
                        <c:param name="typeSearch" value="${param.typeSearch}"/>
                        <c:param name="pageIndex" value="${i}"/>
                    </c:url>
                    <a href="${paging}" >${i}</a>
                </c:forEach>
            </c:if>
        </div>
    </body>
</html>
