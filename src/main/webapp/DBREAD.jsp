<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.Shop.GoodsSingle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSetMetaData" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/19
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form>
      <jsp:useBean id="mydb" class="com.example.Shop.DB" scope="session"></jsp:useBean>
      <%
          ArrayList goodslist= (ArrayList) session.getAttribute("goodslist");
      %>

      <%
          String readsql="select * from goods";
          mydb.setStm(readsql);
          PreparedStatement stm1=mydb.getStm();
//          stm1.setString(1,"*");

          ResultSet rst1=stm1.executeQuery();
//          stm1.executeUpdate();
//          ArrayList<String> ids=new ArrayList();
//          ArrayList<String> names=new ArrayList();
//          ArrayList<Float> prices=new ArrayList();
//          ArrayList<Integer> nums=new ArrayList();
//          ArrayList<Integer> rnums=new ArrayList();
          ArrayList<String> result=new ArrayList<>();
//          ResultSetMetaData rsmd = rst1.getMetaData();
          String str="";

//          int num = rst1.getMetaData().getColumnCount();

//          while(rst1.next()) {
////              for (int i = 0; i< num; i++){
////                  GoodsSingle gs= (GoodsSingle) goodslist.get(i);
////                  gs.setId(rst1.getMetaData().getColumnName(i));
////                  gs.setName(rst1.getMetaData().getColumnName(i));
////              }
//              str="";
//              for (int i = 1; i <= rsmd.getColumnCount(); i++) {
//                  if (rsmd.getColumnTypeName(i).equalsIgnoreCase("VARCHAR"))
//                      str = str  + rst1.getString(i)+ "!";
//                  if (rsmd.getColumnTypeName(i).equalsIgnoreCase("INT"))
//                      str = str  + rst1.getInt(i)+ "@";
//                  if (rsmd.getColumnTypeName(i).equalsIgnoreCase("FLOAT"))
//                      str = str  + rst1.getFloat(i)+ "#";
//                  result.add(str);
//              }
//
//          }

          while (rst1.next()&&str.equals("")){
              String id=rst1.getString("myid");
              String name=rst1.getString("myname");
              Float price=rst1.getFloat("myprice");
              int num=rst1.getInt("mynum");
              int remainnum=rst1.getInt("myremainnum");
              str=str+id+"!"+name+"!"+price+"#"+num+"@"+remainnum+"@";
              result.add(str);
//              ids.add(id);
//              names.add(name);
//              prices.add(price);
//              nums.add(num);
//              rnums.add(remainnum);
              str="";
          }

      %>

      <%
          GoodsSingle gss = new GoodsSingle();
          int gap=result.size()-goodslist.size();
          while(gap>0){
              goodslist.add(gss);
              gap--;
          }

          for(int i=0;i<goodslist.size();i++){
              String s= result.get(i);
              GoodsSingle gs= (GoodsSingle) goodslist.get(i);
              String[] temp;
              String[] temp1;
              String[] temp2;
              temp=s.split("!",3);
              gs.setId(temp[0]);
              gs.setName(temp[1]);
              temp1=temp[2].split("#",2);
              gs.setPrice(Float.parseFloat(temp1[0]));
              temp2=temp1[1].split("@");
              gs.setNum(Integer.parseInt(temp2[0]));
              gs.setRemainnum(Integer.parseInt(temp2[1]));
          }
      %>

      <%
          response.sendRedirect("show.jsp?currentPage=1");
          session.setAttribute("goodslist",goodslist);
      %>

  </form>
  </body>
</html>
