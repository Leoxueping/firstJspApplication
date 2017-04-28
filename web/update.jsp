<%--
  Created by IntelliJ IDEA.
  User: leon
  Date: 17-4-26
  Time: 下午5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.StudentDao" %>
<%@ page import="factory.DAOFactory" %>
<%@ page import="pojo.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.Message" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Student stu = null;
    request.setCharacterEncoding("utf-8");
    StudentDao iEmpDAOInstance = DAOFactory.getIEmpDAOInstance();
    String updateId = request.getParameter("id");
    stu = iEmpDAOInstance.findStudentById(updateId);
    pageContext.setAttribute("stu", stu);

%>

<html>
<head>
    <title>修改信息</title>
    <link rel="stylesheet" type="text/css" href="./css/bulma.css">
    <style>
        .container {
            width: 50%;
            padding-top: 100px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">修改信息</h1>
        <form action="result.jsp" method="post">
            <div class="field">
                <p class="control has-icons-left">
                    <input class="input" value="${stu.getStudentName()}" name="student_name" type="text" placeholder="姓名">
                </p>
            </div>
            <div class="field">
                <p class="control">
                    <label class="radio">
                        <input checked="${stu.getStudentSex()=="男"}" type="radio" value="男" name="student_sex">
                        男
                    </label>
                    <label class="radio">
                        <input checked="${stu.getStudentSex()=="女"}" type="radio" value="女" name="student_sex">
                        女
                    </label>
                </p>
            </div>
            <div class="field">
                <p class="control has-icons-left">
                    <input class="input" value="${stu.getStudentId()}" disabled name="student_id" type="text" placeholder="学号">
                </p>
            </div>
            <div class="field">
                <p class="control has-icons-left">
                    <input class="input" value="${stu.getStudentMajor()}" name="student_major" type="text" placeholder="专业">
                </p>
            </div>
            <div class="field">
                <p class="control">
                    <button class="button is-success" type="submit">
                        确认修改
                    </button>
                    <button type="reset" class="button is-link">恢复</button>
                </p>
            </div>
            <input hidden name="updateId" value="<%=updateId%>">
        </form>
    </div>
</body>
</html>
