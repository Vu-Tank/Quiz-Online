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
import vuha.daos.QuizDAO;
import vuha.dtos.QuizDTO;
import vuha.dtos.UserDTO;

/**
 *
 * @author Admin
 */
public class ViewHistoryController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url="historyPage";
        try {
            HttpSession session=request.getSession();
            String dataSearch;
            if(request.getParameter("dataSearch")==null){
                dataSearch=(String) session.getAttribute("dataSearch");
            }else{
                dataSearch=request.getParameter("dataSearch");
                session.setAttribute("dataSearch", dataSearch);
            }
            int pageSize = 5;
            int pageIndex = 1;
            if (request.getParameter("pageIndex") != null) {
                pageIndex = Integer.parseInt(request.getParameter("pageIndex"));               
            }else if(session.getAttribute("pageIndex")!=null){
                pageIndex=(int) session.getAttribute("pageIndex");
            }    
            UserDTO user=(UserDTO) session.getAttribute("USER");
            
            int countQuizs =QuizDAO.countQuizHistory(dataSearch, user.getEmail());
            int pageEnd = (int) Math.ceil((float) countQuizs / pageSize);
            session.setAttribute("pageEnd", pageEnd);
            ArrayList<QuizDTO> quizs=QuizDAO.getQuizHistorys(user.getEmail(), dataSearch, pageSize, pageIndex);
            session.setAttribute("quizs", quizs);
            session.setAttribute("dataSearch", dataSearch);
            session.setAttribute("pageSize", pageSize);
            session.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageEnd", pageEnd);
        } catch (Exception e) {
            log("Error at ViewHistoryController: "+e.toString());
        }finally{
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
