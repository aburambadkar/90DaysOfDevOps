Task 1: The Problem 

Think about a team of 5 developers all pushing code to the same repo manually deploying to production.

Write in your notes:

What can go wrong?

Override Conflicts: Developer A might deploy their changes, and ten minutes later, Developer B deploys theirs—accidentally overwriting Developer A’s code because they didn't have the latest version.

Knowledge Factor: If only few people in the team know the commands to deploy, then the process will come to a halt if they are unavailable. The code is not tested so it can break, time consuming.

Lack of Audit Trail: If production breaks at 2:00, then it is hard to figureout who deployed what.

Configuration Drift: Manual changes are often made directly on the server ("hotfixing") and never recorded back in the code, making the server a "Snowflake" (unique and impossible to replicate)

What does "it works on my machine" mean and why is it a real problem?

The developer writes and tests the code locally on this machine which will have all the system libraries required to run the code. But, the server where this app is supposed to be run might not have the dependencies which are required to run the program.

OS Discrepancies: A developer might use macOS, while the production server runs Ubuntu. Simple things like file path case-sensitivity can crash the app.

Hidden Dependencies: The developer might have a specific version of a library installed globally three years ago that they forgot about. The production server won't have it.

How many times a day can a team safely deploy manually?

Once in a week/day

The "Fear Factor": Because manual deployment is risky and prone to error, teams start to fear it. They begin to "batch" changes, waiting weeks to deploy.

The Big Bang Failure: When you only deploy once a day (or week), that deployment contains hundreds of changes. If it breaks, it is a nightmare to figure out which of those hundreds of lines caused the bug.

Recovery Time: Safely deploying isn't just about the "push"; it's about the MTTR (Mean Time To Recovery). If a manual deploy fails, rolling back is also manual and slow, leading to extended downtime.

Task 2: CI vs CD

Research and write short definitions (2-3 lines each):

Continuous Integration — what happens, how often, what it catches

What happens: Developers merge their code changes back to the main branch as often as possible (at least daily). Every merge triggers an automated build and a battery of tests.

What it catches: Integration bugs—where my code and your code don't play nice together. It catches "breaking changes" before they ever leave the development stage.

Real-World Example: Every time you push a "bug fix" to GitHub, a tool like GitHub Actions automatically runs your Python scripts to make sure you didn't accidentally break the "Login" page.

Continuous Delivery — how it's different from CI, what "delivery" means

How it’s different: CI focuses on testing; Delivery focuses on packaging. "Delivery" means the code is always in a "ready-to-go" state. It is compiled, packaged (like a Docker image), and sitting on the shelf, waiting for a human to say "Go."

What "Delivery" means: It means the code is delivered to a staging or testing environment, but it is NOT yet live for the actual customers. There is a manual "Deploy" button.

Real-World Example: Your team finishes the "Shopping Cart" feature. The automation builds the app and puts it on a test server. The Product Manager looks at it, likes it, and clicks a button to send it to the real customers.

Continuous Deployment — how it differs from Delivery, when teams use it Write one real-world example for each.

How it differs from Delivery: There is NO manual button. If the code passes all the automated tests in the CI stage, it goes straight to the production server and the customers see it immediately.

When teams use it: Teams with high "maturity" and very high confidence in their automated tests.

Real-World Example: Companies like Netflix or Etsy. A developer pushes a change, the tests pass, and 10 minutes later, millions of people are using that new code without a human ever "approving" the final step.

Task 3: Pipeline Anatomy A pipeline has these parts — write what each one does:

Trigger — what starts the pipeline For exp, in your pipeline you have configured that the pipeline should run when a code is pushed to main.

Stage — a logical phase (build, test, deploy)

Job — a unit of work inside a stage

Step — a single command or action inside a job

Runner — the machine that executes the job

Artifact — output produced by a job


Task 4: Draw a Pipeline

A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

Stages of Pipeline:

Source: Push code to GitHub.

App Build/Prep: Install dependencies e.g., pip install -r requirements or compile the source code into a runnable format like a .jar or .exe before the tests can even start.

Unit Tests: Run tests on individual functions. Test your Python function in isolation (No Docker needed) (Fail here = Stop).

Docker Build: Convert the passed code into a Docker Image.

Integration Tests: Start the Docker container and test if it connects to other services (like a Database).

Deploy: Push that specific, tested Docker image to Staging/Production.

![My CI/CD Pipeline Diagram](cicd-flow.png)


Task 5: Explore in the Wild

Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)
Find their .github/workflows/ folder
Open one workflow YAML file

FAST api add-to-project.yaml
```
name: Add to Project

on:
  pull_request_target:
  issues:
    types:
      - opened
      - reopened

jobs:
  add-to-project:
    name: Add to project
    runs-on: ubuntu-latest
    steps:
      - uses: actions/add-to-project@v1.0.2
        with:
          project-url: https://github.com/orgs/fastapi/projects/2
          github-token: ${{ secrets.PROJECTS_TOKEN }}
```

Write in your notes:

What triggers it? 

If there is a pull request created, a new issue is opened or reopened


How many jobs does it have?
1 job

What does it do? 

It automatically takes new Issues and Pull Requests and adds them to the FastAPI Team's Project Board. It uses a pre-made GitHub Action (actions/add-to-project) to do the heavy lifting.
