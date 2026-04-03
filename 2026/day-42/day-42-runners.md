Task 1 Observations:

What is a GitHub-hosted runner? Who manages it?

A GitHub-hosted runner is a fresh virtual machine that GitHub spins up specifically for your job and destroys immediately after the job finishes.

Manager: While GitHub provides the service, the underlying infrastructure is managed by Microsoft Azure.

Benefit: You don't have to worry about maintenance, updates, or hardware; you just tell GitHub which OS you want (Ubuntu, Windows, or macOS).

Task 2 Observations:

Why does it matter that runners come with tools pre-installed?
so that the job can simply be ran without any dependencies issue.

Task 5 Observations:

Why are labels useful when you have multiple self-hosted runners?

Load Balancing: If you have five runners with the label production, GitHub will automatically send the job to whichever one is currently idle.

Specialized Hardware: You can use labels like gpu, arm64, or high-memory to ensure heavy jobs only run on the specific machines capable of handling them.

Redundancy: If one runner goes offline, another runner with the same label can immediately pick up the work without you needing to change a single line of your YAML code.


Task 6 Observations:

| Feature | GitHub-Hosted | Self-Hosted |
| :--- | :--- | :--- |
| **Who manages it?** | GitHub (Microsoft Azure) | **You** (AWS/On-prem) |
| **Cost** | Free (Public) / Minutes (Private) | Instance/Hardware costs |
| **Maintenance** | None | High (OS updates/Security) |
| **Pre-installed Tools** | 100s of tools included | Custom (You install them) |
| **Security** | High (Disposable VMs) | Moderate (Persistent environment) |
| **Best For** | General purpose builds | Private data & High performance |
