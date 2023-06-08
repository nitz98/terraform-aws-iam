# IAM Roles

This module presents an interface for constructing IAM Roles.  The assumeRole policy is abstracted from the user to simplify role construction by use-case.

Two use cases are supported for v0 - AWS Service Roles and IRSA Roles.

### Terraform Engineering Standards

New modules must conform to the standards laid out in [Confluence - TF Engineering Standards](https://cpg-gpc.atlassian.net/wiki/spaces/NGI/pages/122683686913/Infrastructure+Engineering+Standards+Terraform)

### TODO

* update CODEOWNERS when moved into live github org

### Contents

Terraform modules intended to be reused via product-iac repositories

### Authoring a Module

* Ensure you follow Amazon's Deliverable Security Review criteria
* Ensure you run fmt, checkov etc before opening a pull request (to minimize CI failures)
* Ensure that you include an examples folder for any new module
* Treat existing modules as a "style guide" to ensure this codebase remains coherent and easily understood
* Ensure you include a proper README.md and CHANGELOG.md inside each module
* Don't forget to push a git tag once you merge to production

### Auto-Generating Module Documents

From the module root path:
```shell
% terraform-docs markdown table . --output-file "README.md"
README.md updated successfully
```

### Running Checkov Checks

```shell
% checkov --quiet --directory .
terraform scan results:

Passed checks: 54, Failed checks: 0, Skipped checks: 2

```

For full output, omit the `--quiet` flag
