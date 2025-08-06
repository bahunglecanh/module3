package hunglcb.example.ex10.controller;

import hunglcb.example.ex10.model.Customer;
import hunglcb.example.ex10.service.CustomerServiceIml;
import hunglcb.example.ex10.service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerController",value = "/listCustomer")
public class CustomerController extends HttpServlet {
    private ICustomerService iCustomerService=new CustomerServiceIml();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers=iCustomerService.findAll();
        req.setAttribute("customers",customers);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
