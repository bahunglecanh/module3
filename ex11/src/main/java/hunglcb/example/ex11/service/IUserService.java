package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.User;

import java.util.List;

public interface IUserService {
    List<User> getAllUsers();
    void createUser(User user);
    User getUserById(int id);
    void updateUser(User user);
    void deleteUser(int id);
    List<User> searchUsersByCountry(String country);
    List<User> sortUsersByName();
}
