<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/20
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>
  <form>
      <jsp:useBean id="mydb" class="com.example.Shop.DB" scope="session"></jsp:useBean>
      <%
          String name=request.getParameter("UserName");
          String password=request.getParameter("pw");
      %>
<%--      <%--%>
<%--          String deletesql="delete from user";--%>
<%--          mydb.setStm(deletesql);--%>
<%--          PreparedStatement stm1=mydb.getStm();--%>
<%--          stm1.executeUpdate();--%>
<%--      %>--%>
      <%
          String User_Wirte_sql="insert into user (name,password) values (?,?)";
          mydb.setStm(User_Wirte_sql);
          PreparedStatement stm2=mydb.getStm();
          stm2.setString(1,name);
          stm2.setString(2,password);
          stm2.executeUpdate();
      %>

      <table align="center">
          <tr height="50">
              <td colspan="2">注册成功！</td>
          </tr>
          <tr height="50">
              <td>用户名：</td>
              <td><%=name%></td>
          </tr>
          <tr height="50">
              <td>密码：</td>
              <td><%=password%></td>
          </tr>
          <tr height="50">
              <td colspan="2">
                  <a href="login.jsp">返回登录界面</a>
              </td>
          </tr>
      </table>


  </form>


  </body>
</html>
