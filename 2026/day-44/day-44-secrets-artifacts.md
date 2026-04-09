Task 1 Observations:

What happens when you print a secret?

When you run that second step, GitHub doesn't show your actual message. Instead, you will see:
```
The secret value is ***
```

How GitHub's Masking Works?

GitHub Actions automatically masks any value defined in your "Secrets" vault.

The Log Redactor: As the workflow runs, GitHub scans the console output in real-time. If it detects a string that matches one of your stored secrets, it replaces it with *** before the logs are saved or displayed.

Security Layer: This protects you in case you accidentally echo a variable or a tool prints a debug log containing an API key.
