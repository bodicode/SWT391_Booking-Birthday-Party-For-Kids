package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGIN_GOOGLE_CONTROLLER = "LoginGoogleController";
    private static final String HOME_PAGE = "home.jsp";
    private static final String SIGNUP_PAGE = "signup.jsp";
    private static final String SIGNUP_CONTROLLER = "SingupController";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String EDIT_PROFILE_CONTROLLER = "EditProfileController";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePasswordController";
    private static final String DELETE_PROFILE_CONTROLLER = "DeleteProfileController";

   
    private static final String BOOK_CONTROLLER = "BookController";

    private static final String SHOW_MENU_CONTROLLER = "ShowFoodController";
    private static final String SHOW_SERVICE_CONTROLLER = "ShowServiceController";
    private static final String SHOW_THEME_CONTROLLER = "ShowThemeController";
    private static final String SHOW_PACKAGE_CONTROLLER = "ShowPackageController";
    private static final String SHOW_ADMIN_CONTROLLER = "ShowUsersIsAdminController";
    private static final String SHOW_HOST_CONTROLLER = "ShowHostController";
    private static final String SHOW_CUSTOMER_CONTROLLER = "ShowCustomerController";
    private static final String ADD_FOOD_CONTROLLER = "AddFoodController";
    private static final String ADD_SERVICE_CONTROLLER = "AddServiceController";
    private static final String ADD_THEME_CONTROLLER = "AddThemeController";
    private static final String ADD_PACKAGE_CONTROLLER = "AddPackageController";
    private static final String DELETE_SERVICE_CONTROLLER = "DeleteServiceController";
    private static final String DELETE_FOOD_CONTROLLER = "DeleteFoodController";
    private static final String DELETE_THEME_CONTROLLER = "DeleteThemeController";
    private static final String UPDATE_FOOD_CONTROLLER = "UpdateFoodController";
    private static final String UPDATE_SERVICE_CONTROLLER = "UpdateServiceController";
    private static final String UPDATE_THEME_CONTROLLER = "UpdateThemeController";
    private static final String UPDATE_PACKAGE_CONTROLLER = "UpdatePackageController";
    private static final String DELETE_PACKAGE_CONTROLLER = "DeletePackageController";
    private static final String SHOW_FOOD_ADMIN_CONTROLLER = "ShowFoodAdminController";
    private static final String SHOW_SERVICE_ADMIN_CONTROLLER = "ShowServiceAdminController";
    private static final String SHOW_THEME_ADMIN_CONTROLLER = "ShowThemeAdminController";
    private static final String SHOW_PACKAGE_ADMIN_CONTROLLER = "ShowPackageAdminController";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String btAction = request.getParameter("btAction");
        String url = LOGIN_PAGE;
        try {
            if (btAction == null) {
                url = HOME_PAGE;
            } else if (btAction.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (btAction.equals("GoogleLogin")) {
                url = LOGIN_GOOGLE_CONTROLLER;
            } else if (btAction.equals("Singup")) {
                url = SIGNUP_PAGE;
            } else if (btAction.equals("Create account")) {
                url = SIGNUP_CONTROLLER;
            } else if (btAction.equals("Logout")) {
                url = LOGOUT_CONTROLLER;
            } else if (btAction.equals("editProfile")) {
                url = EDIT_PROFILE_CONTROLLER;
            } else if (btAction.equals("changePassword")) {
                url = CHANGE_PASSWORD_CONTROLLER;
            } else if (btAction.equals("deleteProfile")) {
                url = DELETE_PROFILE_CONTROLLER;
            } else if (btAction.equals("MoreFood")) {
                url = SHOW_MENU_CONTROLLER;

            } else if (btAction.equals("Book")) {
                url = BOOK_CONTROLLER;

            } else if (btAction.equals("MoreService")) {
                url = SHOW_SERVICE_CONTROLLER;
            } else if (btAction.equals("MoreTheme")) {
                url = SHOW_THEME_CONTROLLER;
            } else if (btAction.equals("MorePackage")) {
                url = SHOW_PACKAGE_CONTROLLER;
            } else if (btAction.equals("Add Food")) {
                url = ADD_FOOD_CONTROLLER;
            } else if (btAction.equals("Add Service")) {
                url = ADD_SERVICE_CONTROLLER;
            } else if (btAction.equals("Add Theme")) {
                url = ADD_THEME_CONTROLLER;
            } else if (btAction.equals("Add Package")) {
                url = ADD_PACKAGE_CONTROLLER;
            } else if (btAction.equals("Update Service")) {
                url = UPDATE_SERVICE_CONTROLLER;
            } else if (btAction.equals("Delete Service")) {
                url = DELETE_SERVICE_CONTROLLER;
            } else if (btAction.equals("Update Food")) {
                url = UPDATE_FOOD_CONTROLLER;
            } else if (btAction.equals("Delete Food")) {
                url = DELETE_FOOD_CONTROLLER;
            } else if (btAction.equals("Delete Theme")) {
                url = DELETE_THEME_CONTROLLER;
            } else if (btAction.equals("Update Theme")) {
                url = UPDATE_THEME_CONTROLLER;
            } else if (btAction.equals("Update Package")) {
                url = UPDATE_PACKAGE_CONTROLLER;
            } else if (btAction.equals("Delete Package")) {
                url = UPDATE_PACKAGE_CONTROLLER;
            } else if (btAction.equals("ShowAdmin")) {
                url = SHOW_ADMIN_CONTROLLER;
            } else if (btAction.equals("ShowHost")) {
                url = SHOW_HOST_CONTROLLER;
            } else if (btAction.equals("ShowCustomer")) {
                url = SHOW_CUSTOMER_CONTROLLER;
            } else if (btAction.equals("MoreFoodAdmin")) {
                url = SHOW_FOOD_ADMIN_CONTROLLER;
            } else if (btAction.equals("MoreServiceAdmin")) {
                url = SHOW_SERVICE_ADMIN_CONTROLLER;
            } else if (btAction.equals("MoreThemeAdmin")) {
                url = SHOW_THEME_ADMIN_CONTROLLER;
            } else if (btAction.equals("MorePackageAdmin")) {
                url = SHOW_PACKAGE_ADMIN_CONTROLLER;

            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
