package com.qwik.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor
@Builder
public class AnswerResponse {
    private boolean isCorrect;
    private String correctAns;
    private String explanation;
    private int knowledgeEarned;
    private BigDecimal crowdPctA;
    private BigDecimal crowdPctB;
    private BigDecimal crowdPctC;
    private BigDecimal crowdPctD;
    private int totalAnswers;
}
