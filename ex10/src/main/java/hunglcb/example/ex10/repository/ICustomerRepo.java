package hunglcb.example.ex10.repository;

import hunglcb.example.ex10.model.Customer;

import java.util.List;

public interface ICustomerRepo {
    List<Customer> findAll();
}
