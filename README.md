<div align="center">
  <img src="assets/banner.svg" alt="Nexus Tweaks Banner" width="800"/>
  
  <p>
    <a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License"></a>
    <a href="https://www.microsoft.com/windows"><img src="https://img.shields.io/badge/Platform-Windows%2010%2F11-blue.svg" alt="Windows"></a>
    <a href="https://en.wikipedia.org/wiki/Batch_file"><img src="https://img.shields.io/badge/Language-Batch-green.svg" alt="Batch"></a>
    <img src="https://img.shields.io/badge/Version-1.0.0-brightgreen.svg" alt="Version">
    <img src="https://img.shields.io/badge/Status-Active-success.svg" alt="Status">
  </p>
</div>

> A curated set of safe, reversible optimizations for Windows 10/11 designed to improve performance, responsiveness, privacy, and clarity.

Nexus Tweaks is a comprehensive Windows optimization toolkit that trims nonessential services, removes bloat, applies sensible power/network/file-system settings, and documents every change so you can customize or revert at any time—aiming for a fast, stable, and controllable Windows experience.

## ✨ Features

- 🔧 **Safe & Reversible**: All optimizations can be easily reverted
- 🚀 **Performance Boost**: Improved system responsiveness and speed
- 🔒 **Privacy Enhanced**: Better control over data collection and telemetry
- 📋 **Well Documented**: Every change is clearly documented
- ⚙️ **Customizable**: Easily modify or disable specific tweaks
- 🛡️ **Stability Focused**: Maintains system stability while optimizing

## 🎯 What It Does

- **Service Optimization**: Disables unnecessary background services
- **Bloatware Removal**: Removes or disables unwanted pre-installed apps
- **Power Settings**: Optimizes power management for better performance
- **Network Tweaks**: Improves network responsiveness and throughput
- **File System**: Optimizes file system settings for faster access
- **Privacy Controls**: Reduces telemetry and data collection

## 🚀 Quick Start

### Prerequisites

- Windows 10 or Windows 11
- Administrator privileges
- Basic understanding of Windows system settings

### Installation

1. **Download the latest release**
   ```bash
   git clone https://github.com/doe58561-source/Nexus_Tweaks.git
   cd Nexus_Tweaks
   ```

2. **Run as Administrator**
   - Right-click on `Nexus_Tweaks.bat`
   - Select "Run as administrator"

3. **Follow the prompts** to apply your desired optimizations

## 📖 Documentation

| Document | Description |
|----------|-------------|
| 📦 [Installation Guide](docs/INSTALLATION.md) | Complete installation instructions and setup |
| 📖 [Usage Guide](docs/USAGE.md) | Comprehensive usage instructions and tips |
| ❓ [FAQ](docs/FAQ.md) | Frequently asked questions and troubleshooting |
| 🤝 [Contributing](CONTRIBUTING.md) | How to contribute to the project |
| 🛡️ [Security Policy](SECURITY.md) | Security guidelines and reporting |

### Basic Usage

Simply run the batch file with administrator privileges:

```cmd
# Right-click and "Run as administrator"
Nexus_Tweaks.bat
```

### Advanced Usage

You can customize the tweaks by editing the batch file or using command-line parameters (coming soon). See the [Usage Guide](docs/USAGE.md) for detailed instructions.

## ⚠️ Important Notes

- **Always create a system restore point** before running the tweaks
- **Review the changes** in the script before applying
- **Test thoroughly** after applying optimizations
- **Keep backups** of important data

## 🔄 Reverting Changes

All tweaks in Nexus Tweaks are designed to be reversible. To revert changes:

1. Use Windows System Restore to a point before running the tweaks
2. Manually reverse specific changes using the documentation provided
3. Use the planned "revert" functionality (coming in future versions)

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📋 Roadmap

- [ ] GUI interface for easier use
- [ ] Automatic backup and restore functionality
- [ ] More granular control over individual tweaks
- [ ] Performance benchmarking tools
- [ ] Community tweak submissions

## 🐛 Bug Reports & Feature Requests

Please use the [Issues](https://github.com/doe58561-source/Nexus_Tweaks/issues) page to:
- Report bugs
- Request new features
- Ask questions
- Share feedback

## 📜 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## ⚖️ Disclaimer

**Use at your own risk.** While these tweaks are designed to be safe, modifying system settings always carries some risk. Always:

- Create backups before making changes
- Test in a non-production environment first
- Understand what each tweak does before applying it

## 🙏 Acknowledgments

- Windows optimization community for sharing knowledge
- Contributors who help improve this toolkit
- Users who provide feedback and bug reports

---

<div align="center">
  <strong>Made with ❤️ for the Windows community</strong>
</div>
