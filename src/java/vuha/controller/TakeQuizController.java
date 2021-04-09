/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuha.daos.QuestionDAO;
import vuha.daos.QuizDAO;
import vuha.dtos.QuestionDTO;
import vuha.dtos.QuizDTO;
import vuha.dtos.UserDTO;

/**
 *
 * @author Admin
 */
public class TakeQuizController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String ERROR = "studentPage";
    public static final String SUCCESS = "quizPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession(false);
            String subjectID = request.getParameter("subjectID");
            int numOfQuestion = 0;
            if (request.getParameter("numOfQuestion").trim().isEmpty()) {
                request.setAttribute("message", "Enter number of question!!!!!");
            } else {
                numOfQuestion = Integer.parseInt(request.getParameter("numOfQuestion"));
                UserDTO user = (UserDTO) session.getAttribute("USER");
                int timer = numOfQuestion * 2 * 60;

                QuizDTO quiz = (QuizDTO) session.getAttribute("quiz");
                if (quiz == null) {
                    ArrayList<QuestionDTO> question = QuestionDAO.getQuestionForQuiz(subjectID, numOfQuestion);
                    if(question.size()<numOfQuestion){
                        request.setAttribute("message", "Enough question to take a quiz");
                        return;
                    }
                    Date quizStart = new Date();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                    String createDate = dateFormat.format(quizStart);
                    quiz = new QuizDTO(null, user.getEmail(), subjectID, createDate, numOfQuestion, 0, question);
                    QuizDAO.createQuiz(quiz);
                    int questionIndex = 1;
                    session.setAttribute("quiz", quiz);
                    request.setAttribute("question", question.get(questionIndex-1));
                    request.setAttribute("questionEnd", numOfQuestion);
                    session.setAttribute("quizStart", quizStart);
                    request.setAttribute("questionIndex", questionIndex);                    
                }else{
                    Date quizStart=(Date) session.getAttribute("quizStart");
                    Date quizEnd=new Date();
                    timer=(int) ((quiz.getQuestions().size()* 2 * 60)-((quizEnd.getTime()-quizStart.getTime())/1000));
                    request.setAttribute("question", quiz.getQuestions().get(0));
                    request.setAttribute("questionEnd", quiz.getQuestions().size());
                    request.setAttribute("questionIndex", 1);   
                }
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
                    url = SUCCESS;

            }
        } catch (Exception e) {
            log("Error at TakeQuizController: " + e.toString());
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
