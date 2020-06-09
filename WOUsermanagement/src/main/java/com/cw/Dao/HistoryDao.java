package com.cw.Dao;

import com.cw.model.History;
import com.cw.model.ReportAndHistory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HistoryDao {

    //inserts history data when anither Username is null
    public void insertLog(History history) throws SQLException {
        String sql = "insert into history(userId,activity) values(?,?)";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, history.getUserId());
            ps.setString(2, history.getActivity());
            ps.executeUpdate();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //inserts history data when all values are present
    public void insertLog(int userId, String activity, String aUsername) throws SQLException {
        String sql = "insert into history(userId,activity,aUsername) values(?,?,?)";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, activity);
            ps.setString(3, aUsername);
            ps.executeUpdate();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    //list of all values in history table
    public List<ReportAndHistory> listHistory() throws SQLException {
        String sql = "SELECT *FROM history INNER JOIN users on users.userId = history.userId order by time desc";
        List<ReportAndHistory> historyList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String activity = rs.getString("activity");
                String aUsername = rs.getString("aUsername");
                Object time = rs.getObject("time");

                ReportAndHistory history = new ReportAndHistory(username, activity, aUsername, time);
                historyList.add(history);
            }
            rs.close();
            ps.close();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return historyList;
    }

    //list of history of the present logged in user
    public List<ReportAndHistory> listHistory(String user) throws SQLException {
        String sql = "SELECT *FROM history INNER JOIN users on users.userId = history.userId where username='"+user+"' order by time desc";
        List<ReportAndHistory> historyList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String activity = rs.getString("activity");
                String aUsername = rs.getString("aUsername");
                Object time = rs.getObject("time");

                ReportAndHistory history = new ReportAndHistory(username, activity, aUsername, time);
                historyList.add(history);
            }
            rs.close();
            ps.close();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return historyList;
    }
    
    //generates a report after speciefying start date, end date and activity
    public List<ReportAndHistory> generateReport(String sDate, String eDate, String activity) throws SQLException {
        String sql = "SELECT *FROM history INNER JOIN users on users.userId = history.userId WHERE time BETWEEN '" + sDate + "' AND '" + eDate + "' AND activity='" + activity + "'";
        List<ReportAndHistory> report = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String activity2 = rs.getString("activity");
                String aUsername = rs.getString("aUsername");
                Object time = rs.getObject("time");

                ReportAndHistory history = new ReportAndHistory(username, activity2, aUsername, time);
                report.add(history);
            }
            rs.close();
            ps.close();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return report;
    }
}
