package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.User;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository{
    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "{CALL GetAllUsers()}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return users;
    }

    @Override
    public void save(User user) {
        String sql = "{CALL InsertUser(?, ?, ?)}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getCountry());
            cs.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public User findById(int id) {
        String sql = "{CALL GetUserById(?)}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql)) {
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")
                );
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public void update(User user) {
        String sql = "{CALL UpdateUser(?, ?, ?, ?)}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql)) {
            cs.setInt(1, user.getId());
            cs.setString(2, user.getName());
            cs.setString(3, user.getEmail());
            cs.setString(4, user.getCountry());
            cs.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        String sql = "{CALL DeleteUser(?)}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql)) {
            cs.setInt(1, id);
            cs.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> users = new ArrayList<>();
        String sql = "{CALL SearchUsersByCountry(?)}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, country);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return users;
    }

    @Override
    public List<User> sortByName() {
        List<User> users = new ArrayList<>();
        String sql = "{CALL SortUsersByName()}";
        try (Connection conn = ConnectionDB.getConnectDB();
             CallableStatement cs = conn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return users;
    }
    
    @Override
    public void saveWithConnection(Connection connection, User user) {
        String sql = "{CALL InsertUser(?, ?, ?)}";
        try (CallableStatement cs = connection.prepareCall(sql)) {
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getCountry());
            cs.executeUpdate();
        } catch (SQLException e) { 
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi thêm user: " + e.getMessage(), e);
        }
    }
}
