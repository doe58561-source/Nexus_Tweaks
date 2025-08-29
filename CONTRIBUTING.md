# Contributing to Nexus Tweaks

Thanks for your interest in improving Nexus Tweaks. This guide explains how to propose changes and report issues.

## Ways to contribute
- Report bugs or regressions
- Propose new tweak modules and rollbacks
- Improve documentation and testing
- Benchmark changes across Windows versions

## Ground rules
- Favor safe, reversible tweaks with clear rationale
- Avoid breaking core Windows features; prefer opt-in for risky changes
- Document every change and its revert path
- Test on Windows 10 and 11 when possible

## Pull Request process
1. Fork and create a feature branch
2. Keep changes focused and commit messages clear
3. Update related docs (`README`, `docs/`, `CHANGELOG.md`) when user-facing
4. Ensure scripts use CRLF line endings where applicable and run non-interactively
5. Open a PR and fill out the template

## Development notes
- Place modules in `scripts/` (PowerShell preferred). Batch is for the launcher.
- Conform to `.editorconfig` and `.gitattributes`.
- Provide a matching rollback for each tweak.