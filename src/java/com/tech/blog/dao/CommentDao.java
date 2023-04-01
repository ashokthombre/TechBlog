/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Comment;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marketyard330S
 */
public class CommentDao {
    Connection con;

    public CommentDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean insertComment(int cpid,int cuid,String comment)
    {
         boolean f=false;
        try
        {
          
            String query="insert into comments(cpid,cuid,comment)values(?,?,?)";
            
            PreparedStatement p=this.con.prepareStatement(query);
              p.setInt(1, cpid);
              p.setInt(2,cuid);
              p.setString(3,comment);
              p.executeUpdate();
            
            f=true;
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
 public List<Comment> getAllComments(int cpid)
    {
         List<Comment> list=new ArrayList<>();
         
         System.out.println(cpid);
        try
          {
              String query="select * from comments where cpid=? ";
              PreparedStatement pstmt=con.prepareStatement(query);
              pstmt.setInt(1,cpid);
              ResultSet set=pstmt.executeQuery();
              
              while(set.next())
              {
                int commentId=set.getInt("commentId");
                int cpostid=set.getInt("cpid");
                int cuid=set.getInt("cuid");
                String comment=set.getString("comment");
               
                 System.out.println(cuid);
                 System.out.println(commentId);
                 System.out.println(comment);
                Comment c=new Comment(commentId, cpostid, cuid, comment);
                 list.add(c);
              }
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
          
          
          return list;
      
    }
    }
    

