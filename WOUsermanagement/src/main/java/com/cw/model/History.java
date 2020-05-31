
package com.cw.model;


public class History {
    private int hid;
    private int userId;
    private String activity;
    private String aUsername;
    private Object time;
    private Object date;

    public History(int hid, int userId, String activity, String aUsername, Object time, Object date) {
        this.hid = hid;
        this.userId = userId;
        this.activity = activity;
        this.aUsername = aUsername;
        this.time = time;
        this.date = date;
    }

    public History(int userId, String activity, String aUsername, Object time, Object date) {
        this.userId = userId;
        this.activity = activity;
        this.aUsername = aUsername;
        this.time = time;
        this.date = date;
    }

    public History(int userId, String activity, Object time, Object date) {
        this.userId = userId;
        this.activity = activity;
        this.time = time;
        this.date = date;
    }
    
    


    public History(int userId, String activity) {
        this.userId = userId;
        this.activity = activity;
    }
    
    
    

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

    public Object getDate() {
        return date;
    }

    public void setDate(Object date) {
        this.date = date;
    }
    
    
    
}
