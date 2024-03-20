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
public class ThemeDAO implements Serializable {

    private static final String GET_ALL_THEME = "SELECT * FROM Theme";
    private static final String ADD_THEME = "INSERT INTO Theme (ThemeID, ThemeName, ThemeImageURL, ThemeTypeID) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_THEME = "UPDATE Theme SET ThemeName = ?, ThemeImageURL = ?, ThemeTypeID = ? WHERE ThemeID = ?";
    private static final String DELETE_THEME = "DELETE FROM Theme WHERE ThemeID = ?";

    List<ThemeDTO> themeList;

    public List<ThemeDTO> getThemeList() {
        return themeList;
    }

    public void showThemeList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ALL_THEME);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ThemeDTO theme = new ThemeDTO(
                            rs.getString("ThemeID"),
                            rs.getString("ThemeName"),
                            rs.getString("ThemeImageURL"),
                            rs.getInt("ThemeTypeID"));
                    if (this.themeList == null) {
                        themeList = new ArrayList<>();
                    }
                    themeList.add(theme);
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

    public boolean addTheme(ThemeDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ADD_THEME);
                stm.setString(1, dto.getThemeID());
                stm.setString(2, dto.getThemeName());
                stm.setString(3, dto.getThemeImageURL());
                stm.setInt(4, dto.getThemeType());
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

    public boolean updateTheme(ThemeDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_THEME);
                stm.setString(1, dto.getThemeName());
                stm.setString(2, dto.getThemeImageURL());
                stm.setInt(3, dto.getThemeType());
                stm.setString(4, dto.getThemeID());
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

    public boolean deleteTheme(String themeID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(DELETE_THEME);
                stm.setString(1, themeID);
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
}
