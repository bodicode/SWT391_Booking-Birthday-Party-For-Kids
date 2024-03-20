/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import java.io.IOException;
import utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author User
 */
public class UserDAO {

    private static final String LOGIN = "SELECT * FROM User WHERE username = ? AND UserPassword = ?";
    private static final String SINGUP = "INSERT INTO User (Username, FullName, Email, Phone, RoleID, UserPassword) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String CHECK_DUPPLICATE = "SELECT FullName FROM User WHERE Username=?";
    private static final String SHOW_ADMIN = "SELECT * FROM User WHERE RoleID = 1";
    private static final String SHOW_HOST = "SELECT * FROM User WHERE RoleID = 3";
    private static final String SHOW_CUSTOMER = "SELECT * FROM User WHERE RoleID = 2";

    public boolean deleteAccount(String username)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. create connection
            con = DBUtils.getConnection();
            if (con != null) {
                //2. create SQL string 
                String sql = "Delete From User "
                        + "Where Username = ?";
                //3. create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. execute Query
                int effectRows = stm.executeUpdate();
                //5. process
                if (effectRows > 0) {
                    result = true;
                }
            }//connection is available
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean changePassword(String username, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. Create Connection
            con = DBUtils.getConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "UPDATE User "
                        + "SET UserPassword =? "
                        + "WHERE Username =?";
                //3. Create StatementObject
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, username);
                //4. Execute Query
                int effectiveRows = stm.executeUpdate();
                //5. Process Result
                if (effectiveRows > 0) {
                    result = true;
                }
            }//end connection is available
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean updateProfile(String username, String fullName, String email, String phone) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. Create Connection
            con = DBUtils.getConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "UPDATE User "
                        + "SET FullName =?, "
                        + "Email =?, "
                        + "Phone =? "
                        + "WHERE Username =?";
                //3. Create StatementObject
                stm = con.prepareStatement(sql);
                stm.setString(1, fullName);
                stm.setString(2, email);
                stm.setString(3, phone);
                stm.setString(4, username);
                //4. Execute Query
                int effectiveRows = stm.executeUpdate();
                //5. Process Result
                if (effectiveRows > 0) {
                    result = true;
                }
            }//end connection is available
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public UserDTO checkLogin(String username, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    UserDTO dto = new UserDTO(rs.getString("Username"),
                            rs.getString("UserPassword"),
                            rs.getString("FullName"),
                            rs.getString("Phone"),
                            rs.getString("Email"),
                            rs.getInt("RoleID"));
                    return dto;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public UserGoogleDTO checkLoginGoogle(String code) throws IOException {
        String accessToken = LoginGoogleUtils.getToken(code);
        UserGoogleDTO user = LoginGoogleUtils.getUserInfo(accessToken);
        return user;
    }

    public boolean createNewAccount(UserDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(SINGUP);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getFullName());
                stm.setString(3, dto.getEmail());
                stm.setString(4, dto.getPhone());
                stm.setInt(5, dto.getRoleID());
                stm.setString(6, dto.getPassword());
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

    public boolean checkDupplicate(String username)
            throws ClassNotFoundException, SQLException, NamingException {
        boolean check = false;
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPPLICATE);
                ptm.setString(1, username);
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

    private List<UserDTO> accounts;

    public List<UserDTO> getAccounts() {
        return accounts;
    }

    public void searchUserOrFullName(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT Username, FullName, FullName, Phone, RoleID, UserPassword"
                        + "FROM User "
                        + "WHERE Username LIKE ? OR FullName LIKE ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");

                rs = stm.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("Username");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");
                    String password = rs.getString("UserPassword");
                    // Assuming you have a constructor in RegistrationDTO that accepts all these parameters
                    UserDTO dto = new UserDTO(username, password, fullName, phone, email, roleID);
                    if (this.accounts == null) {
                        this.accounts = new ArrayList<>();
                    }
                    this.accounts.add(dto);
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

    public List getUsersIsAdmin() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List listAdmin = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(SHOW_ADMIN);
                rs = stm.executeQuery();
                while (rs.next()) {
                    //5.1 get data from result set
                    String username = rs.getString("Username");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");
                    String password = "***";
                    //5.2 set data into DTO
                    listAdmin.add(new UserDTO(username, password, fullName, phone, email, roleID));
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
        return listAdmin;
    }

    public List getHost() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List listHost = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(SHOW_HOST);
                rs = stm.executeQuery();
                while (rs.next()) {
                    //5.1 get data from result set
                    String username = rs.getString("Username");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");
                    String password = "***";
                    //5.2 set data into DTO
                    listHost.add(new UserDTO(username, password, fullName, phone, email, roleID));
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
        return listHost;
    }

    public List getCustomer() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List listCustomer = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(SHOW_CUSTOMER);
                rs = stm.executeQuery();
                while (rs.next()) {
                    //5.1 get data from result set
                    String username = rs.getString("Username");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");
                    String password = "***";
                    //5.2 set data into DTO
                    listCustomer.add(new UserDTO(username, password, fullName, phone, email, roleID));
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
        return listCustomer;
    }
}
