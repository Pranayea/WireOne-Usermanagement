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

public class BlockUserServlet extends HttpServlet {
    UsersDao usersDao;

    public BlockUserServlet() {
        this.usersDao = new UsersDao();
    }
    
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            usersDao.blockUser(userId);
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
