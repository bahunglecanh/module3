package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    void save(Product product);
    Product findById(int id);
    void update(Product product);
    void deleteById(int id);
    List<Product> searchByName(String name);
    List<Product> searchByCategory(int categoryId);
    List<Product> searchByPriceRange(double minPrice, double maxPrice);
    List<Product> findAllWithPaging(int page, int size);
    List<Product> searchWithPaging(String keyword, int page, int size);
    int countAll();
    int countByKeyword(String keyword);
    
    // Deprecated methods for backward compatibility
    @Deprecated
    void update(int id, Product updatedProduct);
    @Deprecated
    void remove(int id);
}

