public class Vehicle {
    private VehicleType type;
    private String registrationNumber, model, color, driverName;
    private long parkedTime;

    public Vehicle(VehicleType type, String regNo, String model, String color, String driverName) {
        this.type = type;
        this.registrationNumber = regNo;
        this.model = model;
        this.color = color;
        this.driverName = driverName;
        this.parkedTime = System.currentTimeMillis();
    }

    public VehicleType getType() {
        return type;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public String getModel() {
        return model;
    }

    public String getColor() {
        return color;
    }

    public String getDriverName() {
        return driverName;
    }

    public long getParkedTime() {
        return parkedTime;
    }
}
