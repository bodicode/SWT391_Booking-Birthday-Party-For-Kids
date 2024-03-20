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
public class ServiceDAO implements Serializable {

    private static final String GET_ALL_SERVICE = "SELECT * FROM Services";
    private static final String ADD_SERVICE = "INSERT INTO Services (ServiceID, ServiceName, ServiceImageURL, Price) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_SERVICE = "UPDATE Services SET ServiceName = ?, ServiceImageURL = ?, Price = ? WHERE ServiceID = ?";
    private static final String DELETE_SERVICE = "DELETE FROM Services WHERE ServiceID = ?";
    List<ServiceDTO> serviceList;

    public List<ServiceDTO> getServiceList() {
        return serviceList;
    }

    public void showServiceList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ALL_SERVICE);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ServiceDTO service = new ServiceDTO(
                            rs.getString("ServiceID"),
                            rs.getString("ServiceName"),
                            rs.getString("ServiceImageURL"),
                            rs.getFloat("Price"));
                    if (this.serviceList == null) {
                        serviceList = new ArrayList<>();
                    }
                    serviceList.add(service);
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

    public boolean addService(ServiceDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ADD_SERVICE);
                stm.setString(1, dto.getServiceID());
                stm.setString(2, dto.getServiceName());
                stm.setString(3, dto.getServiceImageURL());
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

    public boolean updateService(ServiceDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_SERVICE);
                stm.setString(1, dto.getServiceName());
                stm.setString(2, dto.getServiceImageURL());
                stm.setFloat(3, dto.getPrice());
                stm.setString(4, dto.getServiceID());
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

    public boolean deleteService(String serviceID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(DELETE_SERVICE);
                stm.setString(1, serviceID);
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
