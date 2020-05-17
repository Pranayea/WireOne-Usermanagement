package com.cw.Dao;

import com.cw.model.Users;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsersDao {

    String insertU = "insert into users(username,fname,lname,email,password,joindate) values(?,?,?,?,?,?)";
    String loginU = "select * from users where email=? and password=?";
    String ulist = "select * from users";
    String udelete = "delete from users where userId = ?";

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

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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
            ps.executeUpdate();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
                String password = rs.getString("password");
                String urole = rs.getString("urole");
                String status = rs.getString("status");
                Object joindate = rs.getObject("joindate");

                Users user = new Users(id, userName, fname, lname, email, password, urole, status, joindate);
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

    public boolean editUser(Users u) throws SQLException {
        String update = "update users set username=?, fname=?,lname=?,email=?,password=?";
        update += "where userId =?";

        boolean rowUpdated = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(update);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getFname());
            ps.setString(3, u.getLname());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPassword());
            ps.setInt(6, u.getUserId());

            rowUpdated = ps.executeUpdate() > 0;

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public boolean deleteUser(Users u) {
        boolean rowDeleted = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(udelete);
            ps.setInt(1, u.getUserId());
            
            rowDeleted = ps.executeUpdate() > 0;
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return rowDeleted;
        }

    }
