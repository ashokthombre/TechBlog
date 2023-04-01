/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

/**
 *
 * @author Marketyard330S
 */
public class Comment {
    private int commentId;
    private int cpid;
    private int cuid;
    private String comment;

    public Comment(int commentId, int cpid, int cuid, String comment) {
        this.commentId = commentId;
        this.cpid = cpid;
        this.cuid = cuid;
        this.comment = comment;
    }

    public Comment(int cpid, int cuid, String comment) {
        this.cpid = cpid;
        this.cuid = cuid;
        this.comment = comment;
    }

    public Comment(int cpid, String comment) {
        this.cpid = cpid;
        this.comment = comment;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getCpid() {
        return cpid;
    }

    public void setCpid(int cpid) {
        this.cpid = cpid;
    }

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
    
}
