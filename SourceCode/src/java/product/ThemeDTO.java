/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class ThemeDTO implements Serializable {

    private String themeID;
    private String themeName;
    private String themeDescription;
    private String themeImageURL;
    private int themeType;

    public ThemeDTO() {
    }

    public ThemeDTO(String themeName, String themeImageURL, int themeType) {
        this.themeName = themeName;
        this.themeImageURL = themeImageURL;
        this.themeType = themeType;
    }

    public ThemeDTO(String themeID, String themeName, String themeImageURL, int themeType) {
        this.themeID = themeID;
        this.themeName = themeName;
        this.themeImageURL = themeImageURL;
        this.themeType = themeType;
    }

    public String getThemeID() {
        return themeID;
    }

    public void setThemeID(String themeID) {
        this.themeID = themeID;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public String getThemeDescription() {
        return themeDescription;
    }

    public void setThemeDescription(String themeDescription) {
        this.themeDescription = themeDescription;
    }

    public String getThemeImageURL() {
        return themeImageURL;
    }

    public void setThemeImageURL(String themeImageURL) {
        this.themeImageURL = themeImageURL;
    }

    public int getThemeType() {
        return themeType;
    }

    public void setThemeType(int themeType) {
        this.themeType = themeType;
    }
}
