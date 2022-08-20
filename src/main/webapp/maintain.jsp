<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Shop.GoodsSingle" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/14
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>
  <form action="maintain1.jsp">

      <table>
          <tr>
              <td>请输入您想添加的商品</td>
          </tr>
          <tr>
              <td>商品名：<input type="text" name="N"></td>

          </tr>
          <tr>
              <td>商品价格：<input type="text" name="P"></td>

          </tr>
          <tr>
              <td>请输入您想删除的商品</td>
          </tr>
          <tr>
              <td>商品名：<input type="text" name="SN"></td>
          </tr>
          <tr>
              <td>
                  <input type="submit" value="确定">
              </td>

          </tr>
      </table>

  </form>
  </body>
</html>
