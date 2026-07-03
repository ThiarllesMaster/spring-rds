package com.lab.rds.lab_rds.controller;

import com.lab.rds.lab_rds.entity.Customer;
import com.lab.rds.lab_rds.repository.CustomerRepository;
import com.lab.rds.lab_rds.service.CustomerService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public List<Customer> findAll() {
        return customerService.findAllCustomers();
    }

    @PostMapping
    public Customer saveCustomer(@RequestBody Customer customer) {
        return this.customerService.saveCustomer(customer);
    }
}
