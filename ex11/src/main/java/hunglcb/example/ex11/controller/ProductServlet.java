package hunglcb.example.ex11.controller;

import hunglcb.example.ex11.model.Product;
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
        List<Product> products = productService.findAll();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException ignored) {
        }

        Product product = new Product(name, price, description, manufacturer);
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
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = parseId(request.getParameter("id"));
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException ignored) {
        }

        Product updated = new Product(id, name, price, description, manufacturer);
        productService.update(id, updated);
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
        productService.remove(id);
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
        String name = request.getParameter("name");
        List<Product> products = productService.searchByName(name);
        request.setAttribute("products", products);
        request.setAttribute("searchName", name == null ? "" : name);
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

