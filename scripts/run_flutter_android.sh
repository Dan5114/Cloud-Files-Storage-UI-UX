#!/bin/bash

# Script to launch emulator and run Flutter app on Android
# Usage: ./scripts/run_flutter_android.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Android emulator..."
bash "$SCRIPT_DIR/launch_emulator.sh"

echo ""
echo "Waiting for emulator to be ready..."
sleep 5

# Wait for emulator to be ready (check up to 10 times)
for i in {1..10}; do
    if flutter devices | grep -q "emulator"; then
        echo "Emulator is ready!"
        break
    fi
    echo "Waiting for emulator... ($i/10)"
    sleep 3
done

echo ""
echo "Running Flutter app on Android..."
cd "$PROJECT_DIR"
flutter run -d android
