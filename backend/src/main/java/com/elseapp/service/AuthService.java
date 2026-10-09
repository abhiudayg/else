package com.elseapp.service;

import com.elseapp.api.AuthDtos.AppleSignInRequest;
import com.elseapp.api.AuthDtos.AuthResponse;
import com.elseapp.domain.UserEntity;
import com.elseapp.repository.UserRepository;
import java.time.Instant;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {
  private final UserRepository users;

  public AuthService(UserRepository users) {
    this.users = users;
  }

  @Transactional
  public AuthResponse signInWithApple(AppleSignInRequest request) {
    UserEntity user = users.findByAppleSubject(request.appleSubject())
        .orElseGet(() -> users.save(new UserEntity(
            UUID.randomUUID(),
            request.appleSubject(),
            request.displayName(),
            Instant.now())));
    return new AuthResponse(
        user.getId(),
        user.getAppleSubject(),
        user.getDisplayName(),
        user.getCreatedAt());
  }
}
