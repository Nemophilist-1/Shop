<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Shop.GoodsSingle" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/14
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form>
      <%
          ArrayList goodslist= (ArrayList) session.getAttribute("goodslist");
          int tempnum= (int) session.getAttribute("tempnum");
      %>

      <%
          String N=request.getParameter("N");
//                  ArrayList<String> Names=new ArrayList<>();
//                  for (String name : names) {
//                      Names.add(name);
//                  }
//                  Collections.addAll(Names,N);
//                  for (int i = 0; i < Names.size(); i++) {
//                      names[i]= Names.get(i);
//                  }

          GoodsSingle single=new GoodsSingle();
          GoodsSingle lastsingle= (GoodsSingle) goodslist.get(goodslist.size()-1);
          single.setId(String.valueOf(Integer.valueOf(lastsingle.getId())+1));
          single.setName(N);



      %>


      <%
          float P= Float.valueOf(request.getParameter("P"));
//                  ArrayList<Float> Prices=new ArrayList<>();
//                  for (float price : prices) {
//                      Prices.add(price);
//                  }
//                  Collections.addAll(Prices,P);
//                  for (int i = 0; i < Prices.size(); i++) {
//                      prices[i]= Prices.get(i);
//                  }
          single.setPrice(P);
          single.setNum(1);
          single.setRemainnum(tempnum);
      %>


      <%
          goodslist.add(single);
      %>

      <%
          String SN=request.getParameter("SN");
          for (Object o : goodslist) {
              GoodsSingle gs=(GoodsSingle)o;
              if(gs.getName().equals(SN)){
                  goodslist.remove(gs);
              }
          }
      %>


      <%
          session.setAttribute("goodslist",goodslist);
          response.sendRedirect("index.jsp");
      %>

  </form>
  </body>
</html>
