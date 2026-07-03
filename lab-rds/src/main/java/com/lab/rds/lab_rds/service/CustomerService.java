package com.lab.rds.lab_rds.service;

import com.lab.rds.lab_rds.entity.Customer;
import com.lab.rds.lab_rds.repository.CustomerRepository;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    //@Cacheable(value = "customers")
    public List<Customer> findAllCustomers() {
        System.out.println("Buscando no RDS...");
        return customerRepository.findAll();
    }

    //@CachePut(value = "customers", key = "#customer.id")
    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    //@CacheEvict(value = "customers", key = "#id")
    public void delete(Long id) {
        customerRepository.deleteById(id);
    }
}
