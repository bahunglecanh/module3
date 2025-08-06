package hunglcb.example.ex10.repository;

import hunglcb.example.ex10.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepoIml implements ICustomerRepo{
    static List<Customer> customers = new ArrayList<>();
    static {

        customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "image/img_fjords.jpg"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "image/img_forest.jpg"));
        customers.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "image/img_lights.jpg"));
        customers.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "image/img_mountains.jpg"));
        customers.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "image/img_mountains.jpg"));
    }
    @Override
    public List<Customer> findAll() {
        return customers;
    }
}
