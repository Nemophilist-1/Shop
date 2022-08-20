<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.example.Shop.GoodsSingle" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %><%--
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
        String deletesql="delete from goods";
        mydb.setStm(deletesql);
        PreparedStatement stm1=mydb.getStm();
        stm1.executeUpdate();
    %>

    <%
        String sql = "insert into goods (myid,myname,myprice,mynum,myremainnum) values (?,?,?,?,?)";
        mydb.setStm(sql);
        PreparedStatement stm2=mydb.getStm();

        for (Object o : goodslist) {
            GoodsSingle gs= (GoodsSingle) o;
            stm2.setString(1,gs.getId());
            stm2.setString(2,gs.getName());
            stm2.setFloat(3,gs.getPrice());
            stm2.setInt(4,gs.getNum());
            stm2.setInt(5,gs.getRemainnum());
            stm2.executeUpdate();
        }

//        mydb.closed();
    %>
    <%
        response.sendRedirect("show.jsp?currentPage=1");
    %>
</form>
  </body>
</html>
