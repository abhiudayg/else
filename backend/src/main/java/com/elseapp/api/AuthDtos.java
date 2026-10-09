package com.elseapp.api;

import jakarta.validation.constraints.NotBlank;
import java.time.Instant;
import java.util.UUID;

public final class AuthDtos {
  private AuthDtos() {}

  public record AppleSignInRequest(
      @NotBlank String appleSubject,
      String displayName) {}

  public record AuthResponse(
      UUID userId,
      String appleSubject,
      String displayName,
      Instant createdAt) {}
}
