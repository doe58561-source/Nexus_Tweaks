# 📖 Usage Guide

This comprehensive guide explains how to use Nexus Tweaks effectively and safely.

## 🚀 Quick Start

### Basic Usage

1. **Right-click** on `Nexus_Tweaks.bat`
2. **Select** "Run as administrator"
3. **Read** the warning message carefully
4. **Type** `y` and press Enter to confirm
5. **Wait** for the optimization process to complete
6. **Restart** your computer when prompted

### First-Time Users

If this is your first time using Nexus Tweaks:

1. **Create a backup** of important data
2. **Create a system restore point** manually (in addition to the automatic one)
3. **Read this entire guide** before proceeding
4. **Consider testing** in a virtual machine first

## 🎛️ Interface Overview

### Main Menu

When you run Nexus Tweaks, you'll see:

```
============================================================================
                    NEXUS TWEAKS - WINDOWS OPTIMIZER
============================================================================

  Version: 1.0.0
  Platform: Windows 10/11
  License: Apache 2.0

  WARNING: This script will modify system settings. Please ensure you have:
  - Created a system restore point
  - Backed up important data
  - Read and understood what each tweak does

============================================================================
```

### Progress Indicators

The script shows progress through 6 main phases:

1. **[1/6] Creating system restore point**
2. **[2/6] Optimizing system services**
3. **[3/6] Applying privacy enhancements**
4. **[4/6] Applying performance tweaks**
5. **[5/6] Optimizing network settings**
6. **[6/6] Optimizing file system**

## 🔧 Optimization Categories

### Service Optimization

**What it does:**
- Disables unnecessary Windows services
- Configures Windows Update behavior
- Reduces telemetry services
- Optimizes background processes

**Services affected:**
- Windows Search (if not needed)
- Superfetch/SysMain
- Windows Update Medic Service
- Diagnostic services
- Telemetry services

**Benefits:**
- Reduced memory usage
- Faster boot times
- Less background activity
- Improved system responsiveness

### Privacy Enhancements

**What it does:**
- Disables data collection features
- Reduces telemetry reporting
- Configures privacy settings
- Limits advertising ID usage

**Areas affected:**
- Windows telemetry
- Cortana data collection
- App usage tracking
- Location services
- Advertising preferences

**Benefits:**
- Better privacy protection
- Reduced data transmission
- Less targeted advertising
- More control over personal data

### Performance Tweaks

**What it does:**
- Optimizes power management
- Adjusts visual effects
- Configures system responsiveness
- Improves resource allocation

**Settings modified:**
- Power plan settings
- Visual effects preferences
- System responsiveness priorities
- Memory management
- CPU scheduling

**Benefits:**
- Better system performance
- Improved responsiveness
- Optimized resource usage
- Enhanced gaming performance

### Network Optimizations

**What it does:**
- Configures TCP/IP settings
- Optimizes DNS resolution
- Improves network stack performance
- Reduces network latency

**Network settings:**
- TCP window scaling
- DNS cache settings
- Network adapter properties
- Quality of Service (QoS)
- Network throttling

**Benefits:**
- Faster internet browsing
- Reduced network latency
- Better streaming performance
- Improved download speeds

### File System Improvements

**What it does:**
- Optimizes NTFS settings
- Configures disk access patterns
- Improves file system performance
- Optimizes storage settings

**File system tweaks:**
- NTFS performance settings
- Disk defragmentation schedule
- File system caching
- Storage optimization
- Temporary file management

**Benefits:**
- Faster file operations
- Improved disk performance
- Better storage efficiency
- Reduced disk fragmentation

## ⚙️ Advanced Usage

### Customizing Tweaks

To customize which tweaks are applied:

1. **Open** `Nexus_Tweaks.bat` in a text editor
2. **Find** the section you want to modify
3. **Comment out** unwanted tweaks by adding `REM` at the beginning of lines
4. **Save** the file
5. **Run** as normal

Example:
```batch
REM Disable this specific tweak
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
```

### Running Specific Sections

Currently, the script runs all optimizations together. Future versions will include:
- Command-line parameters for specific categories
- Interactive menu for selecting tweaks
- Configuration file support

