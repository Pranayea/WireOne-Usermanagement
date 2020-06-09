package com.cw.model;

// Model class corresponding to users in umngt database
public class Users {
    
    //declaration of vairables which corresponds to the columns of users table
    private int userId;
    private String userName;
    private String fname;
    private String lname;
    private String email;
    private String password;
    private String uRole;
    private String status;
    private Object joinDate;
    private String ques1;
    private String ques2;

    //initialization of variables through constructors
    public Users() {
        this.userName = "";
        this.fname = "";
        this.lname = "";
        this.email = "";
        this.password = "";
        this.uRole = "";
        this.status = "";
        this.joinDate = null;
    }

    public Users(int userId, String userName, String fname, String lname, String email, String password, String uRole, String status, Object joinDate, String ques1, String ques2) {
        this.userId = userId;
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.uRole = uRole;
        this.status = status;
        this.joinDate = joinDate;
        this.ques1 = ques1;
        this.ques2 = ques2;
    }
    
    

    public Users(String userName, String fname, String lname, String email, String password, String uRole, String status, Object joinDate, String ques1, String ques2) {
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.uRole = uRole;
        this.status = status;
        this.joinDate = joinDate;
        this.ques1 = ques1;
        this.ques2 = ques2;
    }

    public Users(int userId, String userName, String fname, String lname, String email, String uRole, String status, Object joinDate, String ques1, String ques2) {
        this.userId = userId;
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.uRole = uRole;
        this.status = status;
        this.joinDate = joinDate;
        this.ques1 = ques1;
        this.ques2 = ques2;
    }

    

    
    

    public Users(String userName, String fname, String lname, String email, String password, Object joinDate, String ques1, String ques2) {
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.joinDate = joinDate;
        this.ques1 = ques1;
        this.ques2 = ques2;
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

    public Users(int userId, String userName, String fname, String lname, String uRole, String status, Object joinDate) {
        this.userId = userId;
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.uRole = uRole;
        this.status = status;
        this.joinDate = joinDate;
    }

    public Users(int userId, String userName, String fname, String lname, String email, String password,String ques1,String ques2) {
        this.userId = userId;
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.ques1 = ques1;
        this.ques2 = ques2;
    }
    
    
    
    //getter setter method for all variables
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

    public String getQues1() {
        return ques1;
    }

    public void setQues1(String ques1) {
        this.ques1 = ques1;
    }

    public String getQues2() {
        return ques2;
    }

    public void setQues2(String ques2) {
        this.ques2 = ques2;
    }
    
    
    
    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", userName=" + userName + ", email=" + email + ", password=" + password + '}';
    }

}
