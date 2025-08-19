package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.Category;
import java.util.List;

public interface ICategoryService {
    List<Category> getAllCategories();
    Category getCategoryById(int id);
    void createCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(int id);
    List<Category> searchCategoriesByName(String name);
    List<Category> getCategoriesWithPaging(int page, int size);
    int getTotalCategories();
    int getTotalPages(int size);
}
