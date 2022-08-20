<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.Shop.GoodsSingle" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/28
  Time: 15:20
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
      <jsp:useBean id="myCar" class="com.example.Shop.ShopCar" scope="session"/>
      <%
          ArrayList buylist=myCar.getBuylist();
      %>
      <%
          Date date=new Date();
          String id = "";
          String name = "";
          int num = 0;
      %>
      <table>
          <tr>
              <td colspan="3">近期热卖（30秒）</td>
          </tr>
          <tr>
              <td>id</td>
              <td>名称</td>
              <td>数量</td>
          </tr>
          <%
              for (Object o : buylist) {
                  GoodsSingle gs= (GoodsSingle) o;
                  if(date.getTime()-gs.getDate().getTime()<30*1000){
                      id=gs.getId();
                      name=gs.getName();
                      num=gs.getNum();
          %>
          <tr>
              <td><%=Integer.valueOf(id)*5+1000%></td>
              <td><%=name%></td>
              <td><%=num%></td>
          </tr>
          <%
                  }
              }
          %>
          <tr>
              <td colspan="3">
                  <a href="show.jsp?currentPage=1">继续购物</a>
              </td>
          </tr>
      </table>
  </form>
  </body>
</html>
