# Prevent Fixup Commits

> This action prevents you from merging `fixup!` commits into master.

## Usage

An example workflow to prevent `fixup!` commits follows:

```hcl
workflow "Validate Commit Messages" {
    on = "push"
    resolves = "Prevent Fixup Commits
}

action "Prevent Fixup Commits" {
    uses "ianwremmel/prevent-fixup-commits"
}
```