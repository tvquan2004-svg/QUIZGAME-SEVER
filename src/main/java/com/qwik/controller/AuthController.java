package com.qwik.controller;

import com.qwik.dto.EmailLoginRequest;
import com.qwik.dto.LoginRequest;
import com.qwik.dto.LoginResponse;
import com.qwik.dto.RegisterRequest;
import com.qwik.service.UserService;
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
