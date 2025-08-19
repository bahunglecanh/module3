package hunglcb.example.ex11.service;

import hunglcb.example.ex11.model.Category;
import hunglcb.example.ex11.repository.CategoryRepositoryImpl;
import hunglcb.example.ex11.repository.ICategoryRepository;
import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    private ICategoryRepository categoryRepository;

    public CategoryServiceImpl() {
        this.categoryRepository = new CategoryRepositoryImpl();
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Override
    public Category getCategoryById(int id) {
        return categoryRepository.findById(id);
    }

    @Override
    public void createCategory(Category category) {
        categoryRepository.save(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryRepository.update(category);
    }

    @Override
    public void deleteCategory(int id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public List<Category> searchCategoriesByName(String name) {
        return categoryRepository.searchByName(name);
    }

    @Override
    public List<Category> getCategoriesWithPaging(int page, int size) {
        return categoryRepository.findAllWithPaging(page, size);
    }

    @Override
    public int getTotalCategories() {
        return categoryRepository.countAll();
    }

    @Override
    public int getTotalPages(int size) {
        int total = getTotalCategories();
        return (int) Math.ceil((double) total / size);
    }
}
