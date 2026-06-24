package com.qwik.service;

import com.qwik.domain.quiz.AnswerLog;
import com.qwik.domain.quiz.AnswerLogRepository;
import com.qwik.domain.quiz.QuizCard;
import com.qwik.domain.quiz.QuizCardRepository;
import com.qwik.domain.score.Score;
import com.qwik.domain.score.ScoreRepository;
import com.qwik.dto.AnswerRequest;
import com.qwik.dto.AnswerResponse;
import com.qwik.dto.QuizCardResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class QuizService {

    private final QuizCardRepository quizCardRepository;
    private final AnswerLogRepository answerLogRepository;
    private final ScoreRepository scoreRepository;

    public Page<QuizCardResponse> getFeed(String category, int difficulty, int page, int size) {
        Page<QuizCard> cards;
        PageRequest pageRequest = PageRequest.of(page, size);

        if (category != null && !category.isBlank()) {
            cards = quizCardRepository.findByStatusAndCategory(
                    QuizCard.CardStatus.approved, category, pageRequest);
        } else if (difficulty > 0) {
            int min = Math.max(1, difficulty - 2);
            int max = Math.min(10, difficulty + 2);
            cards = quizCardRepository.findByDifficultyRange(min, max, pageRequest);
        } else {
            cards = quizCardRepository.findByStatus(QuizCard.CardStatus.approved, pageRequest);
        }

        return cards.map(QuizCardResponse::from);
    }

    @Transactional
    public AnswerResponse answerQuiz(Long userId, AnswerRequest request) {
        QuizCard card = quizCardRepository.findById(request.getCardId())
                .orElseThrow(() -> new RuntimeException("Quiz card not found: " + request.getCardId()));

        boolean isCorrect = card.getCorrectAns().equalsIgnoreCase(request.getSelectedAns());

        AnswerLog log = AnswerLog.builder()
                .userId(userId)
                .cardId(request.getCardId())
                .selectedAns(request.getSelectedAns().toUpperCase())
                .isCorrect(isCorrect)
                .timeTakenMs(request.getTimeTakenMs())
                .build();
        answerLogRepository.save(log);

        Score score = scoreRepository.findByUserId(userId)
                .orElseGet(() -> scoreRepository.save(Score.builder().userId(userId).build()));

        int knowledgeEarned = 0;
        if (isCorrect) {
            knowledgeEarned = calculateKnowledgePoints(card.getDifficulty(), request.getTimeTakenMs());
            score.addKnowledge(knowledgeEarned);
        }

        score.updateStreak(LocalDate.now());
        scoreRepository.save(score);

        long totalAnswers = answerLogRepository.countByCardId(request.getCardId());
        List<Object[]> crowdData = answerLogRepository.findCrowdDistributionByCardId(request.getCardId());

        BigDecimal pctA = BigDecimal.ZERO;
        BigDecimal pctB = BigDecimal.ZERO;
        BigDecimal pctC = BigDecimal.ZERO;
        BigDecimal pctD = BigDecimal.ZERO;

        if (totalAnswers > 0) {
            for (Object[] row : crowdData) {
                String ans = (String) row[0];
                long count = (Long) row[1];
                BigDecimal pct = BigDecimal.valueOf(count)
                        .multiply(BigDecimal.valueOf(100))
                        .divide(BigDecimal.valueOf(totalAnswers), 1, RoundingMode.HALF_UP);
                switch (ans.toUpperCase()) {
                    case "A" -> pctA = pct;
                    case "B" -> pctB = pct;
                    case "C" -> pctC = pct;
                    case "D" -> pctD = pct;
                }
            }
        }

        return AnswerResponse.builder()
                .isCorrect(isCorrect)
                .correctAns(card.getCorrectAns())
                .explanation(card.getExplanation())
                .knowledgeEarned(knowledgeEarned)
                .crowdPctA(pctA)
                .crowdPctB(pctB)
                .crowdPctC(pctC)
                .crowdPctD(pctD)
                .totalAnswers((int) totalAnswers)
                .build();
    }

    private int calculateKnowledgePoints(int difficulty, Integer timeTakenMs) {
        int basePoints = difficulty * 10;
        if (timeTakenMs != null && timeTakenMs < 3000) {
            basePoints += 5; // bonus for speed
        }
        return basePoints;
    }
}
