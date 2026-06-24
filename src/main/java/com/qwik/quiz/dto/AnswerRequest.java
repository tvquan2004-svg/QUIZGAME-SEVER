package com.qwik.quiz.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class AnswerRequest {

    @NotNull(message = "Card ID is required")
    private Long cardId;

    @NotBlank(message = "Selected answer is required")
    private String selectedAns;

    private Integer timeTakenMs;
}
