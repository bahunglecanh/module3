package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.Product;
import hunglcb.example.ex11.repository.ProductRepository;
import hunglcb.example.ex11.repository.ProductRepositoryJdbcImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private final ProductRepository repository = new ProductRepositoryJdbcImpl(); // Use database

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void update(Product product) {
        repository.update(product);
    }

    @Override
    public void deleteById(int id) {
        repository.deleteById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return repository.searchByName(name);
    }

    @Override
    public List<Product> searchByCategory(int categoryId) {
        return repository.searchByCategory(categoryId);
    }

    @Override
    public List<Product> searchByPriceRange(double minPrice, double maxPrice) {
        return repository.searchByPriceRange(minPrice, maxPrice);
    }

    @Override
    public List<Product> getProductsWithPaging(int page, int size) {
        return repository.findAllWithPaging(page, size);
    }

    @Override
    public List<Product> searchWithPaging(String keyword, int page, int size) {
        return repository.searchWithPaging(keyword, page, size);
    }

    @Override
    public int getTotalProducts() {
        return repository.countAll();
    }

    @Override
    public int getTotalProductsByKeyword(String keyword) {
        return repository.countByKeyword(keyword);
    }

    @Override
    public int getTotalPages(int size) {
        int total = getTotalProducts();
        return (int) Math.ceil((double) total / size);
    }

    @Override
    public int getTotalPagesByKeyword(String keyword, int size) {
        int total = getTotalProductsByKeyword(keyword);
        return (int) Math.ceil((double) total / size);
    }

    // Deprecated methods for backward compatibility
    @Override
    @Deprecated
    public void update(int id, Product updatedProduct) {
        updatedProduct.setId(id);
        update(updatedProduct);
    }

    @Override
    @Deprecated
    public void remove(int id) {
        deleteById(id);
    }
}

