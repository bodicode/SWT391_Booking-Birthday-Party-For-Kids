/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author User
 */
public class PackageDTO {

    private String packageID;
    private String packageName;
    private String packageDescription;
    private float price;
    private String packageImageURL;
    private int maxGuests;

    public PackageDTO() {
    }

    public PackageDTO(String packageID, String packageName, String packageDescription, float price, String packageImageURL, int maxGuests) {
        this.packageID = packageID;
        this.packageName = packageName;
        this.packageDescription = packageDescription;
        this.price = price;
        this.packageImageURL = packageImageURL;
        this.maxGuests = maxGuests;
    }

    public PackageDTO(String packageName, String packageDescription, float price, String packageImageURL) {
        this.packageName = packageName;
        this.packageDescription = packageDescription;
        this.price = price;
        this.packageImageURL = packageImageURL;
    }

    public int getMaxGuests() {
        return maxGuests;
    }

    public void setMaxGuests(int maxGuests) {
        this.maxGuests = maxGuests;
    }

    public String getPackageID() {
        return packageID;
    }

    public void setPackageID(String packageID) {
        this.packageID = packageID;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getPackageDescription() {
        return packageDescription;
    }

    public void setPackageDescription(String packageDescription) {
        this.packageDescription = packageDescription;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPackageImageURL() {
        return packageImageURL;
    }

    public void setPackageImageURL(String packageImageURL) {
        this.packageImageURL = packageImageURL;
    }

}
