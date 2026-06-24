package com.qwik.domain.quiz;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizCardRepository extends JpaRepository<QuizCard, Long> {

    Page<QuizCard> findByStatusAndCategory(QuizCard.CardStatus status, String category, Pageable pageable);

    Page<QuizCard> findByStatus(QuizCard.CardStatus status, Pageable pageable);

    @Query("SELECT q FROM QuizCard q WHERE q.status = 'APPROVED' AND q.difficulty BETWEEN :min AND :max")
    Page<QuizCard> findByDifficultyRange(@Param("min") int min, @Param("max") int max, Pageable pageable);

    List<QuizCard> findTop10ByStatusOrderByCreatedAtDesc(QuizCard.CardStatus status);

    long countByCreatorIdAndStatus(Long creatorId, QuizCard.CardStatus status);
}
