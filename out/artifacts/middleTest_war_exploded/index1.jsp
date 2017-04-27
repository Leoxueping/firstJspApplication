<%--
  Created by IntelliJ IDEA.
  User: leon
  Date: 17/4/17
  Time: 下午5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.StudentDao" %>
<%@ page import="factory.DAOFactory" %>
<%@ page import="pojo.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.Message" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>--%>

<%
    StudentDao test = DAOFactory.getIEmpDAOInstance();
    Student student = new Student();
    student.setStudentId("ED89099DDNNDILL");
    student.setStudentName("黎学平");
    student.setStudentMajor("计科141");
    Message res = test.addStudent(student);

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    application.setAttribute("basePath", basePath);
%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="./css/bulma.css">
    <style type="text/css">
        form {
            width: 300px;
            margin: 0 auto;
            padding: 30px;
            box-shadow: 0px 1px 8px 1.5px rgba(0, 0, 0, 0.25),
                        0px 20px 70px 8px rgba(0, 0, 0, 0.05);
            border-radius: 3px;
            position: relative;
            z-index: 1;
        }
        form:after{
            content: "";
            background-image: url("./images/73.jpg");
            background-size: 100% 100%;
            background-attachment: fixed;
            background-repeat: no-repeat;
            filter: blur(5px);
            z-index: -1;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
        }
        .body {
            background-image: url("./images/73.jpg");
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            height:100%;
            width: 100%;
            padding-top: 150px;
        }

    </style>
</head>
    <body>
        <%--<%=all.get(0).getStudentName()%>--%>
        <%--<%=all.get(0).getStudentId()%>--%>
        <%--<%=all.get(0).getStudentMajor()%>--%>
        <%--<%=res.getMessage()%>--%>
        <div class="body">
            <form action="show.jsp" method="post">
                <div class="field">
                    <p class="control has-icons-left">
                        <input class="input" type="email" placeholder="学号">
                        <span class="icon is-small is-left">
                      <i class="fa fa-envelope"></i>
                    </span>
                    </p>
                </div>
                <div class="field">
                    <p class="control has-icons-left">
                        <input class="input" type="password" placeholder="密码">
                        <span class="icon is-small is-left">
                      <i class="fa fa-lock"></i>
                    </span>
                    </p>
                </div>
                <div class="field">
                    <p class="control" style="text-align: right;">
                        <button class="button is-success">
                            登录
                        </button>
                        <a class="button is-link" href="./register.jsp">
                            去注册
                        </a>
                    </p>
                    <p class="control">

                    </p>
                </div>
            </form>
        </div>
    </body>
</html>
