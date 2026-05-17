#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
    echo "Usage: $0 <project_dir> [options]"
    echo "Options:"
    echo "  build    Build the project"
    echo "  clean   Clean the build"
    echo "  flash   Flash the project"
    echo "  monitor Monitor the serial output"
    echo ""
    echo "Example: $0 ../00-blinking-leds build flash monitor"
    exit 1
}

if [ $# -lt 2 ]; then
    usage
fi

PROJECT_DIR="$1"
shift

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: Project directory '$PROJECT_DIR' does not exist"
    exit 1
fi

if [ -z "$IDF_PATH" ]; then
    echo "Sourcing ESP-IDF environment..."
    . "$SCRIPT_DIR/export.sh"
fi

cd "$PROJECT_DIR"

while [ $# -gt 0 ]; do
    case "$1" in
        build)
            . "$SCRIPT_DIR/build.sh"
            ;;
        clean)
            . "$SCRIPT_DIR/clean.sh"
            ;;
        flash)
            . "$SCRIPT_DIR/flash.sh"
            ;;
        monitor)
            . "$SCRIPT_DIR/monitor.sh"
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
    shift
done