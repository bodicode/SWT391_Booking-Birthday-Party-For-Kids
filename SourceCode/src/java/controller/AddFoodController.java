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
import product.AddFoodError;
import product.FoodDAO;
import product.FoodDTO;

/**
 *
 * @author User
 */
@WebServlet(name = "AddFoodController", urlPatterns = {"/AddFoodController"})
public class AddFoodController extends HttpServlet {

    private final String SUCCESS = "MainController?btAction=MoreFood";
    private final String FOODID_FORMAT = "FoodID must be in format Fxxx";
    private final String FOODID_DUPPLICATE = "FoodID is existed";
    private final String FOODNAME_DUPPLICATE = "This food is existed";
    private final String PRICE_VIOLENT = "Price must be > 0$";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        String foodID = request.getParameter("txtFoodID");
        String foodName = request.getParameter("txtFoodName");
        String foodImageURL = request.getParameter("txtFoodImageURL");
        String price = request.getParameter("price");
        AddFoodError err = new AddFoodError();
        boolean foundErr = false;
        try {
            foodName = foodName.trim();
            foodImageURL = foodImageURL.trim();
            FoodDAO dao = new FoodDAO();
            boolean checkID = dao.checkDupplicateFoodID(foodID);
            boolean checkName = dao.checkDupplicateFoodName(foodName);
            if (checkID) {
                err.setFoodIDIsExisted(FOODID_DUPPLICATE);
                foundErr = true;
            }
            if (!foodID.matches("F\\d{3}")) {
                err.setFoodIDViolent(FOODID_FORMAT);
                foundErr = true;
            }
            if (checkName) {
                err.setFoodNameIsExisted(FOODNAME_DUPPLICATE);
                foundErr = true;
            }
            float priceConvert = Float.parseFloat(price);
            if (priceConvert < 0) {
                err.setPriceViolent(PRICE_VIOLENT);
                foundErr = true;
            }
            if (foundErr) {
                request.setAttribute("ERROR_FOOD", err);
            }
            FoodDTO dto = new FoodDTO(foodID, foodName, foodImageURL, Float.parseFloat(price));
            boolean result = dao.addFood(dto);
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
