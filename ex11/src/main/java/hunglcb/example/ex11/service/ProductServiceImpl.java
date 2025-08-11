package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.Product;
import hunglcb.example.ex11.repository.ProductRepository;
import hunglcb.example.ex11.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private final ProductRepository repository = new ProductRepositoryImpl();

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
    public void update(int id, Product updatedProduct) {
        repository.update(id, updatedProduct);
    }

    @Override
    public void remove(int id) {
        repository.remove(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return repository.searchByName(name);
    }
}

