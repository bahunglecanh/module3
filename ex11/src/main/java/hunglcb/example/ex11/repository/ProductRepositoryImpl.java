package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.Product;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static final List<Product> products = new ArrayList<>();
    private static int nextId = 1;

    // No static data needed - using database instead

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

    // Implement new methods required by updated interface
    @Override
    public List<Product> searchByCategory(int categoryId) {
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getCategoryId() == categoryId) {
                result.add(product);
            }
        }
        return result;
    }

    @Override
    public List<Product> searchByPriceRange(double minPrice, double maxPrice) {
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getPrice() >= minPrice && product.getPrice() <= maxPrice) {
                result.add(product);
            }
        }
        return result;
    }

    @Override
    public List<Product> findAllWithPaging(int page, int size) {
        int start = (page - 1) * size;
        int end = Math.min(start + size, products.size());
        if (start >= products.size()) {
            return new ArrayList<>();
        }
        return new ArrayList<>(products.subList(start, end));
    }

    @Override
    public List<Product> searchWithPaging(String keyword, int page, int size) {
        List<Product> filtered = searchByName(keyword);
        int start = (page - 1) * size;
        int end = Math.min(start + size, filtered.size());
        if (start >= filtered.size()) {
            return new ArrayList<>();
        }
        return new ArrayList<>(filtered.subList(start, end));
    }

    @Override
    public int countAll() {
        return products.size();
    }

    @Override
    public int countByKeyword(String keyword) {
        return searchByName(keyword).size();
    }

    @Override
    public void update(Product product) {
        update(product.getId(), product);
    }

    @Override
    public void deleteById(int id) {
        remove(id);
    }
}

