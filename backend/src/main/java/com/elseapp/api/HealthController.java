package com.elseapp.api;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class HealthController {
  @GetMapping("/health")
  Map<String, Object> health() {
    return Map.of(
        "status", "ok",
        "service", "else-api",
        "product", "ELSE — your second opinion for real life");
  }
}
