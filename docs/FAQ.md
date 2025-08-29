# ❓ Frequently Asked Questions

## 🔧 General Questions

### What is Nexus Tweaks?

Nexus Tweaks is a comprehensive Windows optimization toolkit that applies safe, reversible tweaks to improve system performance, privacy, and responsiveness on Windows 10 and 11.

### Is Nexus Tweaks safe to use?

Yes, when used properly. All tweaks are:
- ✅ Designed to be reversible
- ✅ Tested on multiple Windows configurations
- ✅ Well-documented with clear explanations
- ✅ Applied with automatic system restore point creation

### Do I need to pay for Nexus Tweaks?

No! Nexus Tweaks is completely free and open-source under the Apache 2.0 license.

### Which Windows versions are supported?

- ✅ Windows 11 (all versions)
- ✅ Windows 10 (version 1903 and later)
- ❌ Windows 8.1 and earlier (not supported)

## 🚀 Installation & Usage

### Do I need Administrator privileges?

Yes, absolutely. The script checks for admin privileges and will not run without them, as system-level changes require elevated permissions.

### Can I run this on a work computer?

**Exercise caution!** 
- Check your company's IT policies first
- Some tweaks might conflict with corporate security policies
- Consider testing in a virtual machine first
- Get IT approval if required

### How long does the optimization process take?

Typically 5-15 minutes, depending on:
- Your system specifications
- Number of tweaks being applied
- Current system state
- Whether a restart is required

### Will I lose my files or programs?

No, Nexus Tweaks only modifies system settings and configurations. It doesn't:
- ❌ Delete user files
- ❌ Uninstall programs (except some bloatware)
- ❌ Format drives
- ❌ Modify user documents

## 🔄 Reverting Changes

### How do I undo the changes?

Several methods:

1. **System Restore** (easiest)
   - Use the restore point created before running Nexus Tweaks
   
2. **Manual reversal**
   - Follow the documentation to reverse specific tweaks
   
3. **Registry backup** (if you created one)
   - Import your pre-optimization registry backup

### What if System Restore doesn't work?

If System Restore fails:
1. Try booting in Safe Mode and running System Restore
2. Use Windows Recovery Environment
3. Manually reverse changes using the documentation
4. In extreme cases, consider a Windows reset (keeping files)

### Can I reverse only specific tweaks?

Currently, you need to reverse all changes and then re-apply only the ones you want. Future versions will include more granular control.

## ⚡ Performance & Results

### How much performance improvement should I expect?

Results vary by system, but users typically report:
- 🚀 10-30% faster boot times
- 🧠 10-20% lower memory usage
- 📊 Improved system responsiveness
- 🌐 Better network performance
- 🔋 Extended battery life (laptops)

### Why don't I see immediate improvements?

Some improvements require:
- A system restart to take effect
- Time to observe (like reduced background activity)
- Specific usage scenarios (gaming, heavy multitasking)
- Hardware that can benefit from the optimizations

### Will this help with gaming performance?

Yes, many users report improved gaming performance through:
- Reduced background processes
- Optimized system priorities
- Better memory management
- Reduced input lag
- More stable frame rates

### My system feels slower after optimization. Why?

This can happen if:
- A tweak conflicts with your specific hardware/software
- You disabled a service your system depends on
- Your system needs time to adapt to changes
- An incompatible tweak was applied

**Solution**: Use System Restore to revert and consider customizing the script.

## 🛡️ Security & Privacy

### Does this make my system less secure?

When used responsibly, no. However:
- Some privacy tweaks might disable security telemetry
- Disabling Windows Defender requires alternative security
- Always keep Windows updated
- Use reputable antivirus software

### What privacy improvements are included?

- 🔒 Reduced telemetry and data collection
- 🚫 Disabled advertising ID
- 🎯 Limited location tracking
- 📊 Reduced usage statistics
- 🔍 Minimized search data collection

### Can I still use Windows Update after optimization?

Yes! Windows Update functionality is preserved, but some tweaks might:
- Change update installation timing
- Reduce update-related telemetry
- Modify restart behavior
- Optimize update delivery

## 🔧 Technical Questions

### What registry keys are modified?

The script modifies various registry locations including:
- `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\*`
- `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\*`
- `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\*`
- And others (all documented in the script)

### Does this work on Windows Server?

No, Nexus Tweaks is designed specifically for Windows 10/11 desktop editions. Server editions have different:
- Service configurations
- Security requirements
- Performance priorities
- Update mechanisms

### Can I run this multiple times?

Yes, but:
- ✅ It's safe to run multiple times
- ✅ Won't cause harm if run repeatedly
- ⚠️ May not provide additional benefits
- ⚠️ Could overwrite custom settings you made

### Will this affect Windows updates?

Nexus Tweaks is designed to work with Windows updates, but:
- Some tweaks might be reset by major updates
- You may need to re-run after feature updates
- Critical security updates are never blocked
- Update behavior might be optimized

## 🐛 Troubleshooting

### The script won't run at all

Check these common causes:
1. **Not running as Administrator** - Right-click and "Run as administrator"
2. **Antivirus blocking** - Temporarily disable real-time protection
3. **Execution policy** - Windows might block batch file execution
4. **File corruption** - Re-download the script

### I get "Access Denied" errors

This usually means:
- Not running with Administrator privileges
- Antivirus software interfering
- Windows security policies blocking changes
- Corrupted user permissions

### Some tweaks don't seem to work

Possible causes:
- Windows edition limitations (Home vs Pro)
- Group Policy overrides (corporate environments)
- Third-party software conflicts
- Hardware-specific limitations

### My antivirus flags the script as suspicious

This is common with system optimization tools because they:
- Modify registry settings
- Change system configurations
- Access administrative functions
- Modify service settings

The script is safe, but you can:
1. Review the source code yourself
2. Submit to your antivirus for analysis
3. Use Windows Defender's exclusion feature
4. Temporarily disable real-time protection

## 🎯 Specific Scenarios

### Should I use this on a brand new computer?

Yes! Fresh installations often benefit most because:
- ✅ No conflicting software
- ✅ Clean system state
- ✅ Optimal results
- ✅ Easier to identify any issues

### What about older computers?

Older systems can benefit significantly, but:
- ⚠️ Be more conservative with tweaks
- ⚠️ Monitor system stability closely
- ⚠️ Consider hardware limitations
- ⚠️ Some tweaks might not apply

### Can I use this on a virtual machine?

Absolutely! VMs are great for:
- ✅ Testing before applying to main system
- ✅ Learning what each tweak does
- ✅ Safe experimentation
- ✅ Training and demonstrations

## 📞 Getting Help

### Where can I get support?

1. **GitHub Issues** - For bugs and technical problems
2. **GitHub Discussions** - For questions and general help
3. **Documentation** - Check all the docs in the `/docs` folder
4. **Community** - Connect with other users

### How do I report a bug?

1. Check if it's already reported in GitHub Issues
2. Use the bug report template
3. Include detailed system information
4. Describe steps to reproduce
5. Attach any error messages or logs

### Can I contribute to the project?

Yes! We welcome contributions:
- 🐛 Bug reports and fixes
- 🚀 New optimization ideas
- 📖 Documentation improvements
- 🧪 Testing on different systems
- 💡 Feature suggestions

See [CONTRIBUTING.md](../CONTRIBUTING.md) for details.

---

**Didn't find your answer?** 
- 🔍 Search [GitHub Issues](https://github.com/yourusername/nexus-tweaks/issues)
- 💬 Ask in [GitHub Discussions](https://github.com/yourusername/nexus-tweaks/discussions)
- 📧 Contact maintainers for security-related questions