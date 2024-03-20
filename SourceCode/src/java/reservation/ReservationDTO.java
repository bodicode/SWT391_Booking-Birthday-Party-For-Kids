/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import java.io.Serializable;

/**
 *
 * @author huynh
 */
public class ReservationDTO implements Serializable {
    private String reservationID;
    private String username;
    private String packageId;
    private String themeId;
    private String date;
    private String time;
    private String status;
    private String note;
    private int numberOfKids;
    private int numberOfAdults;

    public ReservationDTO(String reservationID, String username, String packageId, String themeId, String date, String time, String status, String note, int numberOfKids, int numberOfAdults) {
        this.reservationID = reservationID;
        this.username = username;
        this.packageId = packageId;
        this.themeId = themeId;
        this.date = date;
        this.time = time;
        this.status = status;
        this.note = note;
        this.numberOfKids = numberOfKids;
        this.numberOfAdults = numberOfAdults;
    }

    /**
     * @return the reservationID
     */
    public String getReservationID() {
        return reservationID;
    }

    /**
     * @param reservationID the reservationID to set
     */
    public void setReservationID(String reservationID) {
        this.reservationID = reservationID;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the packageId
     */
    public String getPackageId() {
        return packageId;
    }

    /**
     * @param packageId the packageId to set
     */
    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    /**
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the numberOfKids
     */
    public int getNumberOfKids() {
        return numberOfKids;
    }

    /**
     * @param numberOfKids the numberOfKids to set
     */
    public void setNumberOfKids(int numberOfKids) {
        this.numberOfKids = numberOfKids;
    }

    /**
     * @return the numberOfAdults
     */
    public int getNumberOfAdults() {
        return numberOfAdults;
    }

    /**
     * @param numberOfAdults the numberOfAdults to set
     */
    public void setNumberOfAdults(int numberOfAdults) {
        this.numberOfAdults = numberOfAdults;
    }

   

}
