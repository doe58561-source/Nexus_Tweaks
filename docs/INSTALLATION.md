# 📦 Installation Guide

This guide provides detailed instructions for installing and setting up Nexus Tweaks on your Windows system.

## 🔧 System Requirements

### Minimum Requirements

- **Operating System**: Windows 10 (version 1903 or later) or Windows 11
- **Architecture**: x64 (64-bit)
- **RAM**: 4GB minimum (8GB recommended)
- **Storage**: 100MB free space
- **Privileges**: Administrator access required

### Recommended Setup

- **Fresh Windows Installation**: For best results, run on a clean Windows installation
- **System Restore**: Ensure System Restore is enabled
- **Backup**: Recent backup of important data
- **Antivirus**: Temporarily disable real-time protection during installation

## 📥 Download Options

### Option 1: Git Clone (Recommended for Developers)

```bash
git clone https://github.com/yourusername/nexus-tweaks.git
cd nexus-tweaks
```

### Option 2: Download ZIP

1. Go to the [GitHub repository](https://github.com/yourusername/nexus-tweaks)
2. Click the green "Code" button
3. Select "Download ZIP"
4. Extract to your desired location

### Option 3: GitHub Releases

1. Visit the [Releases page](https://github.com/yourusername/nexus-tweaks/releases)
2. Download the latest release
3. Extract to your desired location

## 🚀 Installation Steps

### Step 1: Prepare Your System

1. **Create a System Restore Point**
   ```cmd
   # Open Command Prompt as Administrator
   wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Nexus Tweaks", 100, 7
   ```

2. **Close Unnecessary Programs**
   - Close all non-essential applications
   - Disable antivirus real-time protection temporarily

3. **Check Windows Updates**
   - Ensure Windows is up to date
   - Restart if updates were installed

### Step 2: Download and Extract

1. **Choose Installation Location**
   - Recommended: `C:\Tools\NexusTweaks\`
   - Avoid: Desktop, Downloads, or system directories

2. **Extract Files**
   - Extract all files to your chosen directory
   - Ensure `Nexus_Tweaks.bat` is present

### Step 3: Verify Installation

1. **Check File Integrity**
   ```cmd
   dir "C:\Tools\NexusTweaks\"
   ```
   
   You should see:
   - `Nexus_Tweaks.bat`
   - `README.md`
   - `LICENSE`
   - Other documentation files

2. **Test Administrator Access**
   - Right-click `Nexus_Tweaks.bat`
   - Verify "Run as administrator" option is available

## ⚙️ Configuration

### Optional Pre-Configuration

Before running Nexus Tweaks, you may want to:

1. **Review the Script**
   - Open `Nexus_Tweaks.bat` in a text editor
   - Review the tweaks that will be applied
   - Comment out any tweaks you don't want

2. **Backup Registry**
   ```cmd
   # Create registry backup (optional)
   reg export HKLM backup_hklm.reg
   reg export HKCU backup_hkcu.reg
   ```

3. **Document Current Settings**
   - Take screenshots of current system settings
   - Note any custom configurations

## 🏃‍♂️ First Run

### Running Nexus Tweaks

1. **Right-click** on `Nexus_Tweaks.bat`
2. **Select** "Run as administrator"
3. **Click "Yes"** when prompted by User Account Control
4. **Follow the on-screen prompts**

### What Happens During First Run

1. **Administrator Check**: Verifies you have admin privileges
2. **Warning Display**: Shows important safety information
3. **User Confirmation**: Asks for permission to proceed
4. **Restore Point**: Creates automatic system restore point
5. **Optimization Process**: Applies selected tweaks
6. **Completion Summary**: Shows what was changed
7. **Restart Prompt**: Offers to restart the system

## 🔍 Verification

### After Installation

1. **Check System Stability**
   - Restart your computer
   - Verify all programs launch normally
   - Test internet connectivity

2. **Review Applied Changes**
   - Check Windows Settings for modifications
   - Verify services are running as expected
   - Test system performance

3. **Monitor for Issues**
   - Watch for any unusual behavior
   - Note any application compatibility issues
   - Monitor system performance

## 🛠️ Troubleshooting

### Common Installation Issues

#### "Access Denied" Error
- **Cause**: Insufficient privileges
- **Solution**: Ensure you're running as Administrator

#### "File Not Found" Error
- **Cause**: Incomplete extraction or wrong directory
- **Solution**: Re-extract all files to the same directory

#### Antivirus Blocking
- **Cause**: Antivirus software blocking batch file
- **Solution**: Temporarily disable real-time protection

#### Script Won't Run
- **Cause**: Execution policy or security settings
- **Solution**: Check Windows execution policies

### Getting Help

If you encounter issues:

1. **Check the FAQ** in the main README
2. **Search existing issues** on GitHub
3. **Create a new issue** with detailed information
4. **Join the discussion** in GitHub Discussions

## 🔄 Updating

### Updating to New Versions

1. **Backup current version**
   ```cmd
   xcopy "C:\Tools\NexusTweaks" "C:\Tools\NexusTweaks_backup" /E /I
   ```

2. **Download new version**
   - Follow download steps above

3. **Replace files**
   - Extract new version to same directory
   - Overwrite existing files

4. **Review changes**
   - Check CHANGELOG.md for new features
   - Review any new warnings or requirements

## 🗑️ Uninstallation

### Removing Nexus Tweaks

1. **Revert Changes** (if needed)
   - Use System Restore to restore to pre-Nexus state
   - Or manually revert specific changes

2. **Delete Files**
   ```cmd
   rmdir /s "C:\Tools\NexusTweaks"
   ```

3. **Clean Registry** (optional)
   - No registry entries are created by default
   - Only needed if you made custom modifications

---

## 📞 Support

For installation support:
- 📖 Check the [main README](../README.md)
- 🐛 Report issues on [GitHub Issues](https://github.com/yourusername/nexus-tweaks/issues)
- 💬 Ask questions in [GitHub Discussions](https://github.com/yourusername/nexus-tweaks/discussions)