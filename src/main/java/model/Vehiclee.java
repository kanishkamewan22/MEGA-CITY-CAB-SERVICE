package model;

public class Vehiclee {

    private String vehicleName;
    private String vehicleModel;
    private String vehicleType;
    private String fuelType;
    private int modelYear;
    private String engineSize;
    private double price;
    private byte[] vehiclePhoto; 
    private byte[] vehiclePhototwo;

    // Constructor
    public Vehiclee(String vehicleName, String vehicleModel, String vehicleType, String fuelType, int modelYear, String engineSize, double price,byte[] vehiclePhoto, byte[] vehiclePhototwo) {
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

    // Getters and Setters
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

    public byte[] getVehiclePhoto() {
        return vehiclePhoto;
    }

    public void setVehiclePhoto(byte[] vehiclePhoto) {
        this.vehiclePhoto = vehiclePhoto;
    }


    public byte[] getVehiclePhototwo() {
        return vehiclePhototwo;
    }

    public void setVehiclePhototwo(byte[] vehiclePhototwo) {
        this.vehiclePhototwo = vehiclePhototwo;
    }
}
