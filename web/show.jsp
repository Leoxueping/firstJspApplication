<%--
  Created by IntelliJ IDEA.
  User: leon
  Date: 17/4/18
  Time: 下午3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%@ page import="dao.StudentDao" %>
<%@ page import="factory.DAOFactory" %>
<%@ page import="pojo.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.Message" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");
//    int currentPage = session.getAttribute("currentPage") != null ? Integer.parseInt(session.getAttribute("currentPage").toString()) : 1;
//    boolean isRegister = request.getParameter("register") != null;
//    String deleteId = request.getParameter("id");
    StudentDao test = DAOFactory.getIEmpDAOInstance();
//    Message res = null;
//    int currentPage = 1;
    int pageSize = 8;
//    List<Student> all = test.findAllByPage(currentPage, pageSize);
    int allLength = test.findAll().size();
//    pageContext.setAttribute("res", res);
//    pageContext.setAttribute("all", all);

%>
<html>
<head>
    <title>展示</title>
    <link rel="stylesheet" type="text/css" href="./css/bulma.css">
</head>
<body>

    <div class="container">
        <h2 style="margin: 20px auto; text-align: center;">所有信息</h2>

        <div class="field has-addons">
            <p class="control">
                <input class="input" id="searchCondition" type="text" placeholder="搜索">
            </p>
            <p class="control">
                <span class="select">
                    <select id="searchType">
                        <option value="student_name">姓名</option>
                        <option value="student_id">学号</option>
                        <option value="student_major">专业</option>
                    </select>
                </span>
            </p>
            <p class="control">
                <a class="button is-info" onclick="searchInfo()">
                    搜索
                </a>
            </p>
            <div style="position: absolute; right: 0;">
                <a href="./add.jsp" class="button is-primary is-link is-inverted subtitle">去添加</a>
            </div>
        </div>

        <table class="table is-striped">
            <thead>
            <tr>
                <th>姓名</th>
                <th>性别</th>
                <th>学号</th>
                <th>专业</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody">
                <c:forEach var="stu" items="${all}" varStatus="stus">
                    <tr>
                        <td>
                            <c:out value="${stu.getStudentName()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${stu.getStudentSex()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${stu.getStudentId()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${stu.getStudentMajor()}"></c:out>
                        </td>
                        <td>
                            <a class="button is-primary is-outlined" href="update.jsp?id=${stu.getStudentId()}">修改</a>
                            <a class="button is-danger is-outlined" onclick="showModel(${stu.getStudentId()})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <nav id="myPagination" class="pagination is-centered" style="margin: 20px auto;">
            <a class="pagination-previous" id="firstPage" onclick="toFirstPage(this)">首页</a>
            <a class="pagination-next" id="lastPage" onclick="toLastPage(this)">尾页</a>
            <ul class="pagination-list">
                <li><a class="pagination-link" id="prevPage" onclick="toPrevPage()">前一页</a></li>
                <li><a class="pagination-link" id="nextPage" onclick="toNextPage()">下一页</a></li>
            </ul>
        </nav>
        <button id="backToShowAll" style="display:none; color: #00d1b2; width: 100%;" class="button is-link subtitle" onclick="backToShowAll()">返回</button>
    </div>

    <div id="model" class="modal">
        <div class="modal-background"></div>
        <div class="card" style="padding: 20px;width:400px;border-radius: 3px;">
            <div class="card-content">
                确定删除吗？
            </div>
            <div style="text-align: right">
                <a class="button is-danger is-small" onclick="confirmDelete()">确定</a>
                <a class="button is-small" onclick="hiddenModel()">取消</a>
            </div>

        </div>
    </div>
</body>
<script type="text/javascript">

    var domain = window.location.host.split(':')[0];
    console.log(domain)

    var showModel = function (id) {
        document.getElementById('model').style.display = "flex";
        window.deleteId = id;
    }
    var hiddenModel = function () {
        document.getElementById('model').style.display = "none";
    }
    var confirmDelete = function () {
        window.location.href="/result.jsp?id=" + window.deleteId;
    }

