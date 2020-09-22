# vro-package-diff-action
Github action using vro-package-diff python package to compare two VMware vRealize Orchestrator packages.

# Inputs

* `package_path`: Relative path of the package to test
* `branch` (optional, default: `master`): Branch of the reference package to test against
* `repo_token` (optional, default: `<empty>`): A reference to the `secrets.GITHUB_TOKEN` if the repository is private.

# Usage
Include this in your `.github/workflows/<test>.yaml` after a `actions/checkout@v2` step:

```yaml
uses: lrivallain/vro-package-diff-action@master
with:
  package_path: path/to/my/vro-package.package
```

or, if you want to override the defaults reference branch,

```yaml
uses: lrivallain/vro-package-diff-action@master
with:
  package_path: path/to/my/vro-package.package
  branch: prod
```

If your repository is a private one, the action will require a temporary job token to get the reference branch:

```yaml
uses: lrivallain/vro-package-diff-action@master
with:
  package_path: path/to/my/vro-package.package
  repo_token: ${{ secrets.GITHUB_TOKEN }}
```

# Full usage example

```yaml
runs-on: ubuntu-latest

steps:
    - name: Checkout
      uses: actions/checkout@v2
    - uses: lrivallain/vro-package-diff-action@master
      with:
        package_path: path/to/my/vro-package.package
        branch: prod
        repo_token: ${{ secrets.GITHUB_TOKEN }}
```