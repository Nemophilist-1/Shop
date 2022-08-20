package com.example.Shop;

import java.sql.*;
import java.util.*;

public class DB {
    String className="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/school?serverTimezone=GMT%2B8";
    String usr="root";
    String pwd="123456";

    Connection con;
    PreparedStatement stm;
    ResultSet rst;

    public DB() throws SQLException {
        try{
            Class.forName(className);
        }catch (Exception e){
            System.out.println("驱动程序加载失败！");
        }
        try {
            con=DriverManager.getConnection(url,usr,pwd);
        }catch (Exception e){
            System.out.println("数据库连接失败!");
        }
    }

    public PreparedStatement getStm() {
        return stm;
    }

    public void setStm(String sql) throws SQLException {
        this.stm = con.prepareStatement(sql);
    }

    public ResultSet query(String sql) throws SQLException
    {
        rst=stm.executeQuery(sql);
        return rst;
    }

    public int update(String sql) throws SQLException
    {
        int ret=stm.executeUpdate(sql);
        return ret;
    }

    public void closed() throws SQLException
    {
        if(rst!=null)rst.close();
        if(stm!=null)stm.close();
        if(con!=null)con.close();
    }




    @SuppressWarnings("rawtypes")
    public List getResultTable(String sql) throws SQLException
    {
        ResultSetMetaData rsmd;
        ArrayList result=new ArrayList();
        rst=query(sql);
        rsmd = rst.getMetaData();
        String str="<tr>";
        for(int i=1;i<=rsmd.getColumnCount();i++)
            str=str+"<th>"+rsmd.getColumnLabel(i)+"</th>";
        str=str+"</tr>";
        result.add(str);
        while(rst.next())
        {  	str="<tr>";
            for(int i=1;i<=rsmd.getColumnCount();i++)
            {	if ( rsmd.getColumnTypeName(i).equalsIgnoreCase("CHAR"))
                str=str+"<td>"+rst.getString(i)+"</td>";
                if(rsmd.getColumnTypeName(i).equalsIgnoreCase("INT"))
                    str=str+"<td>"+rst.getInt(i)+"</td>";
            }
            str=str+"</tr>";
            result.add(str);
        }
        return result;
    }
}

