<%@ page import="java.util.ArrayList" %>
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
  <form action="shopcar.jsp">
      <!-- 通过动作标识，获取ShopCar类实例 -->
      <jsp:useBean id="myCar" class="com.example.Shop.ShopCar" scope="session"/>
      <%
          ArrayList buylist=myCar.getBuylist();		//获取实例中用来存储购买的商品的集合
          float total=0;								//用来存储应付金额
      %>
      <%
          int currentPage,PageSize=3,rowCounts,PageCounts = 0,start;
          currentPage=Integer.valueOf(request.getParameter("currentPage"));;
          String id = "";
          String name = "";
          float price = 0;
          int num = 0;
          int remainnum = 0;
          float money = 0;
      %>

      <table border="1" width="600" rules="none" cellspacing="0" cellpadding="0">
          <tr height="50"><td colspan="7" align="center">购买的商品如下</td></tr>
          <tr align="center" height="30" bgcolor="lightgrey">
              <td width="15%">id</td>
              <td>名称</td>
              <td>价格(元/斤)</td>
              <td>数量</td>
              <td>库存量</td>
              <td>总价(元)</td>
              <td>移除(-1/次)</td>
          </tr>
          <%	if(buylist==null||buylist.size()==0){ %>
          <tr height="100"><td colspan="7" align="center">您的购物车为空！</td></tr>
          <%
          }
          else{
              rowCounts=buylist.size();
              PageCounts=(rowCounts-1)/PageSize+1;
              if(currentPage<1){
                  currentPage=1;
              }if(currentPage>PageCounts){
                  currentPage=PageCounts;
              }
              start=(currentPage-1)*PageSize;
              for (Object o : buylist) {
                  GoodsSingle s=(GoodsSingle) o;
                  float price1=s.getPrice();
                  int num1=s.getNum();
                  float money1=((int)((price1*num1+0.05f)*10))/10f;
                  total+=money1;              						//计算应付金额
              }
              for(int i=start;(i<start+PageSize)&&(i < buylist.size());i++){
                  GoodsSingle single=(GoodsSingle)buylist.get(i);
                  id=single.getId();
                  name=single.getName();							//获取商品名称
                  price=single.getPrice();							//获取商品价格
                  num=single.getNum();								//获取购买数量
                  remainnum=single.getRemainnum();
                  money=((int)((price*num+0.05f)*10))/10f;			//计算当前商品总价，并进行四舍五入

          %>
          <tr align="center" height="50">
              <td><%=Integer.valueOf(id)*5+1000%></td>
              <td><%=name%></td>
              <td><%=price%></td>
              <td><%=num%></td>
              <td><%=remainnum%></td>
              <td><%=money%></td>
              <td>
                  <a href="docar.jsp?action=remove&name=<%=name%>">移除</a>
              </td>
          </tr>
          <%
              }

              }
          %>
          <tr height="50" align="center"><td colspan="7">应付金额：<%=total%></td></tr>
          <tr height="50" align="center">
              <td colspan="3"><a href="show.jsp?currentPage=1">继续购物</a></td>
              <td colspan="4"><a href="docar.jsp?action=clear">清空购物车</a><%
                  ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");
                  int tempnum=(int)session.getAttribute("tempnum");
                  for (Object o : goodslist) {
                      GoodsSingle s=(GoodsSingle)o;
                      s.setRemainnum(tempnum);
                  }
              %></td>
          </tr>
          <tr height="50" align="center">
              <td colspan="1" align="center">
                  <a href="shopcar.jsp?currentPage=<%=currentPage-1%>">前一页</a>
              </td>
              <td colspan="5">
                  总共<%=PageCounts%>页 当前是第<%=currentPage%>页
              </td>
              <td colspan="1" align="center">
                  <a href="shopcar.jsp?currentPage=<%=currentPage+1%>">后一页</a>
              </td>
          </tr>
          <tr height="50">
              <td colspan="7">
                  到第<input type="text" name="currentPage"/>页<input type="submit" value="go"/>
              </td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="DBBUYWRITE.jsp">保存当前购物车到数据库</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="chart.jsp">查看图表</a></td>
          </tr>
          <tr height="50">
              <td align="center" colspan="7"><a href="big_sale.jsp">近期（30秒）热卖</a></td>
          </tr>
      </table>
  </form>
  </body>
</html>
