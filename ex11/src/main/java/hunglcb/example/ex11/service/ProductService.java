package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product updatedProduct);

    void remove(int id);

    List<Product> searchByName(String name);
}

