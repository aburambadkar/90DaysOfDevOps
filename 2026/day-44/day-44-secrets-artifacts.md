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

Task 3 Observations:

Why use actions/upload-artifact?

Imagine you are compiling a Java application or building a Docker image. The runner does the hard work, but you need the final .jar or log file on your local machine or a production server. This action "rescues" the file before the runner is deleted.

Task 6 Observations:

If you use actions/cache@v4 before installing dependencies, it creates a cache folder which contains your requirements files.
So nect time when you run the pipeline again, it uses this folder which is stored on githubs storage to install the dependencies.
