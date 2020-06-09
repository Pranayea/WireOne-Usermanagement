
package com.cw.model;

//model class for crating
public class History {
    
    //decalaration of variables coressponding to history table in database
    private int hid;
    private int userId;
    private String activity;
    private String aUsername;
    private Object time;

    //intialization of ariables through constructor
    public History(int hid, int userId, String activity, String aUsername, Object time) {
        this.hid = hid;
        this.userId = userId;
        this.activity = activity;
        this.aUsername = aUsername;
        this.time = time;
    }

    public History(int userId, String activity, String aUsername, Object time) {
        this.userId = userId;
        this.activity = activity;
        this.aUsername = aUsername;
        this.time = time;
    }

    public History(int userId, String activity, Object time) {
        this.userId = userId;
        this.activity = activity;
        this.time = time;

    }
    

    public History(int userId, String activity) {
        this.userId = userId;
        this.activity = activity;
    }
    
    
    
    //getter and setter method for all variables
    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public Object getTime() {
        return time;
    }

    public void setTime(Object time) {
        this.time = time;
    }

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername;
    }

    
    
    
}
