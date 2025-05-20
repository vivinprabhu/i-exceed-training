import java.util.*;

public class SlotManager {
    private Map<VehicleType, List<Integer>> slotMap;

    public SlotManager() {
        slotMap = new HashMap<>();
        slotMap.put(VehicleType.TRUCK, List.of(0));
        slotMap.put(VehicleType.BIKE, List.of(1, 2));
        slotMap.put(VehicleType.CAR, List.of(3, 4, 5));
        slotMap.put(VehicleType.BUS, List.of(6));
    }

    public List<Integer> getSlotsFor(VehicleType type) {
        return slotMap.getOrDefault(type, Collections.emptyList());
    }
}
