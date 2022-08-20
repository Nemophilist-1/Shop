<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Shop.GoodsSingle" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/4/29
  Time: 9:36
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
      <%!
          static boolean Lock1=false;
          static ArrayList goodslist=new ArrayList();			//用来存储商品
          static int tempnum=(new Random(19190310)).nextInt(100)+10;
//          static int tempnum=0;
          static {												//静态代码块
              String[] urls={"https://s1.ax1x.com/2022/05/28/XuQMHx.jpg",
              "https://s1.ax1x.com/2022/05/28/XuQGCD.jpg",
              "https://s1.ax1x.com/2022/05/28/XuQ1UK.jpg",
              "https://s1.ax1x.com/2022/05/28/XuQKD1.jpg",
              "https://s1.ax1x.com/2022/05/28/XuQlE6.jpg",
              "https://s1.ax1x.com/2022/05/28/XuQ34O.jpg",
              "https://s1.ax1x.com/2022/05/28/XuQJ8e.jpg"};
              String[] names={"APPLE","BANANA","PEAR","ORANGE","STRAWBERRY","LEMON","MELON"};		//商品名称
              float[] prices={2.8f,3.1f,2.5f,2.3f,4.6f,2.4f,6.5f,1.9f};			//商品价格
              for(int i=0;i< names.length;i++){							//初始化商品信息列表
                  //定义一个GoodsSingle类对象来封装商品信息
                  GoodsSingle single=new GoodsSingle();
//                  single.setId(Integer.toString(i*5+1000));
                  single.setId(String.valueOf(i));
                  single.setName(names[i]); 					//封装商品名称信息
                  single.setPrice(prices[i]); 				//封装商品价格信息
                  single.setNum(1); 							//封装购买数量信息
                  single.setRemainnum(tempnum);                  //封装库存量
                  single.setUrl(urls[i]);

                  goodslist.add(single); 					//保存商品到goodslist集合对象中
//                  goodslist.add(i*5+1000,single);

              }
          }
      %>
      <%
          session.setAttribute("Lock1",Lock1);
          session.setAttribute("tempnum",tempnum);
          session.setAttribute("goodslist",goodslist); 		//保存商品列表到session中
          response.sendRedirect("show.jsp?currentPage=1");					//跳转到show.jsp页面显示商品
      %>
  </form>
  </body>
</html>
