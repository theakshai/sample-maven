package com.example.samplemaven;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class SampleMavenApplication {

    public static void main(String[] args) {
        SpringApplication.run(SampleMavenApplication.class, args);
    }

    @RestController
    class HelloWorldController {

        @GetMapping("/")
        public String helloWorld() {
            return "Hello, World!";
        }
    }
}
