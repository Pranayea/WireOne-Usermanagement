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

public class CheckQuestionServlet extends HttpServlet {
    UsersDao usersDao;  

    public CheckQuestionServlet() {
        this.usersDao = new UsersDao();
    }

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String ques1 = request.getParameter("ques1");
            String ques2 = request.getParameter("ques2");
            int validate = usersDao.securityPassword(email, ques1, ques2);            
            if(validate!=0){
                request.setAttribute("userId",validate);
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);                
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(CheckQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
