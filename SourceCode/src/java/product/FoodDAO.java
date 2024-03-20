/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author User
 */
public class FoodDAO implements Serializable {

    private static final String GET_ALL_FOOD = "SELECT * FROM Food";
    private static final String ADD_FOOD = "INSERT INTO Food (FoodID, FoodName, FoodImageURL, Price) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_FOOD = "UPDATE Food SET FoodName = ?, FoodImageURL = ?, Price = ? WHERE FoodID = ?";
    private static final String DELETE_FOOD = "DELETE FROM Food WHERE FoodID = ?";
    private static final String CHECK_DUPPLICATE_FOOD_ID = "SELECT FoodName FROM Food WHERE FoodID = ?";
    private static final String CHECK_DUPPLICATE_FOOD_NAME = "SELECT FoodName FROM Food WHERE foodName =?";

    List<FoodDTO> foodList;

    public List<FoodDTO> getFoodList() {
        return foodList;
    }

    public void showFoodList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ALL_FOOD);
                rs = stm.executeQuery();
                while (rs.next()) {
                    FoodDTO food = new FoodDTO(
                            rs.getString("FoodID"),
                            rs.getString("FoodName"),
                            rs.getString("FoodImageURL"),
                            rs.getFloat("Price"));
                    if (this.foodList == null) {
                        foodList = new ArrayList<>();
                    }
                    foodList.add(food);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean addFood(FoodDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ADD_FOOD);
                stm.setString(1, dto.getFoodID());
                stm.setString(2, dto.getFoodName());
                stm.setString(3, dto.getFoodImageURL());
                stm.setFloat(4, dto.getPrice());
                int affactedRow = stm.executeUpdate();
                if (affactedRow > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateFood(FoodDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_FOOD);
                stm.setString(1, dto.getFoodName());
                stm.setString(2, dto.getFoodImageURL());
                stm.setFloat(3, dto.getPrice());
                stm.setString(4, dto.getFoodID());
                int affactedRow = stm.executeUpdate();
                if (affactedRow > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteFood(String foodID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(DELETE_FOOD);
                stm.setString(1, foodID);
                int affactedRow = stm.executeUpdate();
                if (affactedRow > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean checkDupplicateFoodID(String foodID) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPPLICATE_FOOD_ID);
                ptm.setString(1, foodID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDupplicateFoodName(String foodName) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPPLICATE_FOOD_NAME);
                ptm.setString(1, foodName);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
