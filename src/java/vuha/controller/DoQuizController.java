/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuha.daos.QuizDAO;
import vuha.dtos.QuestionChoiceDTO;
import vuha.dtos.QuestionDTO;
import vuha.dtos.QuizDTO;

/**
 *
 * @author Admin
 */
public class DoQuizController extends HttpServlet {

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
        String url = "quizPage";
        try {
            HttpSession session = request.getSession();
            QuizDTO quiz = (QuizDTO) session.getAttribute("quiz");
            ArrayList<QuestionDTO> questions = quiz.getQuestions();
            if (quiz != null) {
                String userAnswer = request.getParameter("userAnswer");
                int questionIndexNow = Integer.parseInt(request.getParameter("questionIndexNow"));
                QuestionDTO question = questions.get(questionIndexNow - 1);
                int numOfCr = 0;
                if (userAnswer != null) {
                    question.setUserAnswer(userAnswer);
                    for (QuestionDTO ques : questions) {
                        for (QuestionChoiceDTO questionChoiceDTO : ques.getQuestionChoice()) {
                            if(questionChoiceDTO.getChoiceID().equals(ques.getUserAnswer())&&questionChoiceDTO.isIsRight())
                                numOfCr++;
                        }
                    }
                    quiz.setNumOfCorrect(numOfCr);
                    QuizDAO.updateAnswer(userAnswer, quiz.getQuizID(), question.getQuestionID(), quiz.getNumOfCorrect());
                }
                int questionIndex = 1;
                String btnAction = request.getParameter("btnAction");
                if (btnAction != null) {
                    if ("previous".equals(btnAction)) {
                        if (questionIndexNow > 1) {
                            questionIndex = questionIndexNow - 1;
                        }
                    } else if ("next".equals(btnAction)) {
                        if (questionIndexNow < questions.size()) {
                            questionIndex = questionIndexNow + 1;
                        }
                    } else if ("finish".equals(btnAction)) {
                        url = "studentPage";
                        QuizDAO.updateStatusQuiz(quiz.getQuizID());
                        request.setAttribute("numOfQuestion", questions.size());
                        request.setAttribute("numOfCor", quiz.getNumOfCorrect());
                        session.removeAttribute("quiz");
                        session.removeAttribute("quizStart");
                        return;
                    }
                }
                if (request.getParameter("questionIndex") != null) {
                    questionIndex = Integer.parseInt(request.getParameter("questionIndex"));
                }
                request.setAttribute("question", questions.get(questionIndex - 1));
                request.setAttribute("questionIndex", questionIndex);
                request.setAttribute("questionEnd", questions.size());
                Date quizStart = (Date) session.getAttribute("quizStart");
                Date quizEnd = new Date();
                int timer = (int) ((questions.size() * 2 * 60) - ((quizEnd.getTime() - quizStart.getTime()) / 1000));
                if (timer > 0) {
                    String m, s;
                    if ((timer / 60) < 10) {
                        m = "0" + (timer / 60);
                        request.setAttribute("m", m);
                    } else {
                        request.setAttribute("m", timer / 60);
                    }
                    if ((timer % 60) < 10) {
                        s = "0" + (timer % 60);
                        request.setAttribute("s", s);
                    } else {
                        request.setAttribute("s", timer % 60);
                    }
                }
            }
        } catch (Exception e) {
            log(("Error at DoQuizController: " + e.toString()));
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
