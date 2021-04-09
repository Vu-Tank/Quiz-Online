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
import vuha.daos.QuestionDAO;
import vuha.dtos.QuestionChoiceDTO;
import vuha.dtos.QuestionDTO;

/**
 *
 * @author Admin
 */
public class CreateQuestionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "createPage";
    private static final String SUCCESS = "adminPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean check = true;
            String txtQuestion = request.getParameter("txtQuestion");
            if (txtQuestion.trim().isEmpty()) {
                check = false;
                request.setAttribute("questionError", "is Empty!!!!");
            } else {
                if (txtQuestion.trim().length() > 8000) {
                    check = false;
                    request.setAttribute("questionError", "requires typing max 8000 chars!!!!");
                }
            }
            String txtAnswerCorrect = request.getParameter("txtAnswerCorrect");
            if (txtAnswerCorrect.trim().isEmpty()) {
                check = false;
                request.setAttribute("answerCorrectError", "is Empty!!!!!");
            } else {
                if (txtAnswerCorrect.trim().length() > 8000) {
                    check = false;
                    request.setAttribute("answerCorrectError", "requires typing max 8000 chars!!!!");
                }
            }
            String txtAnswer1 = request.getParameter("txtAnswer1");
            if (txtAnswer1.trim().isEmpty()) {
                check = false;
                request.setAttribute("answer1Error", "is Empty!!!!");
            }else{
                if(txtAnswer1.trim().length()>8000){
                    check=false;
                    request.setAttribute("answer1Error", "requires typing max 8000 chars!!!!");
                }
            }
            String txtAnswer2=request.getParameter("txtAnswer2");
            if(txtAnswer2.trim().isEmpty()){
                check=false;
                request.setAttribute("answer2Error", "is Empty!!!!!");
            }else{
                if(txtAnswer2.trim().length()>8000){
                    check=false;
                    request.setAttribute("answer2Error", "requires typing max 8000 chars!!!!");
                }
            }
            String txtAnswer3=request.getParameter("txtAnswer3");
            if(txtAnswer3.trim().isEmpty()){
                check=false;
                request.setAttribute("answer3Error", "is Empty!!!!!");
            }else{
                if(txtAnswer3.trim().length()>8000){
                    check=false;
                    request.setAttribute("answer3Error", "requires typing max 8000 chars!!!!");
                }
            }
            String txtSubjectID=request.getParameter("cbxsubject");
            if(check){
                ArrayList<QuestionChoiceDTO> answers=new ArrayList<>();
                answers.add(new QuestionChoiceDTO(txtAnswerCorrect, true));
                answers.add(new QuestionChoiceDTO(txtAnswer1, false));
                answers.add(new QuestionChoiceDTO(txtAnswer2, false));
                answers.add(new QuestionChoiceDTO(txtAnswer3, false));
                QuestionDTO question=new QuestionDTO(txtQuestion, txtSubjectID, false, answers);
                QuestionDAO.insertQuestion(question);
                request.setAttribute("message", "Create successful.");
                url=SUCCESS;
            }else{
                request.setAttribute("cbxsubject", txtSubjectID);
            }

        } catch (Exception e) {
            log("Error ar CreateQuestionController: " + e.toString());
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
