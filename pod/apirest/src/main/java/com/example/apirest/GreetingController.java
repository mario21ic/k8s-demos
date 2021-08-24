package com.example.apirest;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.TimeUnit;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @RequestMapping("/greeting")
    public Greeting greeting(@RequestParam(value="name", defaultValue="World") String name) {
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, name));
    }

    @RequestMapping("/")
    public String home() {
        return "OK\n";
    }

    @RequestMapping("/liveness")
    public String liveness() throws InterruptedException {
        // Wait 2 seconds
        TimeUnit.SECONDS.sleep(2);
        return "Liveness\n";
    }

    @RequestMapping("/readiness")
    public String readiness() throws InterruptedException {
        // Wait 3 seconds
        TimeUnit.SECONDS.sleep(3);
        return "Readiness\n";
    }
}
