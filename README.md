Red Theme — Build and Install Guide

Overview
- This repository contains a minimal IntelliJ Platform theme plugin called "Red Theme".
- The plugin is already ready for packaging. No Gradle build is required; a simple script creates the production JAR.
- Target IDEs: IntelliJ Platform IDEs that correspond to since-build 251 (2025.1+) or newer.

Prerequisites
- Bash shell (macOS/Linux; on Windows use Git Bash or WSL)
- zip utility available in PATH
- A JetBrains IDE (IntelliJ IDEA, WebStorm, etc.) to install the resulting plugin JAR

Project layout
- src/main/resources/
  - META-INF/plugin.xml, pluginIcon.svg
  - theme/red.theme.json, theme/red.xml
- scripts/build_plugin.sh — packaging script
- dist/ — output directory for the built JAR

Build steps
1) Clone or open the project directory.

2) Build the plugin JAR:
   macOS/Linux:
     chmod +x scripts/build_plugin.sh
     scripts/build_plugin.sh

   Windows (Git Bash):
     bash scripts/build_plugin.sh

3) Result:
   - The plugin JAR will be created at dist/red-<version>.jar
   - The <version> is read from src/main/resources/META-INF/plugin.xml

Install in your IDE from disk
- Open your JetBrains IDE
- Settings/Preferences -> Plugins -> gear icon -> Install Plugin from Disk...
- Select dist/red-<version>.jar
- Restart the IDE when prompted
- Enable the theme: Settings/Preferences -> Appearance & Behavior -> Appearance -> Theme -> choose "Red"

Troubleshooting
- Error: required path is missing
  - The script requires both src/main/resources/META-INF and src/main/resources/theme to exist.
  - Ensure these directories and the files inside them are present.

- I edited files under resources but my changes are not in the JAR
  - The packaging script intentionally uses src/main/resources/ as the source of truth.
  - Edit files under src/main/resources/ before packaging, or copy your changes there.

What’s inside the plugin
- META-INF/plugin.xml: plugin metadata (id, version, since-build)
- theme/red.theme.json: UI theme colors
- theme/red.xml: bundled editor color scheme

Support
- Vendor: LyneQ — https://www.lyneq.be — support@lyneq.be