//    分页
    var currentPage = sessionStorage.currentPage ? parseInt(sessionStorage.currentPage) : 1;

    var showPages = 5;//显示的页码数
    var pageLength = <%=Math.ceil((float)allLength/pageSize)%>;//总共页面数
    var prevPage = document.getElementById('prevPage');
    var nextPage = document.getElementById('nextPage');
    var firstPage = document.getElementById('firstPage');
    var lastPage = document.getElementById('lastPage');
    var realLength = pageLength < showPages ? pageLength : showPages;

    //生成分页dom
    function insertDom () {
        var elems = '';
        for (var i = 0; i < realLength; i ++) {
            elems += '<li><a class="pagination-link" name="myPaginationLink" onclick="goPage(this)">' + (i + 1) + '</a></li>';
        }
        prevPage.parentNode.insertAdjacentHTML('afterend', elems);
    }
    insertDom()

    var paginationLinks = document.getElementsByName('myPaginationLink');
    paginationLinks[currentPage - 1].className = 'pagination-link is-current';

    if (currentPage == pageLength) {
        nextPage.setAttribute('disabled', true);
        lastPage.setAttribute('disabled', true);
    }

    if (currentPage == 1) {
        prevPage.setAttribute('disabled', true);
        firstPage.setAttribute('disabled', true);
    }

    var traverseChangeClassName = function (currentPage, changeIndex) {
        var storeCurrentPage = currentPage;
        paginationLinks[changeIndex].className = 'pagination-link is-current';
        paginationLinks[changeIndex].innerText = currentPage;
        for (var i = changeIndex - 1; i >= 0; i --) {
            paginationLinks[i].innerText = -- currentPage;
            paginationLinks[i].className = 'pagination-link';
        }
        currentPage = storeCurrentPage;
        for (var i = changeIndex + 1; i < realLength; i++) {
            paginationLinks[i].innerText = ++ currentPage;
            paginationLinks[i].className = 'pagination-link';
        }
        return storeCurrentPage;
    }

    var toNextPage = function () {
        currentPage ++;
        prevPage.removeAttribute('disabled');
        firstPage.removeAttribute('disabled');
        getStudent();
        if (currentPage == pageLength) {
            nextPage.setAttribute('disabled', true);
            lastPage.setAttribute('disabled', true);
        }
        if(pageLength > showPages) {
            var currentIndex = 0;
            for (var i = 0; i < realLength; i ++) {
                if (paginationLinks[i].className == 'pagination-link is-current') {
                    currentIndex = i;
                }
            }

            var centerIndex = parseInt(showPages/2);

            if(pageLength - currentPage + 1 > centerIndex && currentIndex >= centerIndex){
                traverseChangeClassName(currentPage, centerIndex);
                return;
            }

            if(currentIndex > centerIndex &&
                pageLength - parseInt(paginationLinks[currentIndex].innerText) <= centerIndex &&
                paginationLinks[realLength - 1].innerText != pageLength) {
                traverseChangeClassName(currentPage, currentIndex);
                return;
            }
        }


        for (var i = 0; i < realLength; i ++) {
            if(paginationLinks[i].innerText == currentPage) {
                paginationLinks[i].className = 'pagination-link is-current';
            }else {
                paginationLinks[i].className = 'pagination-link'
            }
        }

    }

    var toPrevPage = function () {
        currentPage --;
        nextPage.removeAttribute('disabled');
        lastPage.removeAttribute('disabled');
        getStudent();
        if (currentPage == 1) {
            prevPage.setAttribute('disabled', true);
            firstPage.setAttribute('disabled', true);
        }
        if(pageLength > showPages) {
            var currentIndex = 0;
            for (var i = 0; i < realLength; i ++) {
                if (paginationLinks[i].className == 'pagination-link is-current') {
                    currentIndex = i;
                }
            }

            var centerIndex = parseInt(showPages/2);

            if(currentPage > centerIndex && currentIndex <= centerIndex){
                traverseChangeClassName(currentPage, centerIndex);
                return;
            }
        }

        if(currentIndex < centerIndex &&
            parseInt(paginationLinks[currentIndex].innerText) - 1 <= centerIndex &&
            paginationLinks[0].innerText != 1) {
            traverseChangeClassName(currentPage, currentIndex);
            return;
        }


        for (var i = 0; i < realLength; i ++) {

            if(paginationLinks[i].innerText == currentPage) {
                paginationLinks[i].className = 'pagination-link is-current';
            }else {
                paginationLinks[i].className = 'pagination-link'
            }
        }

    }

    var goPage = function (evt) {
        var page = parseInt(evt.innerText);
        if (currentPage == page) return;
        currentPage = page;
        document.getElementsByClassName("is-current")[0].className = 'pagination-link';
        evt.className = 'pagination-link is-current';
        if (currentPage != 1) {
            prevPage.removeAttribute("disabled");
            firstPage.removeAttribute("disabled");
        }else {
            prevPage.setAttribute("disabled", true);
            firstPage.setAttribute("disabled", true);
        }

        if(currentPage != pageLength) {
            nextPage.removeAttribute("disabled");
            lastPage.removeAttribute("disabled");
        }else {
            nextPage.setAttribute("disabled", true);
            lastPage.setAttribute("disabled", true);
        }
        getStudent();


    }

    var toFirstPage = function (evt) {
        currentPage = 1;
        paginationLinks[0].innerText = 1;
        paginationLinks[realLength - 1].innerText = realLength;
        document.getElementsByClassName('is-current')[0].className = 'pagination-link';
        paginationLinks[0].className = 'pagination-link is-current';
        prevPage.setAttribute('disabled', true);
        evt.setAttribute('disabled', true);
        if(realLength > 1) {
            nextPage.removeAttribute('disabled');
            lastPage.removeAttribute('disabled');
        }
        getStudent();
    }

    var toLastPage = function (evt) {
        currentPage = pageLength;
        paginationLinks[realLength - 1].innerText = realLength;
        paginationLinks[0].innerText = pageLength - realLength + 1;
        document.getElementsByClassName('is-current')[0].className = 'pagination-link';
        paginationLinks[realLength - 1].className = 'pagination-link is-current';
        nextPage.setAttribute('disabled', true);
        evt.setAttribute('disabled', true);
        if(realLength > 1) {
            prevPage.removeAttribute('disabled');
            firstPage.removeAttribute('disabled');
        }
        getStudent();
    }


    //ajax封装
    var ajax = function (type, url, data, success, failed) {
        var xhr = null;
        type = type || 'GET';
        success = success || function (e) {
                return 'success';
            }

        failed = failed || function (e) {
                return 'error';
            }

        if(window.XMLHttpRequest){
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP')
        }

        var type = type.toUpperCase();
        // 用于清除缓存
        var random = Math.random();

        if(typeof data == 'object'){
            var str = '';
            for(var key in data){
                str += key+'='+data[key]+'&';
            }
            data = str.replace(/&$/, '');
        }

        if(type == 'GET'){
            if(data){
                xhr.open('GET', url + '?' + data, true);
            } else {
                xhr.open('GET', url + '?t=' + random, true);
            }
            xhr.send();

        } else if(type == 'POST'){
            xhr.open('POST', url, true);
            // 如果需要像 html 表单那样 POST 数据，请使用 setRequestHeader() 来添加 http 头。
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send(data);
        }

        // 处理返回数据
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    success(xhr.responseText);
                } else {
                    if(failed){
                        failed(xhr.status);
                    }
                }
            }
        }
    }

    //获取数据
    var getStudent = function () {
        ajax('POST', 'http://' + domain + ':8080/getstudentinfo', 'page=' + currentPage + '&pageSize=' + <%=pageSize%>, function (res) {
            res = eval(res);
            var dom = '';
            for (var i = 0; i < res.length; i ++) {
                dom += '<tr>\
                            <td>' + res[i].name + '</td>\
                            <td>' + res[i].sex + '</td>\
                            <td>' + res[i].id + '</td>\
                            <td>' + res[i].major + '</td>\
                            <td>\
                                <a class="button is-primary is-outlined" href="update.jsp?id=' + res[i].id + '">修改</a>\
                                <a class="button is-danger is-outlined" onclick="showModel(' + res[i].id + ')">删除</a>\
                            </td>\
                        </tr>'
            }
            document.getElementById('tbody').innerHTML = dom;

        }, function (e) {
            console.log(e);
        });
        sessionStorage.currentPage = currentPage;
    }

    //搜索功能
    var searchInfo = function () {
        var type = document.getElementById('searchType').value;
        var condition = document.getElementById('searchCondition').value;
        ajax('POST', 'http://' + domain + ':8080/searchStudent', 'condition=' + condition + '&type=' + type, function (res) {
            res = eval(res);
            var dom = '';
            if(res.length) {
                for (var i = 0; i < res.length; i ++) {
                    dom += '<tr>\
                            <td>' + res[i].name + '</td>\
                            <td>' + res[i].sex + '</td>\
                            <td>' + res[i].id + '</td>\
                            <td>' + res[i].major + '</td>\
                            <td>\
                                <a class="button is-primary is-outlined" href="update.jsp?id=' + res[i].id + '">修改</a>\
                                <a class="button is-danger is-outlined" onclick="showModel(' + res[i].id + ')">删除</a>\
                            </td>\
                        </tr>'
                }
                document.getElementById('tbody').innerHTML = dom;
            }else {
                document.getElementById('tbody').innerHTML = '<tr><td colspan="5" style="text-align:center;">无查找结果</td><tr>';
            }

            document.getElementById('myPagination').style.display = 'none';
            document.getElementById('backToShowAll').style.display = 'block';

        });
    }

    var backToShowAll = function () {
        document.getElementById('myPagination').style.display = 'flex';
        document.getElementById('backToShowAll').style.display = 'none';
        getStudent();
    }

    getStudent();

</script>
</html>
