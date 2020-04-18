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
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
    - uses: ianwremmel/prevent-fixup-commits@master

```
