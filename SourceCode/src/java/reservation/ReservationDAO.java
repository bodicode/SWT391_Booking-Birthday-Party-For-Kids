/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import utils.DBUtils;

import javax.naming.NamingException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author huynh
 */
public class ReservationDAO implements Serializable {
    public boolean bookReservation(String reservationID, String username, String packageId,
                                     String themeId, String date, String time, String status,
                                     String note, int numberOfKids, int numberOfAdults) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. create connection
            con = DBUtils.getConnection();
            //2. create SQL string
            String sql = "Insert Into Reservation (ReservationID, WorkingDate, Total, Deposit, ReservationStatus, "
                    + "Username, NumberOfKids, NumberOfAdults, Note, ThemeID,PackageID,Time) "
                    + "Values (?,?,?,?,?,?,?,?,?,?,?,?)";
            //3. create Statement Object
            stm = con.prepareStatement(sql);
            stm.setString(1, reservationID);
            stm.setString(2, date);
            stm.setInt(3, 0);
            stm.setInt(4, 0);
            stm.setString(5, status);
            stm.setString(6, username);
            stm.setInt(7, numberOfKids);
            stm.setInt(8, numberOfAdults);
            stm.setString(9, note);
            stm.setString(10, themeId);
            stm.setString(11, packageId);
            stm.setString(12, time);
            //4. execute Query
            int effectRows = stm.executeUpdate();
            //5. process
            if (effectRows > 0) {
                result = true;
            }
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
}
