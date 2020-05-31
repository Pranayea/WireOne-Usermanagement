package com.cw.Dao;

import com.cw.model.History;
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

    public void insertLogin(History history) throws SQLException {
        String sql = "insert into history(userId,activity) values(?,?)";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, history.getUserId());
            ps.setString(2, history.getActivity());
//            ps.setObject(3, LocalTime.now());
//            ps.setObject(4, LocalDate.now());
            ps.executeUpdate();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<History> listHistory() throws SQLException {
        String sql = "select * from history";
        List<History> historyList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int hid = rs.getInt("hid");
                int userId = rs.getInt("userId");
                String activity = rs.getString("activity");
                String aUsername = rs.getString("aUsername");
                Object time = rs.getObject("time");
                Object date = rs.getObject("date");
                
                
                History history = new History(hid,userId,activity,aUsername,time,date);
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

}
