package model;

import java.io.InputStream;

public class Vehicle {

    private int id;
    private String vehicleName;
    private String vehicleModel;
    private String vehicleType;
    private String fuelType;
    private int modelYear;
    private String engineSize;
    private double price;
    private InputStream vehiclePhoto; 
    private InputStream vehiclePhototwo;// Change String to InputStream for BLOB data
 
    // Constructor to initialize all fields, including InputStream for images
    public Vehicle(int id, String vehicleName, String vehicleModel, String vehicleType, String fuelType, 
                   int modelYear, String engineSize, double price, InputStream vehiclePhoto,InputStream vehiclePhototwo) {
        this.id = id;
        this.vehicleName = vehicleName;
        this.vehicleModel = vehicleModel;
        this.vehicleType = vehicleType;
        this.fuelType = fuelType;
        this.modelYear = modelYear;
        this.engineSize = engineSize;
        this.price = price;
        this.vehiclePhoto = vehiclePhoto;
        this.vehiclePhototwo = vehiclePhototwo;
       
    }

    // Getters and setters for all fields

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public String getVehicleModel() {
        return vehicleModel;
    }

    public void setVehicleModel(String vehicleModel) {
        this.vehicleModel = vehicleModel;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public int getModelYear() {
        return modelYear;
    }

    public void setModelYear(int modelYear) {
        this.modelYear = modelYear;
    }

    public String getEngineSize() {
        return engineSize;
    }

    public void setEngineSize(String engineSize) {
        this.engineSize = engineSize;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public InputStream getVehiclePhoto() {
        return vehiclePhoto;
    }

    public void setVehiclePhoto(InputStream vehiclePhoto) {
        this.vehiclePhoto = vehiclePhoto;
    }

    public InputStream getvehiclePhototwo() {
        return vehiclePhototwo;
    }

    public void setvehiclePhototwo(InputStream vehiclePhototwo) {
        this.vehiclePhototwo = vehiclePhototwo;
    }

}
