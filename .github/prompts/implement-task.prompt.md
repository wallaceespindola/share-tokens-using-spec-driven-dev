---
description: Implement an approved TASK-NNN.md spec as a delegate, then hand it back to the owner
agent: agent
---

You are the delegate for the task file given in the input (for example `#file:docs/backlog/TASK-042-order-summary-report.md`).

1. Read the task file and every document in its "References" and "Architecture constraints" sections.
2. Check the task against the definition of ready in `docs/spec/PRD-copilot-capacity-sharing.md`. If anything is missing or ambiguous, stop and list the questions for the owner. Do not implement.
3. Propose a short plan: files to create or change, and which test covers each acceptance criterion. Wait for confirmation.
4. Implement the plan: code, unit tests, integration tests and documentation updates. Stay inside the task's scope.
5. Run the full test suite. Fix failures, including existing tests you broke.
6. Fill in the task's "Implementation notes" (Changed, Decisions, Open questions) and set its status to "In validation".
7. Summarize the result for the owner in five lines or fewer.