### Batch Mode (Advanced Users)

For automated deployments, you can modify the script to skip user prompts:

1. **Comment out** the confirmation prompt
2. **Set** variables to default values
3. **Remove** pause commands
4. **Test thoroughly** before deployment

## 🔄 Reverting Changes

### Using System Restore

The easiest way to revert changes:

1. **Open** System Restore
   - Type "Create a restore point" in Start menu
   - Click "System Restore"

2. **Select** the restore point created before running Nexus Tweaks
   - Look for "Before Nexus Tweaks" in the description

3. **Follow** the wizard to complete restoration

### Manual Reversal

To manually revert specific changes:

1. **Identify** the specific tweak to reverse
2. **Find** the corresponding registry key or setting
3. **Apply** the opposite change
4. **Restart** if required

### Registry Backup Method

If you created registry backups:

```cmd
# Restore registry backups (if created)
reg import backup_hklm.reg
reg import backup_hkcu.reg
```

## 📊 Monitoring Results

### Performance Monitoring

After applying tweaks, monitor:

- **Boot time** (should be faster)
- **Memory usage** (should be lower)
- **CPU usage** (should be more stable)
- **Disk activity** (should be reduced)
- **Network performance** (should be improved)

### Tools for Monitoring

Recommended monitoring tools:
- **Task Manager** (built-in)
- **Resource Monitor** (built-in)
- **Performance Monitor** (built-in)
- **Windows Performance Toolkit** (advanced)

### Benchmarking

Consider running benchmarks before and after:
- **Windows Experience Index** (basic)
- **CrystalDiskMark** (storage performance)
- **UserBenchmark** (overall system)
- **3DMark** (graphics performance)

## ⚠️ Safety Guidelines

### Before Running

- ✅ Create system restore point
- ✅ Backup important data
- ✅ Close all applications
- ✅ Ensure stable power supply
- ✅ Read through the script

### During Execution

- ✅ Don't interrupt the process
- ✅ Don't use the computer for other tasks
- ✅ Monitor for any error messages
- ✅ Take note of any warnings

### After Completion

- ✅ Restart the computer
- ✅ Test all critical applications
- ✅ Monitor system stability
- ✅ Check for any issues
- ✅ Document any problems

## 🐛 Troubleshooting

### Common Issues

#### Script Stops or Hangs
- **Cause**: Antivirus interference or system conflict
- **Solution**: Disable antivirus temporarily, restart, and try again

#### Some Tweaks Don't Apply
- **Cause**: Insufficient permissions or system restrictions
- **Solution**: Ensure running as Administrator, check Windows edition

#### System Becomes Unstable
- **Cause**: Incompatible tweak or system conflict
- **Solution**: Use System Restore to revert changes

#### Performance Gets Worse
- **Cause**: Tweak not suitable for your hardware/usage
- **Solution**: Revert changes and customize script for your needs

### Getting Support

If you experience issues:

1. **Check** the troubleshooting section in README.md
2. **Search** existing GitHub issues
3. **Create** a detailed bug report
4. **Include** system information and error messages

## 📈 Optimization Tips

### For Best Results

1. **Start fresh** - Run on a clean Windows installation when possible
2. **Update first** - Ensure Windows is fully updated
3. **Clean system** - Remove unnecessary programs before running
4. **Regular maintenance** - Re-run periodically for best results

### System-Specific Considerations

#### Gaming Systems
- Keep Game Mode enabled
- Maintain GPU driver updates
- Consider keeping Windows Defender

#### Work Systems
- Test all business applications
- Keep necessary services enabled
- Maintain security features

#### Older Hardware
- Be conservative with performance tweaks
- Monitor temperatures after optimization
- Consider hardware limitations

---

## 📞 Need Help?

- 📖 Check the [Installation Guide](INSTALLATION.md)
- 🐛 Report bugs on [GitHub Issues](https://github.com/yourusername/nexus-tweaks/issues)
- 💬 Ask questions in [GitHub Discussions](https://github.com/yourusername/nexus-tweaks/discussions)
- 📧 Contact maintainers for security issues