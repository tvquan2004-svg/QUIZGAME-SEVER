package com.qwik.score.controller;

import com.qwik.score.entity.Score;
import com.qwik.score.repository.ScoreRepository;
import com.qwik.score.dto.ScoreResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/score")
@RequiredArgsConstructor
public class ScoreController {

    private final ScoreRepository scoreRepository;

    @GetMapping("/me")
    public ResponseEntity<ScoreResponse> getMyScore(Authentication authentication) {
        Long userId = (Long) authentication.getPrincipal();
        Score score = scoreRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("Score not found for user: " + userId));
        return ResponseEntity.ok(ScoreResponse.from(score));
    }
}
