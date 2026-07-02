package com.lab.rds.lab_rds.controller;

import com.lab.rds.lab_rds.entity.Customer;
import com.lab.rds.lab_rds.repository.CustomerRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    private final CustomerRepository customerRepository;

    public CustomerController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @GetMapping
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @PostMapping
    public Customer saveCustomer(@RequestBody Customer customer) {
        return this.customerRepository.save(customer);
    }
}
