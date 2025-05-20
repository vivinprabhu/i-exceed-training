import java.util.*;

public class ParkingLot {
    private int floorsCount, slotsPerFloor;
    private List<Floor> floors;
    private SlotManager slotManager;
    private TicketManager ticketManager;
    private Map<VehicleType, VehicleHandler> handlers;

    public ParkingLot(int floorsCount, int slotsPerFloor) {
        this.floorsCount = floorsCount;
        this.slotsPerFloor = slotsPerFloor;
        this.floors = new ArrayList<>();
        this.slotManager = new SlotManager();
        this.ticketManager = new TicketManager();
        this.handlers = new HashMap<>();

        for (int i = 0; i < floorsCount; i++) {
            floors.add(new Floor(slotsPerFloor));
        }

        handlers.put(VehicleType.CAR, new CarHandler());
        handlers.put(VehicleType.BIKE, new BikeHandler());
        handlers.put(VehicleType.TRUCK, new TruckHandler());
        handlers.put(VehicleType.BUS, new BusHandler());
    }

    public boolean parkVehicle(VehicleType type, String regNo, String model, String color, String driverName) {
        Vehicle vehicle = new Vehicle(type, regNo, model, color, driverName);
        List<Integer> slots = slotManager.getSlotsFor(type);

        for (int f = 0; f < floorsCount; f++) {
            Floor floor = floors.get(f);
            for (int s : slots) {
                if (s < slotsPerFloor && floor.getSlot(s) == null) {
                    floor.setSlot(s, vehicle);
                    String ticket = ticketManager.generateTicket(vehicle, f, s);
                    System.out.println("Vehicle parked. Ticket: " + ticket);
                    return true;
                }
            }
        }

        System.out.println("No available slot for this vehicle.");
        return false;
    }

    public boolean unparkVehicle(String ticket) {
        if (!ticketManager.isValid(ticket)) {
            System.out.println("Invalid ticket number.");
            return false;
        }

        int[] location = ticketManager.getSlotByTicket(ticket);
        int floor = location[0];
        int slot = location[1];
        Vehicle vehicle = floors.get(floor).getSlot(slot);

        if (vehicle == null) {
            System.out.println("Slot already empty.");
            return false;
        }

        long duration = Math.max(1, (System.currentTimeMillis() - vehicle.getParkedTime()) / (1000 * 60 * 60));
        VehicleHandler handler = handlers.get(vehicle.getType());
        double fee = handler.calculateFee(duration);

        System.out.println("Parking duration: " + duration + " hour");
        System.out.println("Total fee: $" + fee);

        floors.get(floor).setSlot(slot, null);
        ticketManager.removeTicket(ticket);
        System.out.println(ticket + " has been unparked.");
        return true;
    }

    public void displayParking() {
        System.out.println("\n--- Parking Lot Status ---");
        for (int i = 0; i < floorsCount; i++) {
            System.out.print("Floor " + (i + 1) + ": ");
            List<Vehicle> slots = floors.get(i).getSlots();
            for (Vehicle v : slots) {
                if (v == null) System.out.print("[Empty] ");
                else System.out.print("[" + v.getType() + " - " + v.getRegistrationNumber() + " - " + v.getModel() + " - " + v.getDriverName() + "] ");
            }
            System.out.println();
        }
    }
}
