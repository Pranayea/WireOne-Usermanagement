package com.cw.controller;

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

public class showEditFormServlet extends HttpServlet {

    UsersDao usersDao;

    //intializaing object of DAO classes
    public showEditFormServlet() {
        this.usersDao = new UsersDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //getting value from jsp page
            int userId = Integer.parseInt(request.getParameter("userId"));
            
            //pAssing and setting values to jsp Page 
            Users suser = usersDao.getUser(userId);
            request.setAttribute("users", suser);
            request.getRequestDispatcher("eUserForm.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(showEditFormServlet.class.getName()).log(Level.SEVERE, null, ex);
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
