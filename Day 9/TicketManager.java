import java.util.*;

public class TicketManager {
    private Map<String, int[]> ticketMap = new HashMap<>();

    public String generateTicket(Vehicle vehicle, int floor, int slot) {
        String ticket = "tick_" + vehicle.getType().name().toLowerCase() + "_" + (floor + 1) + "_" + (slot + 1);
        ticketMap.put(ticket, new int[]{floor, slot});
        return ticket;
    }

    public int[] getSlotByTicket(String ticket) {
        return ticketMap.get(ticket);
    }

    public void removeTicket(String ticket) {
        ticketMap.remove(ticket);
    }

    public boolean isValid(String ticket) {
        return ticketMap.containsKey(ticket);
    }
}
