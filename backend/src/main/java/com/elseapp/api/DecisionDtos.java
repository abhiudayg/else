package com.elseapp.api;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.Instant;
import java.util.UUID;

public final class DecisionDtos {
  private DecisionDtos() {}

  public record CreateDecisionRequest(
      UUID userId,
      @NotBlank String source,
      @NotBlank String content,
      @NotBlank String question,
      @NotBlank String job,
      @NotBlank String verdict,
      @NotBlank String reason,
      @NotBlank String confidence,
      @NotBlank String engine,
      @NotBlank String engineMode,
      String provider,
      String topic,
      Instant deadline,
      @NotNull Instant createdAt) {}

  public record DecisionResponse(
      UUID id,
      UUID userId,
      String source,
      String content,
      String question,
      String job,
      String verdict,
      String reason,
      String confidence,
      String engine,
      String engineMode,
      String provider,
      String topic,
      Instant deadline,
      Instant createdAt,
      boolean saved) {}
}
