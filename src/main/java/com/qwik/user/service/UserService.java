package com.qwik.user.service;

import com.qwik.score.entity.Score;
import com.qwik.score.repository.ScoreRepository;
import com.qwik.user.entity.User;
import com.qwik.user.repository.UserRepository;
import com.qwik.auth.dto.EmailLoginRequest;
import com.qwik.auth.dto.LoginRequest;
import com.qwik.auth.dto.LoginResponse;
import com.qwik.auth.dto.RegisterRequest;
import com.qwik.security.jwt.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final ScoreRepository scoreRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    public LoginResponse authenticate(LoginRequest request) {
        String appleId = request.getIdentityToken();
        // In Phase 0, we accept the token directly.
        // In production, verify with Apple's servers via AppleAuthService.

        User user = userRepository.findByAppleId(appleId).orElse(null);
        boolean isNewUser = false;

        if (user == null) {
            String username = request.getUsername();
            if (username == null || username.isBlank()) {
                username = "User" + UUID.randomUUID().toString().substring(0, 8);
            }

            user = User.builder()
                    .appleId(appleId)
                    .username(username)
                    .avatarUrl(request.getAvatarUrl())
                    .build();
            user = userRepository.save(user);

            Score score = Score.builder()
                    .userId(user.getId())
                    .build();
            scoreRepository.save(score);

            isNewUser = true;
            log.info("New user registered: {} ({})", user.getUsername(), user.getId());
        }

        String token = jwtTokenProvider.generateToken(user.getId(), user.getUsername());

        return LoginResponse.builder()
                .token(token)
                .userId(user.getId())
                .username(user.getUsername())
                .avatarUrl(user.getAvatarUrl())
                .mindProfile(user.getMindProfile())
                .isNewUser(isNewUser)
                .build();
    }

    @Transactional
    public LoginResponse register(RegisterRequest request) {
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new RuntimeException("Email already registered");
        }
        if (userRepository.findByUsername(request.getUsername()).isPresent()) {
            throw new RuntimeException("Username already taken");
        }

        User user = User.builder()
                .email(request.getEmail())
                .passwordHash(passwordEncoder.encode(request.getPassword()))
                .username(request.getUsername())
                .build();
        user = userRepository.save(user);

        Score score = Score.builder()
                .userId(user.getId())
                .build();
        scoreRepository.save(score);

        String token = jwtTokenProvider.generateToken(user.getId(), user.getUsername());
        log.info("New user registered via email: {} ({})", user.getUsername(), user.getId());

        return LoginResponse.builder()
                .token(token)
                .userId(user.getId())
                .username(user.getUsername())
                .isNewUser(true)
                .build();
    }

    @Transactional
    public LoginResponse loginWithEmail(EmailLoginRequest request) {
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("Invalid email or password"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            throw new RuntimeException("Invalid email or password");
        }

        String token = jwtTokenProvider.generateToken(user.getId(), user.getUsername());
        log.info("User logged in via email: {} ({})", user.getUsername(), user.getId());

        return LoginResponse.builder()
                .token(token)
                .userId(user.getId())
                .username(user.getUsername())
                .avatarUrl(user.getAvatarUrl())
                .mindProfile(user.getMindProfile())
                .isNewUser(false)
                .build();
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found: " + userId));
    }
}
