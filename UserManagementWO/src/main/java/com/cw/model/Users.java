package com.cw.model;

import java.time.LocalDate;

public class Users {
    
    private int userId;
    private String userName;
    private String fname;
    private String lname;
    private String email;
    private String password;
    private String uRole;
    private String status;
    private Object joinDate;

    public Users(String userName, String fname, String lname, String email, String password, String uRole, String status, LocalDate joinDate) {
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.uRole = uRole;
        this.status = status;
        this.joinDate = joinDate;
    }
    
    

    public Users(int userId, String userName, String fname, String lname, String email, String password, String uRole, String status, Object joinDate) {
        this.userId = userId;
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.uRole = uRole;
        this.status = status;
        this.joinDate = joinDate;
    }

    public Users(String userName, String fname, String lname, String email, String password, Object joinDate) {
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.joinDate = joinDate;
    }

    public Users(int userId, String userName, String fname, String lname, String email, String password) {
        this.userId = userId;
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
    }

    public Users(int userId) {
        this.userId = userId;
    }
    
    

    
    
    

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getuRole() {
        return uRole;
    }

    public void setuRole(String uRole) {
        this.uRole = uRole;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Object joinDate) {
        this.joinDate = joinDate;
    }

    
    
    

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", userName=" + userName + ", email=" + email + ", password=" + password + '}';
    }
    
       
    
}
