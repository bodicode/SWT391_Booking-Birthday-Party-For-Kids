/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

/**
 *
 * @author User
 */
public class SignUpError {

    private String usernameIsExisted;
    private String usernameLengthViolent;
    private String passwordViolent;
    private String fullNameLengthViolent;
    private String emailFormatViolent;
    private String phoneFormatViolent;
    private String confirmNotMatch;

    public SignUpError() {
    }

    public SignUpError(String usernameIsExisted, String usernameLengthViolent, String passwordViolent, String fullNameLengthViolent, String emailFormatViolent, String phoneFormatViolent, String confirmNotMatch) {
        this.usernameIsExisted = usernameIsExisted;
        this.usernameLengthViolent = usernameLengthViolent;
        this.passwordViolent = passwordViolent;
        this.fullNameLengthViolent = fullNameLengthViolent;
        this.emailFormatViolent = emailFormatViolent;
        this.phoneFormatViolent = phoneFormatViolent;
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }

    public String getUsernameLengthViolent() {
        return usernameLengthViolent;
    }

    public void setUsernameLengthViolent(String usernameLengthViolent) {
        this.usernameLengthViolent = usernameLengthViolent;
    }

    public String getPasswordViolent() {
        return passwordViolent;
    }

    public void setPasswordViolent(String passwordViolent) {
        this.passwordViolent = passwordViolent;
    }

    public String getFullNameLengthViolent() {
        return fullNameLengthViolent;
    }

    public void setFullNameLengthViolent(String fullNameLengthViolent) {
        this.fullNameLengthViolent = fullNameLengthViolent;
    }

    public String getEmailFormatViolent() {
        return emailFormatViolent;
    }

    public void setEmailFormatViolent(String emailFormatViolent) {
        this.emailFormatViolent = emailFormatViolent;
    }

    public String getPhoneFormatViolent() {
        return phoneFormatViolent;
    }

    public void setPhoneFormatViolent(String phoneFormatViolent) {
        this.phoneFormatViolent = phoneFormatViolent;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

}
