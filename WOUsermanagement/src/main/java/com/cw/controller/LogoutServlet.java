package com.cw.controller;

import com.cw.Dao.HistoryDao;
import com.cw.model.History;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //removing values set in the session objects
            HttpSession session = request.getSession();
            int userId = (int)session.getAttribute("userId");
            String activity = "logged out";
            HistoryDao hisDao = new HistoryDao();
            History history = new History(userId, activity);
            hisDao.insertLog(history);
            
            session.removeAttribute("username");
            session.removeAttribute("userRole");
            session.removeAttribute("email");
            session.removeAttribute("password");
            session.removeAttribute("userId");
            session.invalidate();
            response.sendRedirect("index.html");
        } catch (SQLException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    }

}
