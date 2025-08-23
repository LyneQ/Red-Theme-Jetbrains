Red Theme — Build and Install Guide

Overview
- This repository contains a minimal IntelliJ Platform theme plugin called "Red Theme".
- The plugin is already ready for packaging. No Gradle build is required; a simple script creates the production ZIP.
- Target IDEs: IntelliJ Platform IDEs that correspond to since-build 251 (2025.1+) or newer.

Prerequisites
- Bash shell (macOS/Linux; on Windows use Git Bash or WSL)
- zip utility available in PATH
- A JetBrains IDE (IntelliJ IDEA, WebStorm, etc.) to install the resulting plugin ZIP

Project layout
- resources/
  - META-INF/plugin.xml, pluginIcon.svg
  - theme/red.theme.json, theme/red.xml
- scripts/build_plugin.sh — packaging script
- dist/ — output directory for the built ZIP

Build steps
1) Clone or open the project directory.

2) Build the plugin ZIP:
   macOS/Linux:
     chmod +x scripts/build_plugin.sh
     scripts/build_plugin.sh

   Windows (Git Bash):
     bash scripts/build_plugin.sh

3) Result:
   - The plugin ZIP will be created at dist/red-<version>.zip
   - The <version> is read from resources/META-INF/plugin.xml

Install in your IDE
Option A: Install from disk (recommended)
- Open your JetBrains IDE
- Settings/Preferences -> Plugins -> gear icon -> Install Plugin from Disk...
- Select dist/red-<version>.zip
- Restart the IDE when prompted
- Enable the theme: Settings/Preferences -> Appearance & Behavior -> Appearance -> Theme -> choose "Red"

Option B: Manual copy (advanced)
- Copy the built ZIP into your IDE’s plugins directory. The location varies by OS/IDE/version; using "Install from Disk" is simpler and less error-prone.

Troubleshooting
- Error: required path is missing
  - The script requires both resources/META-INF and resources/theme to exist.
  - Ensure these directories and the files inside them are present.

- zip: command not found
  - Install the zip tool.
    - Ubuntu/Debian: sudo apt-get install zip
    - macOS (Homebrew): brew install zip (or use the built-in /usr/bin/zip)
    - Windows: use Git Bash with zip available or run under WSL

- Wrong or unexpected version in output filename
  - The script parses <version> from resources/META-INF/plugin.xml. Update that file if you want a different version.

- I edited files under src/main/resources but my changes are not in the ZIP
  - The packaging script intentionally uses resources/ as the source of truth.
  - Edit files under resources/ (not src/main/resources) before packaging, or copy your changes there.

Manual packaging (alternative)
If you prefer to package without the script:
  mkdir -p dist
  (cd resources && zip -r ../dist/red-$(sed -n 's:.*<version>\(.*\)</version>.*:\1:p' META-INF/plugin.xml | head -n1).zip META-INF theme)

What’s inside the plugin
- META-INF/plugin.xml: plugin metadata (id, version, since-build)
- theme/red.theme.json: UI theme colors
- theme/red.xml: bundled editor color scheme

Support
- Vendor: LyneQ — https://www.lyneq.tech — support@lyneq.tech
