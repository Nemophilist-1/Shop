<%@ page import="com.example.Shop.Mess" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/4/22
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息保留页面</title>
</head>
<body>
    <form>
        <jsp:useBean id="bn" class="com.example.Shop.Mess">
            <jsp:setProperty name="bn" property="*"></jsp:setProperty>
        </jsp:useBean>

        <%
            Mess m=new Mess();
            m.setUserName(bn.getUserName());
            m.setTitle(bn.getTitle());
            m.setContent(bn.getContent());

            ArrayList<Mess> conta=new ArrayList<>();
            conta= (ArrayList<Mess>) application.getAttribute("cont");
            ArrayList<Mess> init=new ArrayList<>();
            if(conta==null){
                init.add(m);
                application.setAttribute("cont",init);
            }else{
                conta.add(m);
                application.setAttribute("cont",conta);
            }

            response.sendRedirect("index.jsp");
        %>

    </form>

</body>
</html>
