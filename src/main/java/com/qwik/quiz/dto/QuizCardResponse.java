package com.qwik.quiz.dto;

import com.qwik.quiz.entity.QuizCard;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
@Builder
public class QuizCardResponse {
    private Long id;
    private String question;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private int difficulty;
    private String category;
    private String language;
    private LocalDateTime createdAt;

    public static QuizCardResponse from(QuizCard card) {
        return QuizCardResponse.builder()
                .id(card.getId())
                .question(card.getQuestion())
                .optionA(card.getOptionA())
                .optionB(card.getOptionB())
                .optionC(card.getOptionC())
                .optionD(card.getOptionD())
                .difficulty(card.getDifficulty())
                .category(card.getCategory())
                .language(card.getLanguage())
                .createdAt(card.getCreatedAt())
                .build();
    }
}
