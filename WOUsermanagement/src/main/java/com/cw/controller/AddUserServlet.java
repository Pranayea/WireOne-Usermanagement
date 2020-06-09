/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cw.controller;

import com.cw.Dao.HistoryDao;
import com.cw.Dao.UsersDao;
import com.cw.model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class AddUserServlet extends HttpServlet {
    UsersDao usersDao;
    HistoryDao hisDao;
    
    //Intializing the object of Dao classes
    public AddUserServlet() {
        this.usersDao = new UsersDao();
        this.hisDao = new HistoryDao();
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            addUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    public void addUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
        //getting values of jsp page
        String uname = request.getParameter("uname");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        LocalDate now = LocalDate.now();
        String ques1 = request.getParameter("ques1");
        String ques2 = request.getParameter("ques2");
        
        
        //passing values through model classes to Dao classes
        Users user = new Users(uname,fname,lname,email,pass,now,ques1,ques2);
        usersDao.newUser(user);
        
//        for history for adding users
        int userId = 1;
        String activity = "Added User";
        hisDao.insertLog(userId,activity, uname);
        response.sendRedirect("userList.jsp");
    }
    
}
