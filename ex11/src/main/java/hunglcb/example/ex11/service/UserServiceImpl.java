package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.User;
import hunglcb.example.ex11.repository.IUserRepository;
import hunglcb.example.ex11.repository.UserRepositoryImpl;

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
}
