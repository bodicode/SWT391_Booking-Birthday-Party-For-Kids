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
public class AddFoodError {

    private String foodIDIsExisted;
    private String foodIDViolent;
    private String foodNameIsExisted;
    private String FoodImageURLViolent;
    private String priceViolent;

    public AddFoodError(String foodIDIsExisted, String foodIDViolent, String foodNameIsExisted, String FoodImageURLViolent, String priceViolent) {
        this.foodIDIsExisted = foodIDIsExisted;
        this.foodIDViolent = foodIDViolent;
        this.foodNameIsExisted = foodNameIsExisted;
        this.FoodImageURLViolent = FoodImageURLViolent;
        this.priceViolent = priceViolent;
    }

    public AddFoodError() {
    }

    public String getFoodIDIsExisted() {
        return foodIDIsExisted;
    }

    public void setFoodIDIsExisted(String foodIDIsExisted) {
        this.foodIDIsExisted = foodIDIsExisted;
    }

    public String getFoodIDViolent() {
        return foodIDViolent;
    }

    public void setFoodIDViolent(String foodIDViolent) {
        this.foodIDViolent = foodIDViolent;
    }

    public String getFoodNameIsExisted() {
        return foodNameIsExisted;
    }

    public void setFoodNameIsExisted(String foodNameIsExisted) {
        this.foodNameIsExisted = foodNameIsExisted;
    }

    public String getFoodImageURLViolent() {
        return FoodImageURLViolent;
    }

    public void setFoodImageURLViolent(String FoodImageURLViolent) {
        this.FoodImageURLViolent = FoodImageURLViolent;
    }

    public String getPriceViolent() {
        return priceViolent;
    }

    public void setPriceViolent(String priceViolent) {
        this.priceViolent = priceViolent;
    }

}
