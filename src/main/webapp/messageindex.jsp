<%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/4/29
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>
<form action="save.jsp">
    <table>
        <tr>
            <td>留言人：</td>
            <td><input type="text" name="userName" placeholder="请备注顾客或者商家"></td>
        </tr>
        <tr>
            <td>主题：</td>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>留言内容：</td>
            <td><textarea rows="8" cols="20" name="content"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="留言"></td>
        </tr>
        <tr>
            <td colspan="2"><a href="disp2.jsp?currentPage=1">显示留言</a></td>
        </tr>
    </table>

</form>
  </body>
</html>
