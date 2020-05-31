package com.cw.controller;

import com.cw.Dao.UsersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResetPasswordServlet extends HttpServlet {

    UsersDao usersDao;

    public ResetPasswordServlet() {
        this.usersDao = new UsersDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String password1 = request.getParameter("pass1");
            String password2 = request.getParameter("pass2");

            if (password1.equals(password2)) {
                usersDao.resetPassword(userId, password1);
                request.setAttribute("eMessage","Your Password Has Reset! Please Login To Continue");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
