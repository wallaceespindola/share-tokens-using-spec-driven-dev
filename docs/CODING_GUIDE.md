# Coding guide

Example content. Adjust it to the team's real conventions.

## Java

- Java 25, Spring Boot, Maven.
- Records for DTOs and value objects. Lombok only where a record does not fit.
- Constructor injection only. No field injection.
- Maximum line length: 120 characters.
- No hardcoded secrets, credentials or environment-specific values. Read them from configuration.

## Persistence

- PostgreSQL schema changes go through versioned migrations, never manual DDL.
- Queries that select work for a job filter in SQL, not in Java.

## Errors and logging

- Validate input at the API boundary. Trust data inside the service.
- Log a failure once, where it is handled, with enough context to find the record involved.

## Commits and pull requests

- Commit messages use the imperative mood and say why the change was made.
- A PR that implements a task links its file in `docs/backlog/`.
