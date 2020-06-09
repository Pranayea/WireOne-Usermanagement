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

public class DeleteUserServlet extends HttpServlet {

    UsersDao usersDao;
    HistoryDao hisDao;
    
        //intializing object of Dao classes
    public DeleteUserServlet() {
        this.usersDao = new UsersDao();
        this.hisDao = new HistoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        Users deletedUser;
        try {
//            passing values through model and Dao class
            deletedUser = usersDao.getUser(userId);
            String username = deletedUser.getUserName();

            usersDao.deleteUser(userId);

//        for delete historylog
            int superUser = 1;
            String activity = "Deleted user";
            hisDao.insertLog(superUser, activity, username);
            
            response.sendRedirect("userList.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
