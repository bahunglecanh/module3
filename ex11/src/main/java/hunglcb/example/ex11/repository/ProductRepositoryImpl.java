package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.Product;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static final List<Product> products = new ArrayList<>();
    private static int nextId = 1;

    static {
        // Seed initial data
        saveStatic(new Product("iPhone 14", 21990000, "Điện thoại Apple", "Apple"));
        saveStatic(new Product("Galaxy S23", 18990000, "Điện thoại Samsung", "Samsung"));
        saveStatic(new Product("Xiaomi 13", 12990000, "Điện thoại Xiaomi", "Xiaomi"));
        saveStatic(new Product("Vsmart Joy 3", 2990000, "Điện thoại Việt Nam", "Vsmart"));
    }

    private static void saveStatic(Product product) {
        product.setId(nextId++);
        products.add(product);
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        if (product.getId() <= 0) {
            product.setId(nextId++);
        }
        // Nếu đã tồn tại id, thay thế; nếu không, thêm mới
        boolean replaced = false;
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == product.getId()) {
                products.set(i, product);
                replaced = true;
                break;
            }
        }
        if (!replaced) {
            products.add(product);
        }
    }

    @Override
    public Product findById(int id) {
        for (Product p : products) {
            if (p.getId() == id) return p;
        }
        return null;
    }

    @Override
    public void update(int id, Product updatedProduct) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                updatedProduct.setId(id);
                products.set(i, updatedProduct);
                return;
            }
        }
    }

    @Override
    public void remove(int id) {
        products.removeIf(p -> p.getId() == id);
    }

    @Override
    public List<Product> searchByName(String name) {
        String keyword = name == null ? "" : name.toLowerCase().trim();
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getName() != null && product.getName().toLowerCase().contains(keyword)) {
                result.add(product);
            }
        }
        return result;
    }
}

