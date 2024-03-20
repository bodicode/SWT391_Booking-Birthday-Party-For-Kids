/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.SignUpError;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author User
 */
@WebServlet(name = "SingupController", urlPatterns = {"/SingupController"})
public class SingupController extends HttpServlet {

    private final String HOME_PAGE = "home.jsp";

    private final String USERNAME_LENGTH_ERROR = "Username is required 6 - 20 characters";
    private final String USERNAME_DUPPLICATE = "Username is existed";
    private final String CONFIRM_ERROR = "Password is not matched";
    private final String FULLNAME_LENGTH_ERROR = "Fullname is required 2 - 50 characters";
    private final String PHONE_FORMAT_ERROR = "Invalid format phone";
    private final String EMAIL_FORMAT_ERROR = "Invalid format email";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        SignUpError errors = new SignUpError();
        UserDAO dao = new UserDAO();
        boolean fountErr = false;
        
        String regexEmail = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@gmail\\.com$";
        String regexPhone = "^0[0-9]{9}$";
        try {
            if (username.trim().length() < 6 || username.trim().length() > 20) {
                fountErr = true;
                errors.setUsernameLengthViolent(USERNAME_LENGTH_ERROR);
            }
            boolean checkDupplicate = dao.checkDupplicate(username);
            if(checkDupplicate){
                fountErr = true;
                errors.setUsernameIsExisted(USERNAME_DUPPLICATE);
            }
            if (!confirm.trim().equals(password)) {
                fountErr = true;
                errors.setConfirmNotMatch(CONFIRM_ERROR);
            }
            if (fullName.trim().length() < 2 || fullName.trim().length() > 50) {
                fountErr = true;
                errors.setFullNameLengthViolent(FULLNAME_LENGTH_ERROR);
            }
            if (!email.matches(regexEmail)) {
                fountErr = true;
                errors.setEmailFormatViolent(EMAIL_FORMAT_ERROR);
            }
            if (!phone.matches(regexPhone)) {
                fountErr = true;
                errors.setPhoneFormatViolent(PHONE_FORMAT_ERROR);
            }
            if (fountErr) {
                request.setAttribute("ERROR_SIGNUP", errors);
                return;
            }
            
            username = username.trim();
            password = password.trim();
            UserDTO dto = new UserDTO(username, password, fullName, phone, email, 2);
            boolean result = dao.createNewAccount(dto);
            if (result) {
                url = HOME_PAGE;
            }
        } catch (Exception e) {
            log("Error at SingupController: " + e.getMessage());
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
