package com.cw.model;


//This model class is used to hod values for inner join queries in the system.
public class ReportAndHistory {
    
    //decalration of variables
    private String username;
    private String activity;
    private String aUsername;
    private Object time;

    //intialization of variables through constructor
    public ReportAndHistory(String username, String activity, String aUsername, Object time) {
        this.username = username;
        this.activity = activity;
        this.aUsername = aUsername;
        this.time = time;
    }
    
    
    //getter and setter method of variables
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername;
    }

    public Object getTime() {
        return time;
    }

    public void setTime(Object time) {
        this.time = time;
    }
    
    
}
