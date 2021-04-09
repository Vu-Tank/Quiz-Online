/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuha.daos.QuestionDAO;
import vuha.dtos.QuestionDTO;

/**
 *
 * @author Admin
 */
public class SearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "errorPage";
    private static final String SUCCESS = "adminPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String typeSearch = request.getParameter("typeSearch");
            String searchData = request.getParameter("dataSearch");
            if(typeSearch.equals("nameType")){
                session.setAttribute("txtSearch", searchData);
            }
            int countQuestion = 0;
            request.setAttribute("dataSearch", searchData);
            session.setAttribute("dataSearch", searchData);
            int pageSize = 20;
            int pageIndex = 1;
            if (request.getParameter("pageIndex") != null) {
                pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
            }
            countQuestion = QuestionDAO.countQuestion(typeSearch, searchData);
            int pageEnd = (int) Math.ceil((float) countQuestion / pageSize);

            ArrayList<QuestionDTO> Questions = QuestionDAO.getQuestions(typeSearch, searchData, pageSize, pageIndex);

            request.setAttribute("QuestionS", Questions);
            request.setAttribute("pageEnd", pageEnd);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("typeSearch", typeSearch);
            
            session.setAttribute("pageIndex", pageIndex);
            session.setAttribute("typeSearch", typeSearch);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
