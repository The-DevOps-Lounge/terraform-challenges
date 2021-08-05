# Terraform Challenges

Terraform challenges for beginners and advanced students and users.

The idea is simple: provide students with a single Terraform code base that has breaking changes introduced into it, then allow them to fix them.

## Branches

We introduce the breaking changes using branches that stem from the primary branch called `solution`. The branches that contain problems are called levels and follow the format `level-N` where `N` is the level, such as `1`, `2`, `7` or `12`, etc.

The `main` branch is used only for documentation purposes and contains no code.

## Process

Please switch to the `solution` branch and review the code - lint it, validate it, apply it, destroy it, etc. When you're ready, move onto branch `level-1` and begin the process again, fixing the code as you go until you can successfully apply the code.

So as a student the recommended process for you looks a bit like this:

1. Fork the repository
    1. Note: the `main` branch doesn't contain any Terraform code, only this `README.md`
1. Switch to the `solution` branch
1. Run `terraform init` (this step may fail)
1. Run `terraform validate` (this step may fail)
1. Run `terraform plan` (this step may fail)
1. Run `terraform apply` (this step may fail)
1. Run `terraform destroy` (this step will never fail due to potential financial implications)
1. Switch to the `level-1` branch and repeat the above steps, fixing the issues you face

At each level above the previous, the problems get harder and harder.

### The Solution

The repository's `solution` branch represents a **working** solution. Should you get stuck, `git switch solution` to move back to this working copy of the code.

This branch is the main branch all problems are stemmed from. This code is taken, broken, and the challenge is then presented back to you to solve.

## Getting Help

If you're struggling to understand the above instructions, have found an issue with the repository or just want general assistance, please join [The DevOps Lounge community](https://discord.gg/MTzBvSS) and seek assistance in the `#help` channel.

