/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.PackageDAO;
import product.PackageDTO;

/**
 *
 * @author User
 */
@WebServlet(name = "AddPackageController", urlPatterns = {"/AddPackageController"})
public class AddPackageController extends HttpServlet {

    private final String SUCCESS = "MainController?btAction=MorePackage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        String packageName = request.getParameter("txtPackageName");
        String packageImageURL = request.getParameter("txtPackageImageURL");
        String packageDescription = request.getParameter("txtPackageDescription");
        String price = request.getParameter("price");
        try {
            packageName = packageName.trim();
            packageImageURL = packageImageURL.trim();
            packageDescription = packageDescription.trim();
            PackageDAO dao = new PackageDAO();
            PackageDTO dto = new PackageDTO(packageName, packageDescription, Float.parseFloat(price), packageImageURL);
            boolean result = dao.addPackage(dto);
            if (result) {
                url = SUCCESS;
            }
        } catch (SQLException e) {
            log("SQLException at AddFoodController: " + e.getMessage());
        } catch (NamingException e) {
            log("NamingException at AddFoodController: " + e.getMessage());
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
