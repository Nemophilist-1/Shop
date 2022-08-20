<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Shop.Mess" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/4/22
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板的显示界面</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>
  <form action="disp2.jsp">
      <%
          int currentPage,PageSize=3,rowCounts,PageCounts = 0,start;
          currentPage=Integer.valueOf(request.getParameter("currentPage"));

          ArrayList<Mess> conta= (ArrayList<Mess>) application.getAttribute("cont");



      %>

      <table>
          <tr>
              <td>
                  <%
                      if (conta==null){
                          out.print("没有留言");
                      }else{
                          rowCounts=conta.size();
                          PageCounts=(rowCounts-1)/PageSize+1;
                          if(currentPage<1){
                              currentPage=1;
                          }if(currentPage>PageCounts){
                              currentPage=PageCounts;
                          }
                          start=(currentPage-1)*PageSize;


                          for (int i = start; (i<start+PageSize)&&(i < conta.size()); i++) {
                              Mess mess=conta.get(i);
                              out.print("留言人："+mess.getUserName()+"<br>");
                              out.print("主题："+mess.getTitle()+"<br>");
                              out.print("内容："+mess.getContent()+"<br>");
                              out.print("<hr>");
                          }
                      }
                  %>
              </td>
          </tr>
          <tr>
              <td>
                  总共<%=PageCounts%>页 当前是第<%=currentPage%>页
              </td>
          </tr>
          <tr>
              <td>
                  <a href="disp2.jsp?currentPage=<%=currentPage-1%>">前一页</a>&nbsp&nbsp&nbsp
                  <a href="index.jsp">继续购物</a>&nbsp&nbsp&nbsp
                  <a href="disp2.jsp?currentPage=<%=currentPage+1%>">后一页</a>&nbsp&nbsp&nbsp
              </td>
          </tr>
          <tr>
              <td>
                  到第<input type="text" name="currentPage"/>页<input type="submit" value="go"/>
              </td>
          </tr>
      </table>

  </form>


  </body>
</html>
