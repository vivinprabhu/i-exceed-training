import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // System.out.println("Enter the number of Floors for parking : ");
        // int numberOfFloor = sc.nextInt();
        // System.out.println("Enter the number of slots per floor for parking : ");
        // int numberofSlotPerFloor = sc.nextInt(); 

        // ParkingLot lot = new ParkingLot(numberOfFloor,numberofSlotPerFloor);
        
        ParkingLot lot = new ParkingLot(3,7);

        while (true) {
            System.out.println("\nChoose an option:\n1) Park the vehicle\n2) Unpark the vehicle\n3) Show parking area details\n4) Exit");
            
            System.out.println("Enter an option : ");
            int op = sc.nextInt();
            sc.nextLine();

            switch (op) {
                case 1:
                    System.out.println("Enter vehicle type (CAR/BIKE/TRUCK/BUS):");
                    VehicleType type = VehicleType.valueOf(sc.nextLine().trim().toUpperCase());

                    System.out.println("Enter registration number:");
                    String reg = sc.nextLine();

                    System.out.println("Enter model:");
                    String model = sc.nextLine();

                    System.out.println("Enter color:");
                    String color = sc.nextLine();

                    System.out.println("Enter driver name:");
                    String driver = sc.nextLine();

                    lot.parkVehicle(type, reg, model, color, driver);
                    break;

                case 2:
                    System.out.println("Enter ticket number:");
                    String ticket = sc.nextLine();
                    lot.unparkVehicle(ticket);
                    break;

                case 3:
                    lot.displayParking();
                    break;

                case 4:
                    System.out.println("Exiting...");
                    return;

                default:
                    System.out.println("Invalid option.");
            }
        }
    }
}
