package com.qwik.prediction.repository;

import com.qwik.prediction.entity.Prediction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PredictionRepository extends JpaRepository<Prediction, Long> {
    Optional<Prediction> findByUserIdAndCardId(Long userId, Long cardId);
}
