# Prevent Fixup Commits

> This action prevents you from merging `fixup!` commits into master.

## Usage

An example workflow to prevent `fixup!` commits follows:

```yml
on: push
name: Validate Commit Messages
jobs:
  build:
    name: ianwremmel/prevent-fixup-commits
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
      with:
        fetch-depth: 0
    - uses: ianwremmel/prevent-fixup-commits@v2

```

v2 is a composite action, so it runs in job containers and under ARC's
Kubernetes container mode. It needs `bash` and `git` on the runner or in the job
container. The `v1` tags remain the Docker version.
