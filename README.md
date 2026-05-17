# ESP32 Journey

This repository serves as a playground for small ESP32 projects that I will be working on.

## Setup

Before running any project, you need to set up the ESP-IDF development environment:

1. Clone ESP-IDF to `~/.esp`:
   ```bash
   git clone --recursive https://github.com/espressif/esp-idf.git ~/.esp
   ```

2. Install the ESP32 SDK by sourcing the install script:
   ```bash
   . ~/.esp/install.sh
   ```

3. Activate the environment:
   ```bash
   . ~/.esp/export.sh
   ```

Once the environment is set up, you can use the scripts in the `scripts` directory to build, flash, and monitor your ESP32 projects.

## Scripts

The `scripts` directory contains helper scripts for working with ESP32 projects:

| Script | Description |
|--------|-------------|
| `esp.sh` | Main entry point - run ESP-IDF commands on a project |
| `export.sh` | Sources the ESP-IDF environment |
| `build.sh` | Builds the project |
| `clean.sh` | Cleans the build |
| `flash.sh` | Flashes the project to the ESP32 |
| `monitor.sh` | Monitors serial output |

### Usage

Run `esp.sh` from the `scripts` directory:

```bash
cd scripts
./esp.sh <project_dir> [options]
```

**Options:**
- `build` - Build the project
- `clean` - Clean the build
- `flash` - Flash the project
- `monitor` - Monitor serial output

**Examples:**

```bash
# Build a project
./esp.sh ../00-blinking-leds build

# Build and flash
./esp.sh ../00-blinking-leds build flash

# Build, flash and monitor
./esp.sh ../00-blinking-leds build flash monitor

# Clean and rebuild
./esp.sh ../00-blinking-leds clean build
```

## Projects

Each subdirectory contains a separate ESP32 project with its own source code and configuration.