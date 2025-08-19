package hunglcb.example.ex11.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private String manufacturer;
    private int categoryId;
    private Category category;

    public Product() {
    }

    public Product(int id, String name, double price, String description, String manufacturer, int categoryId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
        this.categoryId = categoryId;
    }

    public Product(int id, String name, double price, String description, String manufacturer) {
        this(id, name, price, description, manufacturer, 0);
    }

    public Product(String name, double price, String description, String manufacturer) {
        this(0, name, price, description, manufacturer);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", categoryId=" + categoryId +
                '}';
    }
}

