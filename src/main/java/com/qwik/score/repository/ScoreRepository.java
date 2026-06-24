package com.qwik.score.repository;

import com.qwik.score.entity.Score;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ScoreRepository extends JpaRepository<Score, Long> {
    Optional<Score> findByUserId(Long userId);

    @Query("SELECT s FROM Score s ORDER BY s.knowledge DESC")
    List<Score> findTopKnowledge(int limit);

    @Query("SELECT s FROM Score s ORDER BY s.mirror DESC")
    List<Score> findTopMirror(int limit);
}
