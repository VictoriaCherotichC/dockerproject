package com.getmessage.dockerpoject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class DockerpojectApplication {
	
	@GetMapping("/message")
	public String getMessage() {
		return "Let's do this, shall we?!";
	}

	public static void main(String[] args) {
		SpringApplication.run(DockerpojectApplication.class, args);
	}

}
