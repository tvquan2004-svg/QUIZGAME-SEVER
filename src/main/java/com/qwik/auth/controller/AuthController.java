package com.qwik.auth.controller;

import com.qwik.auth.dto.EmailLoginRequest;
import com.qwik.auth.dto.LoginRequest;
import com.qwik.auth.dto.LoginResponse;
import com.qwik.auth.dto.RegisterRequest;
import com.qwik.user.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @PostMapping("/apple")
    public ResponseEntity<LoginResponse> loginWithApple(@Valid @RequestBody LoginRequest request) {
        LoginResponse response = userService.authenticate(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/register")
    public ResponseEntity<LoginResponse> register(@Valid @RequestBody RegisterRequest request) {
        LoginResponse response = userService.register(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> loginWithEmail(@Valid @RequestBody EmailLoginRequest request) {
        LoginResponse response = userService.loginWithEmail(request);
        return ResponseEntity.ok(response);
    }
}
