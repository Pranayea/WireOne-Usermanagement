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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UnblockUserServlet extends HttpServlet {

    UsersDao usersDao;
    HistoryDao hisDao;

    //Intializing object of Dao classes
    public UnblockUserServlet() {
        this.usersDao = new UsersDao();
        this.hisDao = new HistoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //getting value from jsp page
            int userId = Integer.parseInt(request.getParameter("userId"));
            Users blockedUser = usersDao.getUser(userId);
            String userName = blockedUser.getUserName();

            //Pasing value in dao CLass
            usersDao.unblockUser(userId);

//            for blocked user's history
            int superUser = 1;
            String activity = "Unblocked User";
            hisDao.insertLog(superUser, activity, userName);
            response.sendRedirect("userList.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(BlockUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
