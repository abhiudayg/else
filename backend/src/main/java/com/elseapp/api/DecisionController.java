package com.elseapp.api;

import com.elseapp.api.DecisionDtos.CreateDecisionRequest;
import com.elseapp.api.DecisionDtos.DecisionResponse;
import com.elseapp.service.DecisionService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/decisions")
public class DecisionController {
  private final DecisionService decisions;

  public DecisionController(DecisionService decisions) {
    this.decisions = decisions;
  }

  @PostMapping
  ResponseEntity<DecisionResponse> create(@Valid @RequestBody CreateDecisionRequest request) {
    return ResponseEntity.status(HttpStatus.CREATED).body(decisions.create(request));
  }

  @GetMapping
  List<DecisionResponse> list(@RequestParam UUID userId) {
    return decisions.listForUser(userId);
  }

  @GetMapping("/{id}")
  DecisionResponse get(@PathVariable UUID id) {
    return decisions.get(id);
  }

  @DeleteMapping("/{id}")
  ResponseEntity<Void> delete(@PathVariable UUID id) {
    decisions.softDelete(id);
    return ResponseEntity.noContent().build();
  }
}
