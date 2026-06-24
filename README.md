# Qwik BE

Spring Boot backend for Quiz Game — feed, answer, auth, social.

## Tech Stack

- Java 21 + Spring Boot 3.2
- MySQL 8 + Flyway migrations
- Redis (session/cache)
- JWT (jjwt) + Apple Sign In (Nimbus)
- WebSocket (STOMP)

## Setup

```bash
docker compose up -d        # MySQL:3306 + Redis:6377
./gradlew bootRun           # :8080
```

## Architecture

```
com.qwik/
├── common/       — BaseTimeEntity, GlobalExceptionHandler
├── config/       — Security, WebSocket, Redis config
├── controller/   — Auth, Quiz, Score endpoints
├── dto/          — Request/Response DTOs
├── domain/       — Entity + Repository (user, quiz, score, prediction)
├── security/     — JWT filter, AppleAuthService
└── service/      — QuizService, UserService
```

## API

| Method | Path              | Auth | Description     |
| ------ | ----------------- | ---- | --------------- |
| POST   | `/api/auth/apple` | No   | Apple Sign In   |
| POST   | `/api/auth/login` | No   | Email login     |
| POST   | `/api/auth/register` | No | Register        |
| GET    | `/api/quiz/feed`  | Yes  | Paginated feed  |
| POST   | `/api/quiz/answer`| Yes  | Submit answer   |
| GET    | `/ws`             | No   | WebSocket       |

## Database

Flyway migrations in `src/main/resources/db/migration/`. Hibernate `ddl-auto: none`.
