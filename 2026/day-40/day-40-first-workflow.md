Task observations:

Common Triggers & Event-Specific Variable:

Depending on your trigger event, you may need these specific GitHub Actions variables:

Pull Request (Source Branch): Use github.head_ref or GITHUB_HEAD_REF to get the name of the branch you are merging from.
Pull Request (Target Branch): Use github.base_ref or GITHUB_BASE_REF to get the name of the branch you are merging into.
Push Event: Use github.ref_name for the branch name or github.ref for the full path.
