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
import vuha.dtos.QuestionChoiceDTO;
import vuha.dtos.QuestionDTO;

/**
 *
 * @author Admin
 */
public class UpdateQuestionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "UpdatePage";
    private static final String SUCCESS = "search";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean check = true;
            String subjectID = request.getParameter("cbxsubject");
            String txtQuestion = request.getParameter("txtQuestion");
            String txtQuestionID = request.getParameter("txtQuestionID");
            String[] txtAnswer = request.getParameterValues("txtAnswer");
            String[] txtChoiceID = request.getParameterValues("txtChoiceID");
            boolean cbxStatus = Boolean.parseBoolean(request.getParameter("cbxStatus"));
            String isRight = request.getParameter("isRight");

            if (txtQuestion.trim().isEmpty()) {
                check = false;
                request.setAttribute("message", "Question is Empty!!!!");
            }
            ArrayList<QuestionChoiceDTO> answers = new ArrayList<>();
            boolean isRightb;
            for (int i = 0; i < 4; i++) {
                isRightb = txtChoiceID[i].equals(isRight);
                if (txtAnswer[i].trim().isEmpty() && check) {
                    check = false;
                    request.setAttribute("message", "Answer is Empty!!!!");
                }
                QuestionChoiceDTO answer = new QuestionChoiceDTO(txtChoiceID[i], txtQuestionID, txtAnswer[i], isRightb);
                answers.add(answer);
            }
            if (check) {
                QuestionDTO question = new QuestionDTO(txtQuestionID, txtQuestion, subjectID, cbxStatus, answers);
                QuestionDAO.updateQuestion(question);
                request.setAttribute("message", "Update success.");
                HttpSession session=request.getSession();
                String typeSearch=(String) session.getAttribute("typeSearch");
                String dataSearch=(String) session.getAttribute("dataSearch");
                if(typeSearch.equals("nameType")){
                    dataSearch=(String) session.getAttribute("txtSearch");
                }
                int pageIndex=(int) session.getAttribute("pageIndex");
                url ="search?typeSearch="+typeSearch+"&dataSearch="+dataSearch+"&pageIndex="+pageIndex;
            } else {
                request.setAttribute("answers", answers);
                request.setAttribute("cbxsubject", subjectID);
                request.setAttribute("cbxStatus", cbxStatus);
                request.setAttribute("txtQuestion", txtQuestion);
                request.setAttribute("txtQuestionID", txtQuestionID);
            }

        } catch (Exception e) {
            log("ERROR at UpdateQuestionController: " + e.getMessage());
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
