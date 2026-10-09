package com.elseapp.api;

import com.elseapp.api.AuthDtos.AppleSignInRequest;
import com.elseapp.api.AuthDtos.AuthResponse;
import com.elseapp.service.AuthService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {
  private final AuthService auth;

  public AuthController(AuthService auth) {
    this.auth = auth;
  }

  @PostMapping("/apple")
  AuthResponse apple(@Valid @RequestBody AppleSignInRequest request) {
    return auth.signInWithApple(request);
  }
}
