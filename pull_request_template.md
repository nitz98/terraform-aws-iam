# terraform-aws-iam Pull Request Template

## Ticket Tracking
#### JIRA Ticket Number:
#### JIRA Ticket Link:

## Pre-Merge Checklist
- [ ] I have performed a self-review of my code
- [ ] I have run `terrform fmt` on any directory I have changed
- [ ] I have tested to ensure that the Module deploys cleanly and as expected
- [ ] I have cleaned up any resources created while testing
- [ ] I have ensured that this module does not contain any secrets or hard-coded values
- [ ] I have ensured that all Checkov checks are either passing or suppressed due to irrelevance (with explanatory comments)
- [ ] I have ensured that my changes are consistent with the guidelines from AWS's internal Deliverable Security Review
- [ ] I have ensured any updated/created modules only expose variables which are allowed/expected to be used
- [ ] I have recorded my changes in CHANGELOG.md (or created one with an initial release description, for new modules)
- [ ] If applicable (e.g. DB), I have created and documented the permissions required for different EDA personas to interact with the resource
