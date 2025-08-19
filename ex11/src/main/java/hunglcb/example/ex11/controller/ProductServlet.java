package hunglcb.example.ex11.controller;

import hunglcb.example.ex11.model.Category;
import hunglcb.example.ex11.model.Product;
import hunglcb.example.ex11.service.CategoryServiceImpl;
import hunglcb.example.ex11.service.ICategoryService;
import hunglcb.example.ex11.service.ProductService;
import hunglcb.example.ex11.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();
    private final ICategoryService categoryService = new CategoryServiceImpl();
    private static final int PAGE_SIZE = 5;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                showView(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "searchByCategory":
                searchByCategory(request, response);
                break;
            case "searchByPrice":
                searchByPrice(request, response);
                break;
            default:
                listProducts(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/products");
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        
        List<Product> products = productService.getProductsWithPaging(currentPage, PAGE_SIZE);
        List<Category> categories = categoryService.getAllCategories();
        
        int totalPages = productService.getTotalPages(PAGE_SIZE);
        int totalProducts = productService.getTotalProducts();
        
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("pageSize", PAGE_SIZE);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.getAllCategories();
        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        String categoryIdStr = request.getParameter("categoryId");

        double price = 0;
        int categoryId = 0;
        try {
            price = Double.parseDouble(priceStr);
            categoryId = Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException ignored) {
        }

        Product product = new Product(0, name, price, description, manufacturer, categoryId);
        productService.save(product);
        response.sendRedirect(request.getContextPath() + "/products");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = parseId(request.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        List<Category> categories = categoryService.getAllCategories();
        request.setAttribute("product", product);
        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = parseId(request.getParameter("id"));
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        String categoryIdStr = request.getParameter("categoryId");

        double price = 0;
        int categoryId = 0;
        try {
            price = Double.parseDouble(priceStr);
            categoryId = Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException ignored) {
        }

        Product updated = new Product(id, name, price, description, manufacturer, categoryId);
        productService.update(updated);
        response.sendRedirect(request.getContextPath() + "/products");
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = parseId(request.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/delete.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = parseId(request.getParameter("id"));
        productService.deleteById(id);
        response.sendRedirect(request.getContextPath() + "/products");
    }

    private void showView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = parseId(request.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/view.jsp");
        dispatcher.forward(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        
        List<Product> products;
        int totalPages;
        int totalProducts;
        
        if (keyword == null || keyword.trim().isEmpty()) {
            products = productService.getProductsWithPaging(currentPage, PAGE_SIZE);
            totalPages = productService.getTotalPages(PAGE_SIZE);
            totalProducts = productService.getTotalProducts();
        } else {
            products = productService.searchWithPaging(keyword, currentPage, PAGE_SIZE);
            totalPages = productService.getTotalPagesByKeyword(keyword, PAGE_SIZE);
            totalProducts = productService.getTotalProductsByKeyword(keyword);
        }
        
        List<Category> categories = categoryService.getAllCategories();
        
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("keyword", keyword == null ? "" : keyword);
        request.setAttribute("searchMode", true);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("pageSize", PAGE_SIZE);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryId = parseId(request.getParameter("categoryId"));
        List<Product> products = productService.searchByCategory(categoryId);
        List<Category> categories = categoryService.getAllCategories();
        
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("selectedCategoryId", categoryId);
        request.setAttribute("searchMode", true);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        
        double minPrice = 0;
        double maxPrice = Double.MAX_VALUE;
        
        try {
            if (minPriceStr != null && !minPriceStr.trim().isEmpty()) {
                minPrice = Double.parseDouble(minPriceStr);
            }
            if (maxPriceStr != null && !maxPriceStr.trim().isEmpty()) {
                maxPrice = Double.parseDouble(maxPriceStr);
            }
        } catch (NumberFormatException ignored) {
        }
        
        List<Product> products = productService.searchByPriceRange(minPrice, maxPrice);
        List<Category> categories = categoryService.getAllCategories();
        
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice == Double.MAX_VALUE ? "" : maxPrice);
        request.setAttribute("searchMode", true);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private int parseId(String idStr) {
        try {
            return Integer.parseInt(idStr);
        } catch (Exception e) {
            return -1;
        }
    }
}

