/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vuha.daos.UserDAO;
import vuha.dtos.UserDTO;
import vuha.dtos.UserErrorDTO;

/**
 *
 * @author Admin
 */
public class RegistrationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String SUCCESS = "loginPage";
    public static final String ERROR = "registrationPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean check = true;
            UserErrorDTO userError = new UserErrorDTO("", "", "", "", "");
            String txtEmail = request.getParameter("txtEmail");
            if (txtEmail.isEmpty()) {
                userError.setEmailError("Email is empty!!!!");
                check = false;
            } else {
                if (!txtEmail.matches("^[a-zA-Z][\\w-]*[a-zA-Z0-9]+@(([a-zA-Z0-9]+\\.[a-zA-Z0-9]+)|([a-zA-Z0-9]+\\.[a-zA-Z0-9]{2,}\\.[a-zA-Z0-9]{2,}))$")) {
                    userError.setEmailError("Email wrong format!!!!");
                    check = false;
                } else {
                    if (txtEmail.split("@")[0].length() > 64) {
                        check = false;
                        userError.setEmailError("Email has local part requires typing max 64 chars!!!!");
                    } else {
                        if (txtEmail.split("@")[1].length() > 255) {
                            check = false;
                            userError.setEmailError("Email has domain part requires typing max 255 chars!!!!");
                        }
                    }
                }
            }
            String txtFullName = request.getParameter("txtFullName");
            if (txtFullName.isEmpty()) {
                userError.setFullNameError("Full Name is empty!!!!");
                check = false;
            } else {
                if (txtFullName.trim().length() > 50 || txtFullName.trim().length() < 6) {
                    check = false;
                    userError.setFullNameError("Full Name requires typing from 6 to 50 chars!!!!");
                }
            }
            String txtPassword = request.getParameter("txtPassword");
            if (txtPassword.isEmpty()) {
                userError.setPasswordError("Password is empty!!!!");
                check = false;
            } else {
                if (txtPassword.length() < 6 || txtPassword.length() > 100) {
                    check = false;
                    userError.setPasswordError("Password requires typing from 6 to 100 chars!!!!");
                } else {
                    String txtConfirm = request.getParameter("txtConfirm");
                    if (txtConfirm.isEmpty() || !txtConfirm.equals(txtPassword)) {
                        check = false;
                        userError.setPasswordConfirmError("Password not match");
                    }
                }
            }
            if (check) {
                UserDTO user = new UserDTO(txtEmail.trim(), txtFullName.trim(), txtPassword, "SD", "NEW");
                UserDAO.insertNewUser(user);
                request.setAttribute("MESSAGE", "Registration successful.");
                url = SUCCESS;
            } else {
                request.setAttribute("registrationError", userError);
            }

        } catch (Exception e) {
            log("Error at RegistrationController: " + e.toString());
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
