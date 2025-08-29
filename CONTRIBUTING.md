# Contributing to Nexus Tweaks

Thank you for your interest in contributing to Nexus Tweaks! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Reporting Issues

Before creating a new issue, please:

1. **Search existing issues** to avoid duplicates
2. **Use the issue templates** when available
3. **Provide detailed information** including:
   - Windows version (10/11, build number)
   - Steps to reproduce the issue
   - Expected vs actual behavior
   - Any error messages or logs

### Suggesting Enhancements

We welcome suggestions for new tweaks and improvements! Please:

1. **Check the roadmap** in README.md to see if it's already planned
2. **Create a detailed issue** explaining:
   - What the enhancement would do
   - Why it would be beneficial
   - How it should work
   - Any potential risks or considerations

### Code Contributions

#### Getting Started

1. **Fork the repository**
2. **Clone your fork** locally
3. **Create a feature branch** from `main`
4. **Make your changes**
5. **Test thoroughly** on multiple Windows versions if possible
6. **Submit a pull request**

#### Development Guidelines

- **Safety First**: All tweaks must be safe and reversible
- **Document Everything**: Add comments explaining what each change does
- **Test Thoroughly**: Test on clean Windows installations
- **Follow Existing Style**: Match the coding style of existing files
- **One Feature Per PR**: Keep pull requests focused on a single feature/fix

#### Batch Script Guidelines

- Use clear, descriptive comments
- Include error handling where appropriate
- Provide user feedback for all operations
- Test with both Windows 10 and 11
- Ensure all changes are reversible

#### Adding New Tweaks

When adding new optimization tweaks:

1. **Research thoroughly** - Understand what the tweak does
2. **Verify safety** - Ensure it won't break systems
3. **Document the change** - Explain the purpose and method
4. **Add reversal instructions** - How to undo the change
5. **Test extensively** - On multiple systems and configurations

### Pull Request Process

1. **Update documentation** if your changes affect user-facing functionality
2. **Add or update comments** in the code
3. **Test your changes** on at least one Windows system
4. **Write a clear PR description** explaining:
   - What changes you made
   - Why you made them
   - How to test them
   - Any potential risks

### Code of Conduct

#### Our Standards

- **Be respectful** and inclusive in all interactions
- **Focus on constructive feedback** rather than personal criticism
- **Help others learn** and grow
- **Accept responsibility** for mistakes and learn from them

#### Unacceptable Behavior

- Personal attacks or harassment
- Discrimination of any kind
- Publishing others' private information
- Spam or off-topic content

By participating, you agree to abide by the `CODE_OF_CONDUCT.md`.

## 🛡️ Security Considerations

Since this project modifies system settings:

- **Never include malicious code** or backdoors
- **Avoid unnecessary system access** - only modify what's needed
- **Document security implications** of any changes
- **Report security issues privately** to maintainers first

## 📋 Development Setup

### Prerequisites

- Windows 10 or 11 for testing
- Text editor with batch file syntax highlighting
- Git for version control
- Virtual machines recommended for testing

### Testing

- **Test on clean Windows installations** when possible
- **Use virtual machines** for safer testing
- **Create system restore points** before testing
- **Document any issues** encountered during testing

### Style Guidelines

- Use LF endings for docs and scripts; CRLF for Windows-only scripts
- Follow `.editorconfig` conventions
- Keep changes small and focused
- Prefer scripts that are idempotent and well-commented
- Document every change and its rollback

## 📞 Getting Help

If you need help with contributing:

1. **Check existing issues** and documentation first
2. **Create a discussion** in the GitHub Discussions tab
3. **Be specific** about what you need help with
4. **Be patient** - maintainers are volunteers

## 🏆 Recognition

Contributors will be recognized in:
- The project's README.md file
- Release notes for significant contributions
- The GitHub contributors page

Thank you for helping make Nexus Tweaks better for everyone!

---

*This contributing guide is adapted from open source best practices and may be updated as the project evolves.*
