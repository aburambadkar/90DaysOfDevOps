Task 1 Observations

What is a reusable workflow?
Its a yaml file with multiple tasks that can be called by other workflows to avoid duplication, simplify maintenance, and standardize CI/CD processes across repositories

What is the workflow_call trigger?
A workflow_Call trigger enables a workflow to be called and executed by another workflow

How is calling a reusable workflow different from using a regular action (uses:)?
A regular action(uses) has only one task where as a reusable workflow file can have multiple tasks in a step.

Where must a reusable workflow file live?
Reusable workflow files must be stored in the .github/workflows directory of a GitHub repository
