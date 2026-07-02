package com.lab.rds.lab_rds.repository;

import com.lab.rds.lab_rds.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
