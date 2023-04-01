
package com.tech.blog.helper;

import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
           if(con==null)
           {
               //driver c;lass load
            Class.forName("com.mysql.jdbc.Driver");
            //Create connection
             String url="jdbc:mysql://localhost:3306/techblog?autoReconnect=true&useSSL=false";
                String username="root";
                String password="ashoka123";

             
            con=DriverManager.getConnection(url,username,password);
            
            
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
}
