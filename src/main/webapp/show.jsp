<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Shop.GoodsSingle" %>
<%@ page import="java.util.concurrent.locks.Lock" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/4/29
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>
  <form action="show.jsp">
      <jsp:useBean id="myCar" class="com.example.Shop.ShopCar" scope="session"/>
      <%
          boolean Lock1= (boolean) session.getAttribute("Lock1");
          ArrayList buylist=myCar.getBuylist();		//获取实例中用来存储购买的商品的集合
      %>
      <%	ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");	%>

      <table border="1" width="800" rules="none" cellspacing="0" cellpadding="0">
          <tr height="50"><td colspan="7" align="center">提供商品如下</td></tr>
          <tr align="center" height="30" bgcolor="lightgrey">
              <td>id</td>
              <td>名称</td>
              <td>价格(元/斤)</td>
              <td>库存量</td>
              <td>购买</td>
              <td>库存量+1</td>
              <td>图片介绍</td>
          </tr>
          <%
              int currentPage,PageSize=3,rowCounts,PageCounts = 0,start;
              currentPage=Integer.valueOf(request.getParameter("currentPage"));;

          %>
          <%  if(goodslist==null||goodslist.size()==0|| Lock1==false){ %>
          <tr height="100"><td colspan="7" align="center">没有商品可显示！</td></tr>
          <%
          }
          else{
              rowCounts=goodslist.size();
              PageCounts=(rowCounts-1)/PageSize+1;
              if(currentPage<1){
                  currentPage=1;
              }if(currentPage>PageCounts){
                  currentPage=PageCounts;
              }
              start=(currentPage-1)*PageSize;
              for(int i=start;(i<start+PageSize)&&(i < goodslist.size());i++){
                  GoodsSingle single=(GoodsSingle)goodslist.get(i);
                  for (Object o : buylist) {
                      GoodsSingle s=(GoodsSingle)o;
                      if(s.getName().equals(single.getName())){
                          single.setRemainnum(s.getRemainnum());
                      }
                  }
          %>
          <tr height="50" align="center">
              <td><%=Integer.parseInt(single.getId())*5+1000%></td>
              <td><%=single.getName()%></td>
              <td><%=single.getPrice()%></td>
              <td><%=single.getRemainnum()%></td>
              <td><a href="docar.jsp?action=buy&id=<%=single.getId()%>">购买</a></td>
              <td><a href="docar.jsp?action=addRemain&id=<%=single.getId()%>">库存量+1</a></td>
              <td><a href=<%=single.getUrl()%>> <%=single.getName()%>图片 </a><%--<img src="<%=single.getUrl()%>">--%> </td>
          </tr>
          <%
                  }
              }
          %>
          <tr height="50">
              <td align="center" colspan="7"><a href="shopcar.jsp?currentPage=1">查看购物车</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="messageindex.jsp">留言沟通</a></td>
          </tr>
          <tr height="50">
              <td colspan="2" align="center">
                  <a href="show.jsp?currentPage=<%=currentPage-1%>">前一页</a>
              </td>
              <td colspan="3">
                  总共<%=PageCounts%>页 当前是第<%=currentPage%>页
              </td>
              <td colspan="2" align="center">
                  <a href="show.jsp?currentPage=<%=currentPage+1%>">后一页</a>
              </td>
          </tr>
          <tr height="50">
              <td colspan="7">
                  到第<input type="text" name="currentPage"/>页<input type="submit" value="go"/>
              </td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="maintain.jsp">增删商品</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="DBREAD.jsp">从数据库读入商品清单（清空默认商品清单）</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="DBWRITE.jsp">保存当前商品清单到数据库</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="register.jsp">注册用户</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="login.jsp">登录</a></td>
          </tr>
      </table>
      <%

      %>
  </form>
  </body>
</html>
