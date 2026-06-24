-- ========== USERS ==========
CREATE TABLE users (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    apple_id      VARCHAR(255) UNIQUE,
    username      VARCHAR(50) UNIQUE NOT NULL,
    avatar_url    TEXT,
    mind_profile  JSON,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== QUIZ CARDS ==========
CREATE TABLE quiz_cards (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    creator_id    BIGINT,
    question      TEXT NOT NULL,
    option_a      VARCHAR(255) NOT NULL,
    option_b      VARCHAR(255) NOT NULL,
    option_c      VARCHAR(255),
    option_d      VARCHAR(255),
    correct_ans   CHAR(1) NOT NULL,
    difficulty    TINYINT DEFAULT 5,
    category      VARCHAR(50),
    language      VARCHAR(10) DEFAULT 'vi',
    explanation   TEXT,
    status        ENUM('pending','approved','rejected') DEFAULT 'pending',
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (creator_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== ANSWER LOGS ==========
CREATE TABLE answer_logs (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id       BIGINT NOT NULL,
    card_id       BIGINT NOT NULL,
    selected_ans  CHAR(1) NOT NULL,
    is_correct    BOOLEAN NOT NULL,
    time_taken_ms INT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (card_id) REFERENCES quiz_cards(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== PREDICTIONS ==========
CREATE TABLE predictions (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id       BIGINT NOT NULL,
    card_id       BIGINT NOT NULL,
    predicted_pct DECIMAL(5,2),
    actual_pct    DECIMAL(5,2),
    mirror_score  INT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (card_id) REFERENCES quiz_cards(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== SCORES ==========
CREATE TABLE scores (
    user_id       BIGINT PRIMARY KEY,
    knowledge     INT DEFAULT 0,
    mirror        INT DEFAULT 0,
    level         INT DEFAULT 1,
    streak        INT DEFAULT 0,
    last_play     DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== FRIENDSHIPS ==========
CREATE TABLE friendships (
    user_id1      BIGINT NOT NULL,
    user_id2      BIGINT NOT NULL,
    status        ENUM('pending','accepted') DEFAULT 'pending',
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id1, user_id2),
    FOREIGN KEY (user_id1) REFERENCES users(id),
    FOREIGN KEY (user_id2) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== GUILDS ==========
CREATE TABLE guilds (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    leader_id     BIGINT NOT NULL,
    score         INT DEFAULT 0,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (leader_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== GUILD MEMBERS ==========
CREATE TABLE guild_members (
    guild_id      BIGINT NOT NULL,
    user_id       BIGINT NOT NULL,
    role          ENUM('leader','officer','member') DEFAULT 'member',
    joined_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (guild_id, user_id),
    FOREIGN KEY (guild_id) REFERENCES guilds(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== DUELS ==========
CREATE TABLE duels (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    player1_id    BIGINT NOT NULL,
    player2_id    BIGINT,
    winner_id     BIGINT,
    status        ENUM('waiting','playing','finished') DEFAULT 'waiting',
    started_at    TIMESTAMP,
    finished_at   TIMESTAMP,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player1_id) REFERENCES users(id),
    FOREIGN KEY (player2_id) REFERENCES users(id),
    FOREIGN KEY (winner_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== DUEL ANSWERS ==========
CREATE TABLE duel_answers (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    duel_id       BIGINT NOT NULL,
    user_id       BIGINT NOT NULL,
    card_id       BIGINT NOT NULL,
    selected_ans  CHAR(1),
    round         INT NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (duel_id) REFERENCES duels(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (card_id) REFERENCES quiz_cards(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========== INDEXES ==========
CREATE INDEX idx_quiz_cards_category ON quiz_cards(category);
CREATE INDEX idx_quiz_cards_difficulty ON quiz_cards(difficulty);
CREATE INDEX idx_quiz_cards_status ON quiz_cards(status);
CREATE INDEX idx_answer_logs_user ON answer_logs(user_id);
CREATE INDEX idx_answer_logs_card ON answer_logs(card_id);
CREATE INDEX idx_predictions_user ON predictions(user_id);
CREATE INDEX idx_predictions_card ON predictions(card_id);
CREATE INDEX idx_duels_status ON duels(status);
CREATE INDEX idx_duels_player1 ON duels(player1_id);
CREATE INDEX idx_duels_player2 ON duels(player2_id);
