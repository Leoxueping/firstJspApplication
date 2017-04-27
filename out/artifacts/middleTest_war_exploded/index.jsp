<%--
  Created by IntelliJ IDEA.
  User: leon
  Date: 17-4-26
  Time: 下午4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="./css/bulma.css">
    <style>
        .container {
            display: flex;
            height: 100%;
            width: 100%;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .block .button {
            display: block;
            margin: 20px auto;
            width: 300px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="block">
            <div class="card">
                <div class="card-content">
                    <p>
                        姓名：黎学平
                    </p>
                    <p>
                        学号：6103114040
                    </p>
                    <p>
                        班级：计科141
                    </p>
                </div>
            </div>
            <a class="button is-primary" href="./add.jsp">点击添加学生信息</a>
            <a class="button is-primary" href="./show.jsp">点击查看学生信息</a>
        </div>
    </div>
</body>
</html>
