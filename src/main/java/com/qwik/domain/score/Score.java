package com.qwik.domain.score;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "scores")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class Score {

    @Id
    @Column(name = "user_id")
    private Long userId;

    @Builder.Default
    private Integer knowledge = 0;

    @Builder.Default
    private Integer mirror = 0;

    @Builder.Default
    private Integer level = 1;

    @Builder.Default
    private Integer streak = 0;

    @Column(name = "last_play")
    private LocalDate lastPlay;

    public void addKnowledge(int points) {
        this.knowledge += points;
    }

    public void addMirror(int points) {
        this.mirror += points;
    }

    public void updateStreak(LocalDate today) {
        if (lastPlay == null || lastPlay.plusDays(1).equals(today)) {
            this.streak++;
        } else if (!lastPlay.equals(today)) {
            this.streak = 1;
        }
        this.lastPlay = today;
    }
}
