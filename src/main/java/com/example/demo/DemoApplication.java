package com.example.demo;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @GetMapping(value = "/")
    public String doGetHelloWorld() {
        try {
            InetAddress inetAddress = InetAddress.getLocalHost();
            String serverIp = inetAddress.getHostAddress();  // 서버 IP
            String hostName = inetAddress.getHostName();     // 서버 호스트명
            return "Hello World 26 <br>- Server IP:" + serverIp + " (Host: " + hostName + ")";
        } catch (UnknownHostException e) {
            return "Hello World 26 <br>- Cannot resolve server IP";
        }
    }
}