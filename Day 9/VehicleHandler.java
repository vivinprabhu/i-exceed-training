public interface VehicleHandler {
    double calculateFee(long hours);
}



class TruckHandler implements VehicleHandler {
    public double calculateFee(long hours) {
        return hours * 30;
    }
}

class BikeHandler implements VehicleHandler {
    public double calculateFee(long hours) {
        return hours * 10;
    }
}

class CarHandler implements VehicleHandler {
    public double calculateFee(long hours) {
        return hours * 20;
    }
}

class BusHandler implements VehicleHandler {
    public double calculateFee(long hours) {
        return hours * 50;
    }
}