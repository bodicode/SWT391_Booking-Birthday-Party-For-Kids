/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

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
public class PackageDAO {

    private static final String GET_ALL_PACKAGE = "SELECT * FROM Package";
    private static final String ADD_PACKAGE = "INSERT INTO Package (PackageID, PackageName, Description, Price, ImagePackageURL, maxGuests) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PACKAGE = "UPDATE Package SET PackageName = ?, Description = ?, Price = ?, ImagePackageURL = ?, maxGuests = ? WHERE PackageID = ?";
    private static final String DELETE_PACKAGE = "DELETE FROM Package WHERE PackageID = ?";

    List<PackageDTO> packageList;

    public List<PackageDTO> getPackageList() {
        return packageList;
    }

    public void showPackageList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ALL_PACKAGE);
                rs = stm.executeQuery();
                while (rs.next()) {
                    PackageDTO dto = new PackageDTO(
                            rs.getString("PackageID"),
                            rs.getString("PackageName"),
                            rs.getString("Description"),
                            rs.getFloat("Price"),
                            rs.getString("ImagePackageURL"),
                            rs.getInt("maxGuests"));
                    if (this.packageList == null) {
                        packageList = new ArrayList<>();
                    }
                    packageList.add(dto);
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

    public boolean addPackage(PackageDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ADD_PACKAGE);
                stm.setString(1, dto.getPackageID());
                stm.setString(2, dto.getPackageName());
                stm.setString(3, dto.getPackageDescription());
                stm.setFloat(4, dto.getPrice());
                stm.setString(5, dto.getPackageImageURL());
                stm.setInt(6, dto.getMaxGuests());
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

    public boolean updatePackage(PackageDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_PACKAGE);
                stm.setString(1, dto.getPackageName());
                stm.setString(2, dto.getPackageDescription());
                stm.setFloat(3, dto.getPrice());
                stm.setString(4, dto.getPackageImageURL());
                stm.setInt(5, dto.getMaxGuests());
                stm.setString(6, dto.getPackageID());
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

    public boolean deletePackage(String packageID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(DELETE_PACKAGE);
                stm.setString(1, packageID);
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
