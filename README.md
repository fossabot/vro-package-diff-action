# vro-package-diff-action
Github action using vro-package-diff python package to compare two VMware vRealize Orchestrator packages.

# Inputs

* `branch` (optional, default: `master`): Branch of the reference package to test against
* `package_path`: Relative path of the package to test

# Usage
Include this in your `.github/workflows/<test>.yaml`:

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
  branch: 'prod'
```
