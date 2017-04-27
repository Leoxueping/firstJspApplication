<%--
  Created by IntelliJ IDEA.
  User: leon
  Date: 17-4-26
  Time: 下午7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Service.Message" %>
<%@ page import="factory.DAOFactory" %>
<%@ page import="dao.StudentDao" %>
<%@ page import="pojo.Student" %>
<%
    request.setCharacterEncoding("utf-8");
    String deleteId = request.getParameter("id");
    String updateId = request.getParameter("updateId");
    Message message = new Message();
    StudentDao iEmpDAOInstance = DAOFactory.getIEmpDAOInstance();
    if (deleteId != null) {
        message = iEmpDAOInstance.deleteStudentById(deleteId);
    }
    if (updateId != null) {
        Student stu = new Student();
        stu.setStudentId(updateId);
        stu.setStudentMajor(request.getParameter("student_major"));
        stu.setStudentName(request.getParameter("student_name"));
        stu.setStudentSex(request.getParameter("student_sex"));
        message = iEmpDAOInstance.updateStudent(stu);
    }
%>
<html>
<head>
    <title>结果</title>
    <link rel="stylesheet" type="text/css" href="./css/bulma.css">
</head>
<body>
    <div style="text-align: center;padding: 50px;">
        <%=message.getMessage()%>
        <a style="display: block" class="button is-success is-inverted" href="./show.jsp">返回信息查看页</a>
    </div>

</body>
</html>
