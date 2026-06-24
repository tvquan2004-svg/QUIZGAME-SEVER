package com.qwik.domain.quiz;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface AnswerLogRepository extends JpaRepository<AnswerLog, Long> {

    List<AnswerLog> findByUserId(Long userId);

    Optional<AnswerLog> findByUserIdAndCardId(Long userId, Long cardId);

    long countByUserId(Long userId);

    long countByUserIdAndIsCorrect(Long userId, boolean isCorrect);

    long countByCardId(Long cardId);

    @Query("SELECT a.selectedAns, COUNT(a) FROM AnswerLog a WHERE a.cardId = :cardId GROUP BY a.selectedAns")
    List<Object[]> findCrowdDistributionByCardId(@Param("cardId") Long cardId);
}
