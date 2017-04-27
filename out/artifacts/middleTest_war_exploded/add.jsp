<%--
  Created by IntelliJ IDEA.
  User: leon
  Date: 17/4/18
  Time: 下午3:17
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
//    StudentDao test = DAOFactory.getIEmpDAOInstance();
//    Student student = new Student();
//    student.setStudentName("黎学平");
//    student.setStudentMajor("计科141");
//    Message res = test.addStudent(student);
%>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="./css/bulma.css">
    <style type="text/css">
        .container {
            width: 50%;
            padding-top: 100px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="show.jsp" method="post" onsubmit="return submitForm()">
            <div class="field">
                <p class="control has-icons-left">
                    <input class="input" name="student_name" type="text" placeholder="姓名">
                    <span class="icon is-small is-left">
                      <i class="fa fa-envelope"></i>
                    </span>
                </p>
            </div>
            <div class="field">
                <p class="control">
                    <label class="radio">
                        <input checked type="radio" value="男" name="student_sex">
                        男
                    </label>
                    <label class="radio">
                        <input type="radio" value="女" name="student_sex">
                        女
                    </label>
                </p>
            </div>
            <div class="field">
                <p class="control has-icons-left">
                    <input class="input" name="student_id" type="text" placeholder="学号">
                </p>
            </div>
            <div class="field">
                <p class="control has-icons-left">
                    <input class="input" name="student_major" type="text" placeholder="专业">
                </p>
            </div>
            <%--<div class="field">--%>
                <%--<p class="control has-icons-left">--%>
                    <%--<input class="input" type="password" placeholder="密码">--%>
                    <%--<span class="icon is-small is-left">--%>
                      <%--<i class="fa fa-lock"></i>--%>
                    <%--</span>--%>
                <%--</p>--%>
            <%--</div>--%>
            <div class="field">
                <p class="control">
                    <button class="button is-success" type="submit">
                        注册
                    </button>
                    <button type="reset" class="button is-link">重置</button>
                </p>
            </div>
            <input hidden value="register" name="register">
        </form>
    </div>
</body>
<script type="text/javascript">
    var submitForm = function() {
        var inputs = document.getElementsByTagName('input');
        var names = {
            student_name: '姓名',
            student_sex: '性别',
            student_id: '学号',
            student_major: '专业'
        };
        for (var i = 0; i < inputs.length; i ++) {
            if(inputs[i].value == '') {
                alert('请输入' + names[inputs[i].name]);
                return false;
            }
        }
        return true;
    }
</script>
</html>
