package com.cw.controller;

import com.cw.Dao.HistoryDao;
import com.cw.Dao.UsersDao;
import com.cw.model.History;
import com.cw.model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterLoginServlet extends HttpServlet {

    UsersDao usersDao;
    HistoryDao hisDao;

    public RegisterLoginServlet() {
        this.usersDao = new UsersDao();
        this.hisDao = new HistoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            userAuthenticate(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    public void userAuthenticate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String uname = request.getParameter("uname");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        LocalDate now = LocalDate.now();
        String ques1 = request.getParameter("ques1");
        String ques2 = request.getParameter("ques2");
        String submitType = request.getParameter("submit");
        Users user = usersDao.getSUser(email, pass);

        if (submitType.equals("Login")) {
            if (usersDao.login(email, pass)) {
                HttpSession session = request.getSession();
                String username = user.getUserName();
                String userRole = user.getStatus();

//                creating session and setting attributes
                session.setAttribute("email", email);
                if (user.getuRole().equals("admin")) {
                    session.setAttribute("username", username);
                    session.setAttribute("email", email);
                    session.setAttribute("password", pass);
                    //                for HistoryLog
                    int userId = user.getUserId();
                    session.setAttribute("userId", userId);
                    String activity = "logged in the system";
                    History history = new History(userId, activity);
                    hisDao.insertLog(history);
                    response.sendRedirect("aDashboard.jsp");
                } else if (user.getuRole().equals("client")) {
                    if (userRole.equals("active")) {
                        session.setAttribute("username", username);
                        //                for HistoryLog
                        int userId = user.getUserId();
                        session.setAttribute("userId", userId);
                        String activity = "logged in the system ";
                        History history = new History(userId, activity);
                        hisDao.insertLog(history);
                        session.setAttribute("userId", userId);
                        session.setAttribute("email", email);
                        session.setAttribute("password", pass);
                        response.sendRedirect("cDashboard.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                } else {
                    request.setAttribute("eMessage", "Login Failed Please check your email and password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("eMessage", "Login Failed Please check your email and password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

//            For Registration
        } else if (submitType.equals("Register")) {
            Users nuser = new Users(uname, fname, lname, email, pass, now, ques1, ques2);
            usersDao.register(nuser);
            Users user1 = usersDao.getSUser(email, pass);

//            For History
            int userId = user1.getUserId();
            String activity = "registered in the system";
            History history = new History(userId, activity);
            hisDao.insertLog(history);
            request.setAttribute("sMessage", "Registration Succesfull!! Please Login to Continue");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else {
            request.setAttribute("eMessage", "Login Failed Please check your email and password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}
