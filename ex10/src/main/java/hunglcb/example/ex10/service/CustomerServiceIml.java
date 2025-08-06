package hunglcb.example.ex10.service;

import hunglcb.example.ex10.model.Customer;
import hunglcb.example.ex10.repository.CustomerRepoIml;
import hunglcb.example.ex10.repository.ICustomerRepo;

import java.util.List;

public class CustomerServiceIml implements ICustomerService{
    ICustomerRepo iCustomerRepo=new CustomerRepoIml();
    @Override
    public List<Customer> findAll() {
        return iCustomerRepo.findAll();
    }
}
