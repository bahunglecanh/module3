package hunglcb.example.ex10.model;

public class Customer {
    private String name;
    private String birthDate;
    private String address;
    private String image;

    public Customer(String name, String birthDate, String address, String image) {
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
        this.image = image;
    }

    public String getName() { return name; }
    public String getBirthDate() { return birthDate; }
    public String getAddress() { return address; }
    public String getImage() { return image; }
}
