<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: 10601
  Date: 2022/5/24
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <metahttp-equiv="content-type"content="text/html;charset=utf-8">--%>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="t2.css">
</head>
<body>

<form>
    <jsp:useBean id="mydb" class="com.example.Shop.DB" scope="session"></jsp:useBean>
<%
    HashMap buys = new HashMap();
    String readsql="select * from buys";
    mydb.setStm(readsql);
    PreparedStatement stm1=mydb.getStm();

    ResultSet rst1=stm1.executeQuery();
    while (rst1.next()){
        String name=rst1.getString("name");
        int num=rst1.getInt("num");
        buys.put(name,num);
    }


%>

    <%
        Iterator it = buys.keySet().iterator();
        while (it.hasNext()) {
            // 遍历 Map
            Object key = it.next();
            Object val = buys.get(key);
        }
    %>


</form>


<script type="text/javascript" src="sources/jscharts.js"></script>
<div id="chartcontainer">This is just a replacement in case Javascript is not available or used for SEO purposes</div>
<script type="text/javascript">
    var myData = new Array(["APPLE",2], ["BANANA",2], ["PEAR",2], ["ORANGE",1]);
    var myChart = new JSChart('chartcontainer', 'pie');
    myChart.setDataArray(myData);
    myChart.draw();


</script>

  </body>
</html>
