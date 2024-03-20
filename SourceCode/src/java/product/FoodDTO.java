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
public class FoodDTO implements Serializable {

    private String foodID;
    private String FoodName;
    private String FoodImageURL;
    private float price;

    public FoodDTO() {
    }

    public FoodDTO(String FoodName, String FoodImageURL, float price) {
        this.FoodName = FoodName;
        this.FoodImageURL = FoodImageURL;
        this.price = price;
    }

    public FoodDTO(String foodID, String FoodName, String FoodImageURL, float price) {
        this.foodID = foodID;
        this.FoodName = FoodName;
        this.FoodImageURL = FoodImageURL;
        this.price = price;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public String getFoodName() {
        return FoodName;
    }

    public void setFoodName(String FoodName) {
        this.FoodName = FoodName;
    }

    public String getFoodImageURL() {
        return FoodImageURL;
    }

    public void setFoodImageURL(String FoodImageURL) {
        this.FoodImageURL = FoodImageURL;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

}
