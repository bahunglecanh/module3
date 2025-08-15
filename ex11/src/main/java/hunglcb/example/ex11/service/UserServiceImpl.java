package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.User;
import hunglcb.example.ex11.repository.ConnectionDB;
import hunglcb.example.ex11.repository.IUserRepository;
import hunglcb.example.ex11.repository.UserRepositoryImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService{
    private IUserRepository repository = new UserRepositoryImpl();

    @Override
    public List<User> getAllUsers() {
        return repository.findAll();
    }

    @Override
    public void createUser(User user) {
        repository.save(user);
    }

    @Override
    public User getUserById(int id) {
        return repository.findById(id);
    }

    @Override
    public void updateUser(User user) {
        repository.update(user);
    }

    @Override
    public void deleteUser(int id) {
        repository.delete(id);
    }

    @Override
    public List<User> searchUsersByCountry(String country) {
        return repository.searchByCountry(country);
    }

    @Override
    public List<User> sortUsersByName() {
        return repository.sortByName();
    }
    
    @Override
    public void addUserTransaction(User user1, User user2) {
        Connection connection = null;
        try {
            connection = ConnectionDB.getConnectDB();
            connection.setAutoCommit(false);
            
            System.out.println("=== BAT DAU TRANSACTION ===");

            System.out.println("Dang them user 1: " + user1.getName());
            repository.saveWithConnection(connection, user1);
            System.out.println("✓ Da them user 1 thanh cong");

            System.out.println("Dang them user 2: " + user2.getName());
            repository.saveWithConnection(connection, user2);
            System.out.println("✓ Da them user 2 thanh cong");

            System.out.println("Co y gay ra loi SQL...");
            String invalidSQL = "INSERT INTO users (invalid_column) VALUES ('test')";
            connection.createStatement().execute(invalidSQL);

            connection.commit();
            System.out.println("✓ TRANSACTION COMMITTED THANH CONG");
            
        } catch (SQLException e) {
            System.out.println(" LOI SQL: " + e.getMessage());
            System.out.println("=== ROLLBACK TRANSACTION ===");
            
            try {
                if (connection != null) {
                    connection.rollback();
                    System.out.println("✓ Da ROLLBACK - Khoi phuc trang thai ban dau");
                }
            } catch (SQLException rollbackEx) {
                System.err.println(" Loi khi rollback: " + rollbackEx.getMessage());
            }
            
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true); // Bat lai auto-commit
                    connection.close();
                    System.out.println("✓ Da dong connection");
                }
            } catch (SQLException e) {
                System.err.println("❌ Loi khi dong connection: " + e.getMessage());
            }
        }
        System.out.println("=== KET THUC TRANSACTION ===\n");
    }
}
