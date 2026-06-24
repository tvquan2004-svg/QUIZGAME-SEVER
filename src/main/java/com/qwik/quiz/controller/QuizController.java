package com.qwik.quiz.controller;

import com.qwik.quiz.dto.AnswerRequest;
import com.qwik.quiz.dto.AnswerResponse;
import com.qwik.quiz.dto.QuizCardResponse;
import com.qwik.quiz.service.QuizService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/quiz")
@RequiredArgsConstructor
public class QuizController {

    private final QuizService quizService;

    @GetMapping("/feed")
    public ResponseEntity<Page<QuizCardResponse>> getFeed(
            @RequestParam(required = false) String category,
            @RequestParam(defaultValue = "0") int difficulty,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(quizService.getFeed(category, difficulty, page, size));
    }

    @PostMapping("/answer")
    public ResponseEntity<AnswerResponse> answer(
            @AuthenticationPrincipal Long userId,
            @Valid @RequestBody AnswerRequest request) {
        return ResponseEntity.ok(quizService.answerQuiz(userId, request));
    }
}
