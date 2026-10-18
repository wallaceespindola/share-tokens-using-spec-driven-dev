# TASK-042: Generate order summary report

Status: Draft
Owner: <name>
Reviewer: <name>
Delegate: <name>
Issue: <link>

## Objective

Generate the order summary report from normalized order records.

## Tech stack

- Java 25
- Spring Boot
- PostgreSQL
- Kafka where required

## Inputs

- Report configuration
- Order records

## Expected behavior

1. Load the report configuration.
2. Retrieve the eligible orders.
3. Generate the report.
4. Store the delivery metadata.

## Architecture constraints

- Follow [ARCHITECTURE.md](../ARCHITECTURE.md).
- Follow [CODING_GUIDE.md](../CODING_GUIDE.md).
- Do not bypass the defined service boundaries.

## Acceptance criteria

- [ ] The report is generated for all eligible orders.
- [ ] The job can be restarted after a failure.
- [ ] A failed run is recorded.
- [ ] Unit tests cover the new code.
- [ ] Integration tests cover the end-to-end flow.

## Out of scope

- File transport
- Customer notification

## References

- [ARCHITECTURE.md](../ARCHITECTURE.md)
- [TESTING_GUIDE.md](../TESTING_GUIDE.md)
- [Report generation design](../specs/report-generation/design.md)

## Implementation notes

Filled in by the delegate at handback.

- Changed:
- Decisions:
- Open questions:
