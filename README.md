# Prevent Fixup Commits

> This action prevents you from merging `fixup!` commits into master.

## Usage

An example workflow to prevent `fixup!` commits follows:

```yml
on: push
name: Validate Commit Messages
jobs:
  build:
    name: ianwremmel/prevent-fixup-commits@v1.0.0
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: ianwremmel/prevent-fixup-commits@v1.0.0

```
