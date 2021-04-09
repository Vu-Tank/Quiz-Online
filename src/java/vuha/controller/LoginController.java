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
import vuha.daos.QuizDAO;
import vuha.daos.SubjectDAO;
import vuha.daos.UserDAO;
import vuha.dtos.QuizDTO;
import vuha.dtos.SubjectDTO;
import vuha.dtos.UserDTO;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR="loginPage";
    private static final String SUCCESSAD="adminPage";
    private static final String SUCCESSSD="studentPage";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            boolean check=true;
            String txtEmail=request.getParameter("txtEmail");
            if(txtEmail.isEmpty()){
                check=false;
                request.setAttribute("emailError", "Email is empty!!!!");
            }
            String txtPassword=request.getParameter("txtPassword");
            if(txtPassword.isEmpty()){
                check=false;
                request.setAttribute("passwordError", "Password is empty!!!!");
            }
            if(check){
                UserDTO user=UserDAO.checkLogin(txtEmail, txtPassword);
                if(user!=null){
                    HttpSession session=request.getSession();
                    session.setAttribute("USER", user);
                    if("AD".equals(user.getRoleID())){
                        url=SUCCESSAD;
                    }else if("SD".equals(user.getRoleID())){                      
                        QuizDTO quiz=QuizDAO.getQuizOut(txtEmail);
                        if(quiz!=null){
                            session.setAttribute("quiz", quiz);
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            Date quizStart=dateFormat.parse(quiz.getQuizDate());
                            session.setAttribute("quizStart", quizStart);
                        }
                        url=SUCCESSSD;
                    }
                    ArrayList<SubjectDTO> list=SubjectDAO.getListSubjects();
                    session.setAttribute("subjectList", list);
                }else{
                    request.setAttribute("loginError", "Account is not found!!!!");
                }
                
            }
        } catch (Exception e) {
            log("Erorr at LoginController: "+e.toString());
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
