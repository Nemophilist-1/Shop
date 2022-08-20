<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.Shop.GoodsSingle" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/24
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form>
      <jsp:useBean id="myCar" class="com.example.Shop.ShopCar" scope="session"/>
      <jsp:useBean id="mydb" class="com.example.Shop.DB" scope="session"></jsp:useBean>
      <%
          ArrayList buylist=myCar.getBuylist();
      %>

      <%
          String deletesql="delete from buys";
          mydb.setStm(deletesql);
          PreparedStatement stm1=mydb.getStm();
          stm1.executeUpdate();
      %>

      <%
          String sql = "insert into buys (name,num) values (?,?)";
          mydb.setStm(sql);
          PreparedStatement stm2=mydb.getStm();

          for (Object o : buylist) {
              GoodsSingle gs= (GoodsSingle) o;
              stm2.setString(1,gs.getName());
              stm2.setInt(2,gs.getNum());
              stm2.executeUpdate();
          }

//        mydb.closed();
      %>
      <%
          response.sendRedirect("shopcar.jsp?currentPage=1");
      %>
  </form>
  </body>
</html>
