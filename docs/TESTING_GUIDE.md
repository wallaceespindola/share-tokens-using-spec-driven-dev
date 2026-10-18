# Testing guide

Example content. Adjust it to the team's real setup.

## Tools

- JUnit 5 and Mockito for unit tests.
- Spring Boot test support with a real PostgreSQL instance (e.g. Testcontainers) for integration tests.

## What each level covers

| Level | Scope | Dependencies |
|-------|-------|--------------|
| Unit | One class or a few collaborating classes | Mocked |
| Integration | One flow through the service, including the database | Real PostgreSQL, Kafka where the flow uses it |
| Functional | Behavior seen by the user: screens, simulations | Deployed environment |

## Rules

- New code comes with unit tests. Target line coverage is above 80%.
- Every acceptance criterion in a task maps to at least one test.
- The full suite passes before a delegate hands work back and before the owner opens a PR.
- A test that fails intermittently is fixed or removed, not retried until it passes.
