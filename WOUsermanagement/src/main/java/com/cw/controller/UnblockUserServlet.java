/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

public class UnblockUserServlet extends HttpServlet {

    UsersDao usersDao;

    public UnblockUserServlet() {
        this.usersDao = new UsersDao();
    }
    
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            usersDao.unblockUser(userId);
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
