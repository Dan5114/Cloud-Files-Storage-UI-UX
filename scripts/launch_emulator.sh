#!/bin/bash

# Script to launch Android emulator
# Usage: ./scripts/launch_emulator.sh [AVD_NAME]

EMULATOR_PATH="$HOME/Library/Android/sdk/emulator/emulator"
AVD_NAME="${1:-Medium_Phone_API_36.1}"

if [ ! -f "$EMULATOR_PATH" ]; then
    echo "Error: Android emulator not found at $EMULATOR_PATH"
    echo "Please ensure Android SDK is installed and emulator is available."
    exit 1
fi

echo "Launching Android emulator: $AVD_NAME"
echo "Emulator path: $EMULATOR_PATH"
echo ""

# Check if emulator is already running
if pgrep -f "emulator.*$AVD_NAME" > /dev/null; then
    echo "Emulator '$AVD_NAME' is already running!"
    exit 0
fi

# Launch the emulator in the background
"$EMULATOR_PATH" -avd "$AVD_NAME" &

echo "Emulator is starting in the background..."
echo "You can check if it's ready by running: flutter devices"
echo ""
echo "To stop the emulator, run: pkill -f emulator"
