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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {
    UsersDao usersDao;

    public loginServlet() {
        this.usersDao = new UsersDao();
    }
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try {
            login(request,response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    
    public void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
        if(usersDao.login(email, pass)){
                HttpSession ses = request.getSession();
                ses.setAttribute("email",email);
                response.sendRedirect("aDashboard.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
        
    }


}
