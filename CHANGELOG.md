# Changelog - IAM Roles Terraform Module

/--------------------------------------------------------------------------------/

## v0.7 - Minor Update
* Implementation of terraform-module-ci workflow

## v0.6 - Minor Update
* Roles are always created with permissions boundary policy attached

## v0.5 - Minor Update
* Sources OIDC provider URL from org-data-fetch for linking to the role
* Broke out examples into separate directories

## v0.4 - Minor Update
* Updated Test-IaC references to production GitHub organization
* Updated org-data-fetch references
* Minor cleanup

## v0.3 - Initial Release
* Sources naming from org-data, adds required default_tags (tf_module)

## v0.2 - Initial Release
* Updated variable names to align with coding standards

## v0.1 - Initial Release
* Implemented an opinionated terraform module designed for use by product teams to construct AWS IAM roles intended for service/machine use.

### Added Functionality

#### Creation of:
* Service/Machine roles to be assumed by AWS Services
* Pod/ROSA roles to be assumed by ROSA service accounts

### Known Issues

/--------------------------------------------------------------------------------/

## Previous Releases

No release to archive just yet.
