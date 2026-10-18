# Architecture

Example content. Replace it with the real architecture once the project has one.

## Stack

- Java 25, Spring Boot
- PostgreSQL for persistent state
- Kafka for events between services, only where a task says it is required

## Service boundaries

Each service owns its data. Other services reach that data through the owning service's API or its Kafka events, never through its tables.

Inside a service, code is layered:

| Layer | Package | May call |
|-------|---------|----------|
| API | `..api` | Service |
| Service | `..service` | Repository, client |
| Repository | `..repository` | PostgreSQL |
| Client | `..client` | Other services, Kafka |

A layer never calls the layer above it. Controllers hold no business logic, and repositories hold no business rules.

## Jobs

A long-running job records each run (start, end, status, error) in a run table. A restarted job reads that table to skip work that already completed.

## Related documents

- [CODING_GUIDE.md](CODING_GUIDE.md)
- [TESTING_GUIDE.md](TESTING_GUIDE.md)
- [specs/](specs/)
