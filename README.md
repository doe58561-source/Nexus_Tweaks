Nexus Tweaks

Nexus Tweaks is a curated set of safe, reversible optimizations for Windows 10/11 designed to improve performance, responsiveness, privacy, and clarity. It trims nonessential services, removes bloat, applies sensible power/network/file‑system settings, and documents every change so you can customize or revert at any time—aiming for a fast, stable, and controllable Windows experience.

Features
- Performance-first defaults with minimal risk
- Reversible: every change is documented and can be undone
- Modular profiles for different use cases (gaming, creator, minimal)
- Battery and desktop friendly power/network/file-system settings
- Clear change logs and rationale

Quick start
1) Download or clone this repository
2) On Windows, right-click `Nexus_Tweaks.bat` and run as Administrator
3) Follow on-screen prompts (coming soon). Manual advanced usage will be documented under `docs/`

What this does (high level)
- Disables or trims nonessential scheduled tasks and background services
- Cleans preinstalled bloat and opt-in telemetry
- Applies sensible power plan, storage, and networking defaults
- Leaves the system fully functional for Windows Update and Store

Safety and rollback
- Each tweak is applied via explicit commands that are mirrored by a revert path
- Changes are grouped into modules you can enable/disable selectively
- You can restore defaults for any module at any time

Repository layout
- `Nexus_Tweaks.bat`: entry point (launcher)
- `scripts/`: tweak modules (PowerShell/Batch/Registry) [planned]
- `docs/`: rationale, module docs, and rollback instructions [planned]

Contributing
- Issues and PRs are welcome. Please read `CONTRIBUTING.md` before submitting changes.
- Follow the coding and documentation style in `.editorconfig` and keep line-endings normalized (see `.gitattributes`).

License
Apache License 2.0. See `LICENSE` for details.
