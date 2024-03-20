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
public class ServiceDTO {

    private String serviceID;
    private String serviceName;
    private String serviceImageURL;
    private float price;

    public ServiceDTO() {
    }

    public ServiceDTO(String serviceID, String serviceName, String serviceImageURL, float price) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.serviceImageURL = serviceImageURL;
        this.price = price;
    }

    public ServiceDTO(String serviceName, String serviceImageURL, float price) {
        this.serviceName = serviceName;
        this.serviceImageURL = serviceImageURL;
        this.price = price;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceImageURL() {
        return serviceImageURL;
    }

    public void setServiceImageURL(String serviceImageURL) {
        this.serviceImageURL = serviceImageURL;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
