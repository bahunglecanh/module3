package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.Category;
import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();
    Category findById(int id);
    void save(Category category);
    void update(Category category);
    void deleteById(int id);
    List<Category> searchByName(String name);
    List<Category> findAllWithPaging(int page, int size);
    int countAll();
}
