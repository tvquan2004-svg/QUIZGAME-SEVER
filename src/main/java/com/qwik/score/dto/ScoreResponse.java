package com.qwik.score.dto;

import com.qwik.score.entity.Score;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@Builder
public class ScoreResponse {
    private Long userId;
    private int knowledge;
    private int mirror;
    private int level;
    private int streak;
    private LocalDate lastPlay;

    public static ScoreResponse from(Score score) {
        return ScoreResponse.builder()
                .userId(score.getUserId())
                .knowledge(score.getKnowledge())
                .mirror(score.getMirror())
                .level(score.getLevel())
                .streak(score.getStreak())
                .lastPlay(score.getLastPlay())
                .build();
    }
}
