
package com.cw.controller;

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


public class EditUserServlet extends HttpServlet {
    UsersDao usersDao;

    public EditUserServlet() {
        this.usersDao = new UsersDao();
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            editUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
        
    public void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
        int userId = Integer.parseInt(request.getParameter("userId")); 
        String username = request.getParameter("uname");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String ques1 = request.getParameter("ques1");
        String ques2 = request.getParameter("ques2");
        
        Users euser = new Users(userId,username,fname,lname,email,password,ques1,ques2);
        usersDao.editUser(euser);
        response.sendRedirect("userList.jsp");
            }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
