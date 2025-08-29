# Nexus Tweaks

Nexus Tweaks is a curated set of safe, reversible optimizations for Windows 10/11 designed to improve performance, responsiveness, privacy, and clarity.

- **Performance**: Trims nonessential services and scheduled tasks, optimizes power and storage settings.
- **Privacy**: Reduces telemetry where possible and disables unnecessary data collection features.
- **Clarity**: Streamlines context menus, Explorer options, and visual noise for a cleaner experience.
- **Reversible**: Every change is intended to be documented and undoable.

> Status: Early project setup. The launcher script exists, but the tweak sets are being assembled. Contributions welcome.

## Requirements
- Windows 10 or Windows 11
- Administrator privileges to apply system-level changes
- A recent backup or restore point is recommended before making system changes

## Quick start
1. Download or clone this repository.
2. Right-click `Nexus_Tweaks.bat` and choose "Run as administrator".
3. Follow on-screen instructions (in early versions, functionality may be limited while tweaks are being added).

## Safety and reversibility
- The project aims to provide clear, documented changes with corresponding rollback steps.
- When possible, changes will be applied using idempotent scripts and logged.
- You should still make a backup or restore point before applying system tweaks.

## How it works (planned)
- Modular tweak sets (performance, privacy, UI) you can opt into.
- Each module will document exactly which registry keys, services, and policies are modified.
- A revert routine to undo changes made by the modules you selected.

## Roadmap
- Define initial tweak modules with documentation and rollbacks
- Add logging and dry-run capability
- Provide PowerShell equivalents and per-tweak granularity

## Contributing
See `CONTRIBUTING.md` for ways to propose tweaks, report issues, and open pull requests.

## License
See `LICENSE` for license details.