# Terraform Challenges

Terraform challenges for beginners and advanced students and users.

The idea is simple: provide students with a single Terraform code base that has breaking changes introduced into it, then allow them to fix them. We introduce the breaking changes using branches.

## Branches

This repository contains several branches that represent certain working and non-working states of the code. As a student the recommended process for you looks a bit like this:

1. Clone the repository
    1. Note: the `main` branch doesn't contain any Terraform code, only this `README.md`
1. Switch to the `problem-1` branch
1. Run `terraform init` (this step may fail)
1. Run `terraform validate` (this step may fail)
1. Run `terraform plan` (this step may fail)
1. Run `terraform apply` (this step may fail)
1. Run `terraform destroy` (this step will never fail due to potential financial implications)

Once you're done with that branch consider moving to the next one. You'll be presented with code that's broken in some way and requires fixing.

### The Solution

The repository's `solution` branch represents a **working** solution. Should you get stuck, `git switch solution` to move back to this working copy of the code.

Good luck.
