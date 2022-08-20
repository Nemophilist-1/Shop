<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Shop.MyTools" %>
<%@ page import="com.example.Shop.GoodsSingle" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/4/29
  Time: 9:43
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
          String action=request.getParameter("action");
          if(action==null)
              action="";
          if(action.equals("buy")){									//购买商品
              ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");
              int id= MyTools.strToint(request.getParameter("id"));
              GoodsSingle single=(GoodsSingle)goodslist.get(id);
              myCar.addItem(single);		//调用ShopCar类中的addItem()方法添加商品
              response.sendRedirect("show.jsp?currentPage=1");
          }
          else if(action.equals("remove")){							//移除商品
              String name=request.getParameter("name");		//获取商品名称
              myCar.removeItem(name);		//调用ShopCar类中的removeItem()方法移除商品
              response.sendRedirect("shopcar.jsp?currentPage=1");
          }
          else if(action.equals("clear")){							//清空购物车
              myCar.clearCar();				//调用ShopCar类中的clearCar()方法清空购物车
              response.sendRedirect("shopcar.jsp?currentPage=0");
          }else if(action.equals("addRemain")){
              ArrayList goodslist=(ArrayList)application.getAttribute("goodslist");
              int id= MyTools.strToint(request.getParameter("id"));
              GoodsSingle single=(GoodsSingle)goodslist.get(id);
              myCar.addRemain(single);
              response.sendRedirect("show.jsp?currentPage=1");
          }
          else{
              response.sendRedirect("show.jsp?currentPage=1");
          }
      %>
  </form>
  </body>
</html>
