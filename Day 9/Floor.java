import java.util.*;

public class Floor {
    private List<Vehicle> slots;

    public Floor(int slotCount) {
        slots = new ArrayList<>(Collections.nCopies(slotCount, null));
    }

    public Vehicle getSlot(int index) {
        return slots.get(index);
    }

    public void setSlot(int index, Vehicle vehicle) {
        slots.set(index, vehicle);
    }

    public List<Vehicle> getSlots() {
        return slots;
    }
}
