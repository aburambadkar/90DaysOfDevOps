Why GitHub says scheduled workflows may be delayed or skipped on inactive repos?

If a repo ha been inactive for 60 days, Github states that the schedules workflows will be disabled.
GitHub Actions runners are a shared pool of resources. Scheduled workflows are given a lower priority than "on-push" or "manual" workflows.

Wasted compute: There is no point in GitHub spinning up a virtual machine every 15 minutes to test code that hasn't changed in two years.

When will you use path vs path-ignore?

1. Use paths:
   
Use this when your repository is large and multi-purpose.
Example: You have a "Monorepo" with a /frontend folder and a /backend folder.

Why: You only want the "Frontend CI" to run if files inside the /frontend folder change. If someone updates the backend, the frontend workflow stays quiet.

2. Use paths-ignore:
   
Use this when your repository is dedicated to one application.
Example: Your sys-stats-app repo.

Why: You want the workflow to run for almost everything (code, config, dependencies, tests). The only things that shouldn't trigger a build are non-code files like README.md, LICENSE, or .github/ISSUE_TEMPLATE.md.
