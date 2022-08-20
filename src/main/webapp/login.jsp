<%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/20
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>
  <form action="login_sucess.jsp">

      <table>
          <tr>
              <td>用户名：</td>
              <td><input type="text" placeholder="请输入用户名" name="UserName" ></td>
          </tr>
          <tr>
              <td>密码：</td>
              <td><input type="password" name="pw" ></td>
          </tr>
          <tr>
              <td colspan="2">
                  <input type="submit" value="登录">
              </td>
          </tr>
      </table>

  </form>
  </body>
</html>
