package com.cw.Dao;

import com.cw.model.Users;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

//Data Access Object Class Which is used to set and get values in and from the database
public class UsersDao {
    
    //CRUD sql for database
    String insertU = "insert into users(username,fname,lname,email,password,joindate,ques1,ques2) values(?,?,?,?,?,?,?,?)";
    String loginU = "select * from users where email=? and password=?";
    String ulist = "select * from users";
    String udelete = "delete from users where userId = ?";

    //Sets values in the users table after registration page
    public void register(Users u) throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(insertU);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getFname());
            ps.setString(3, u.getLname());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPassword());
            ps.setObject(6, u.getJoinDate());
            ps.setString(7, u.getQues1());
            ps.setString(8, u.getQues2());

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //gets value from the table to return true or false
    public boolean login(String email, String password) throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(loginU);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    //gets value from table by matching all email and passowrd
    public Users getSUser(String email, String password) throws SQLException {
        Users u = new Users();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(loginU);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("userId");
                String username = rs.getString("username");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String uRole = rs.getString("urole");
                String status = rs.getString("status");
                Object joindate = rs.getObject("joindate");

                Users suser = new Users(userId, username, fname, lname, uRole, status, joindate);

                return suser;
            }
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return u;
    }

    //Add User method from admin User [Create]
    public void newUser(Users u) throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(insertU);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getFname());
            ps.setString(3, u.getLname());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPassword());
            ps.setObject(6, u.getJoinDate());
            ps.setString(7, u.getQues1());
            ps.setString(8, u.getQues2());
            ps.executeUpdate();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    //gets all the values from the the table and keepis in arraylist[Read]
    public List<Users> userList() throws SQLException {
        List<Users> userlist = new ArrayList<>();
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(ulist);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("userId");
                String userName = rs.getString("username");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String email = rs.getString("email");
                String urole = rs.getString("urole");
                String status = rs.getString("status");
                Object joindate = rs.getObject("joindate");
                String ques1 = rs.getString("ques1");
                String ques2 = rs.getString("ques2");

                Users user = new Users(id, userName, fname, lname, email, urole, status, joindate, ques1, ques2);
                userlist.add(user);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userlist;
    }

    //To update the values of users in the table [Update]
    public void editUser(Users user) throws SQLException {
        String update = "update users set username=?, fname=?,lname=?,email=?,password=?,ques1=?,ques2=? where userId =?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(update);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getFname());
            ps.setString(3, user.getLname());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getQues1());
            ps.setString(7, user.getQues2());
            ps.setInt(8, user.getUserId());
            ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Deletes a user by getting the userId primary key
    public void deleteUser(int userId) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(udelete);
            ps.setInt(1, userId);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    //Get user using the primary key in userId
    public Users getUser(int userId) throws SQLException {
        String sUser = "select * from users where userId =?";
        Users user = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sUser);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("userId");
                String userName = rs.getString("username");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String urole = rs.getString("urole");
                String status = rs.getString("status");
                Object joindate = rs.getObject("joindate");
                String ques1 = rs.getString("ques1");
                String ques2 = rs.getString("ques2");
                user = new Users(id, userName, fname, lname, email, password, urole, status, joindate, ques1, ques2);
                return user;
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }
    
    //Changes active status to blocked status by getting userId
    public void blockUser(int userId) throws SQLException {
        String ublock = "update users set status=? where userId=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(ublock);
            ps.setString(1, "blocked");
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //Changes blocked status to active status by getting userId
    public void unblockUser(int userId) throws SQLException {
        String ublock = "update users set status=? where userId=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(ublock);
            ps.setString(1, "active");
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //returns true if email and ques1 and ques2 arguements are found in the table
    public int securityPassword(String email, String ques1, String ques2) throws SQLException {
        int userId = 0;
        String check = "select * from users where email=? and ques1=? and ques2=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(check);
            ps.setString(1, email);
            ps.setString(2, ques1);
            ps.setString(3, ques2);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                userId = rs.getInt("userId");
            }
            
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userId;
    }

    //updates password data after getting userId from security Password method
    public void resetPassword(int userId, String password) throws SQLException {
        String reset = "Update users set password=? where userId=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(reset);
            ps.setString(1, password);
            ps.setInt(2, userId);
            ps.executeUpdate();
            
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
