package com.qwik.domain.quiz;

import com.qwik.common.BaseTimeEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "quiz_cards")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class QuizCard extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "creator_id")
    private Long creatorId;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String question;

    @Column(name = "option_a", nullable = false, length = 255)
    private String optionA;

    @Column(name = "option_b", nullable = false, length = 255)
    private String optionB;

    @Column(name = "option_c", length = 255)
    private String optionC;

    @Column(name = "option_d", length = 255)
    private String optionD;

    @Column(name = "correct_ans", nullable = false, length = 1)
    private String correctAns;

    @Column(nullable = false)
    @Builder.Default
    private Integer difficulty = 5;

    @Column(length = 50)
    private String category;

    @Column(length = 10)
    @Builder.Default
    private String language = "vi";

    @Column(columnDefinition = "TEXT")
    private String explanation;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    private CardStatus status = CardStatus.pending;

    public enum CardStatus {
        pending, approved, rejected
    }
}
