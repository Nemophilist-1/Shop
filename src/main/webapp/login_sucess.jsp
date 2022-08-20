<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/20
  Time: 20:34
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
      <table>
          <%
              boolean f=false;
              String readsql="select name,password from user";
              mydb.setStm(readsql);
              PreparedStatement stm1=mydb.getStm();
              ResultSet rst1=stm1.executeQuery();
              while (rst1.next()){
                  String n=rst1.getString("name");
                  String p=rst1.getString("password");
                  if(n.equals(name)&&p.equals(password)){
                      f=true;
          %>
          <tr>
              <td>
                  恭喜！登陆成功！
              </td>
          </tr>
          <tr>
              <td>
                  <a href="show.jsp?currentPage=1">返回浏览界面</a>
              </td>
          </tr>
          <%
                  }
              }
              if(f==false){
                  out.print ("<script language='javaScript'> alert('密码错误');</script>");
                  response.sendRedirect("login.jsp");
              }
          %>
      </table>






      <%
          boolean Lock1=true;
          session.setAttribute("Lock1",Lock1);
      %>
  </form>
  </body>
</html>
