package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.Category;
import hunglcb.example.ex11.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryJdbcImpl implements ProductRepository {
    private ICategoryRepository categoryRepository;

    public ProductRepositoryJdbcImpl() {
        this.categoryRepository = new CategoryRepositoryImpl();
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "ORDER BY p.id";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                products.add(mapResultSetToProduct(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public void save(Product product) {
        String sql = "INSERT INTO products (name, price, description, manufacturer, category_id) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getManufacturer());
            statement.setInt(5, product.getCategoryId());
            
            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        product.setId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product findById(int id) {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.id = ?";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToProduct(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Product product) {
        String sql = "UPDATE products SET name = ?, price = ?, description = ?, manufacturer = ?, category_id = ? WHERE id = ?";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getManufacturer());
            statement.setInt(5, product.getCategoryId());
            statement.setInt(6, product.getId());
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteById(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.name LIKE ? ORDER BY p.name";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, "%" + name + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    products.add(mapResultSetToProduct(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.category_id = ? ORDER BY p.name";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, categoryId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    products.add(mapResultSetToProduct(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchByPriceRange(double minPrice, double maxPrice) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.price BETWEEN ? AND ? ORDER BY p.price";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setDouble(1, minPrice);
            statement.setDouble(2, maxPrice);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    products.add(mapResultSetToProduct(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> findAllWithPaging(int page, int size) {
        List<Product> products = new ArrayList<>();
        int offset = (page - 1) * size;
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "ORDER BY p.id LIMIT ? OFFSET ?";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, size);
            statement.setInt(2, offset);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    products.add(mapResultSetToProduct(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchWithPaging(String keyword, int page, int size) {
        List<Product> products = new ArrayList<>();
        int offset = (page - 1) * size;
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.name LIKE ? OR p.description LIKE ? OR p.manufacturer LIKE ? " +
                    "ORDER BY p.name LIMIT ? OFFSET ?";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            statement.setInt(4, size);
            statement.setInt(5, offset);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    products.add(mapResultSetToProduct(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM products";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int countByKeyword(String keyword) {
        String sql = "SELECT COUNT(*) FROM products WHERE name LIKE ? OR description LIKE ? OR manufacturer LIKE ?";
        
        try (Connection connection = ConnectionDB.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
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

    private Product mapResultSetToProduct(ResultSet resultSet) throws SQLException {
        Product product = new Product(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getDouble("price"),
                resultSet.getString("description"),
                resultSet.getString("manufacturer"),
                resultSet.getInt("category_id")
        );
        
        // Set category if available
        String categoryName = resultSet.getString("category_name");
        if (categoryName != null) {
            Category category = new Category(
                    resultSet.getInt("category_id"),
                    categoryName,
                    resultSet.getString("category_description")
            );
            product.setCategory(category);
        }
        
        return product;
    }
}
