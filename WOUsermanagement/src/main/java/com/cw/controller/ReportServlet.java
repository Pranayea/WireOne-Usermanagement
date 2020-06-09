package com.cw.controller;

import com.cw.Dao.HistoryDao;
import com.cw.model.ReportAndHistory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportServlet extends HttpServlet {

    HistoryDao hisDao;

    //intializing object of Dao classes
    public ReportServlet() {
        this.hisDao = new HistoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //getting values from jsp page
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String activity = request.getParameter("activity");

            //getting values from dao class
            List<ReportAndHistory> report = hisDao.generateReport(sDate, eDate, activity);
            request.setAttribute("report", report);
            request.getRequestDispatcher("Report.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ReportServlet.class.getName()).log(Level.SEVERE, null, ex);
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
