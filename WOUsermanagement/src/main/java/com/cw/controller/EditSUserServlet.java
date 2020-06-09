package com.cw.controller;

import com.cw.Dao.HistoryDao;
import com.cw.Dao.UsersDao;
import com.cw.model.History;
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

public class EditSUserServlet extends HttpServlet {

    UsersDao usersDao;
    HistoryDao hisDao;

            //intializing object of Dao classes
    public EditSUserServlet() {
        this.usersDao = new UsersDao();
        this.hisDao = new HistoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //getting value from jsp page
            int userId = Integer.parseInt(request.getParameter("userId"));
            String username = request.getParameter("uname");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String ques1 = request.getParameter("ques1");
            String ques2 = request.getParameter("ques2");
            
//            passing values though model and DAO classes
            Users euser = new Users(userId, username, fname, lname, email, password, ques1, ques2);
            usersDao.editUser(euser);

            //for history of edit users by clients
            String activity = "Edit their info";
            History history = new History(userId, activity);
            hisDao.insertLog(history);
            request.setAttribute("message","Your Information Has Been Updated");
            request.getRequestDispatcher("cProfile.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(EditSUserServlet.class.getName()).log(Level.SEVERE, null, ex);
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
