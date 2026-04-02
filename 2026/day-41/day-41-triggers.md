Task 1 Observations about pr-check.yml

Trigger conditions:
```# Defining Trigger condition
on:
  pull_request:
    branches: [main]
    types: [opened, synchronize ]
```
opened: Triggers the workflow the very first time a Pull Request is created.
synchronize(update): Triggers the workflow every time you push new commits to an existing Pull Request branch.

github.head_ref: Returns the name of the "source" branch (e.g., testing) where the developer actually wrote the code.
github.ref_name: Returns the "merge-preview" branch (e.g., 1/merge), which is a temporary version of what the code looks like after it
is merged.

Pratical example:
```
Scenario: I open a PR from my fix-login branch, but a teammate just updated the main branch with new database settings.
The Conflict: My branch doesn't have those new settings yet, so testing only my branch might pass even if it would crash main.
The Solution: GitHub creates refs/pull/1/merge, a temporary version that virtually merges my code into the current main.
The Result: The CI/CD runner tests this "future" version of the code to ensure my login fix plays nice with the new database.
Why it matters: This prevents "Merge Hell" by catching bugs that only appear when two different developers' changes meet.
```

Task 2 Observations about Schedule trigger:
```
Everday at 12 am

on:
 push:
   branches: [main]

 schedule:
 - cron: '0 0 * * *'

Every Monday at 9am:

minute hour day-of-month month day-of-week
  0      9       *         *        1
```

Task 3 Observations on manual run:

For manual run, wee need to provide trigger as workflow_dispatch:
```
on:
 workflow_dispatch:
   inputs:
     environment:
       options:
       - staging
       - production
```

Once the workflow is merged in main, you can test this by going to actions tab, click on manual run on the left side and provide your 
input env (exp-staging or production). If you want a dropdown to display options in manual run, add choice as shown below:

```
on:
  workflow_dispatch:
    inputs:
      environment:
        type: choice  # Critical for the dropdown!
        options:
          - staging
          - production
```
github.event.inputs.VAR_NAME will retrieve the specific value the user selected when they clicked the button.

Task 4 Observations on matrix strategy:

To provide multiple OS we use the following:
```
jobs:
  validate:
    # Use the variable from the matrix below
    runs-on: ${{ matrix.os }}
    
    strategy:
      matrix:
        # Define the two OS options here
        os: [ubuntu-latest, macos-latest]
        # Your three Python versions
        python-version: ["3.10", "3.11", "3.12"]
```

Task 5 Observations:

exclude: Used to skip specific combinations that are known to be incompatible or unnecessary.
fail-fast: Controls whether the "all the jobs" stops when one job fails (true) or continues the mission to gather more data (false).

