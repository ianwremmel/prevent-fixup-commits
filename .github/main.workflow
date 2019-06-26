workflow "Validate Commit Messages" {
    on = "push"
    resolves = "Prevent Fixup Commits"
}

action "Prevent Fixup Commits" {
    uses = "ianwremmel/prevent-fixup-commits@master"
}
