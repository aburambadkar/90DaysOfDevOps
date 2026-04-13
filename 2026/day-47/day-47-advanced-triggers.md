Why GitHub says scheduled workflows may be delayed or skipped on inactive repos?

If a repo ha been inactive for 60 days, Github states that the schedules workflows will be disabled.
GitHub Actions runners are a shared pool of resources. Scheduled workflows are given a lower priority than "on-push" or "manual" workflows.

Wasted compute: There is no point in GitHub spinning up a virtual machine every 15 minutes to test code that hasn't changed in two years.
