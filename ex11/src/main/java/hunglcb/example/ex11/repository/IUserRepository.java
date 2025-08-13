package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    void save(User user);
    User findById(int id);
    void update(User user);
    void delete(int id);
    List<User> searchByCountry(String country);
    List<User> sortByName();
}
