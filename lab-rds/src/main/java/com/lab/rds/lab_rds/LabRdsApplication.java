package com.lab.rds.lab_rds;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class LabRdsApplication {

	public static void main(String[] args) {
		SpringApplication.run(LabRdsApplication.class, args);
	}

}
