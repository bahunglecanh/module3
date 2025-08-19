package hunglcb.example.ex11.controller;

import hunglcb.example.ex11.model.Category;
import hunglcb.example.ex11.service.CategoryServiceImpl;
import hunglcb.example.ex11.service.ICategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", urlPatterns = "/categories")
public class CategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryServiceImpl();
    private static final int PAGE_SIZE = 5;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            case "search":
                searchCategories(request, response);
                break;
            case "view":
                viewCategory(request, response);
                break;
            default:
                listCategories(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "create":
                createCategory(request, response);
                break;
            case "edit":
                updateCategory(request, response);
                break;
            default:
                listCategories(request, response);
                break;
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        
        List<Category> categories = categoryService.getCategoriesWithPaging(currentPage, PAGE_SIZE);
        int totalPages = categoryService.getTotalPages(PAGE_SIZE);
        int totalCategories = categoryService.getTotalCategories();
        
        request.setAttribute("categories", categories);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalCategories", totalCategories);
        request.setAttribute("pageSize", PAGE_SIZE);
        
        request.getRequestDispatcher("/WEB-INF/views/category/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/category/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.getCategoryById(id);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/views/category/edit.jsp").forward(request, response);
    }

    private void createCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        Category category = new Category(name, description);
        categoryService.createCategory(category);
        
        response.sendRedirect("categories");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        Category category = new Category(id, name, description);
        categoryService.updateCategory(category);
        
        response.sendRedirect("categories");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryService.deleteCategory(id);
        response.sendRedirect("categories");
    }

    private void searchCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        
        if (keyword == null || keyword.trim().isEmpty()) {
            listCategories(request, response);
            return;
        }
        
        List<Category> categories = categoryService.searchCategoriesByName(keyword);
        request.setAttribute("categories", categories);
        request.setAttribute("keyword", keyword);
        request.setAttribute("searchMode", true);
        
        request.getRequestDispatcher("/WEB-INF/views/category/list.jsp").forward(request, response);
    }

    private void viewCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.getCategoryById(id);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/views/category/view.jsp").forward(request, response);
    }
}
