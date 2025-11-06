#!/bin/bash

# --- Configuration ---
# VITAL: Change this if your compiled app is NOT named wallpaper_studio.app
APP_NAME="Wallpaper Studio"
DMG_NAME="WallpaperStudio_Installer" # Renamed slightly for clarity
APP_PATH="build/macos/Build/Products/Release/${APP_NAME}.app"
VOLUME_NAME="${APP_NAME} Installer"
# Path to the Applications folder shortcut
APP_DIR="/Applications"

# --- 2. Clean Up Old/Stuck Files ---
echo "Cleaning up any stuck processes and temporary files..."
# Force detach any lingering mount
hdiutil detach "/Volumes/${APP_NAME} Installer" 2>/dev/null
rm -f "${DMG_NAME}.temp.dmg" "${DMG_NAME}.final.dmg"

# --- 1. Create a temporary read/write disk image (.dmg) ---
echo "Creating temporary disk image..."
hdiutil create -ov -volname "${VOLUME_NAME}" -fs HFS+ -size 250m "${DMG_NAME}.temp.dmg"

# --- 2. Mount the temporary disk image ---
echo "Mounting temporary disk image..."
MOUNT_DIR="/Volumes/${VOLUME_NAME}"
hdiutil attach "${DMG_NAME}.temp.dmg" -mountpoint "${MOUNT_DIR}"

# --- 3. Copy the application and create the link ---
echo "Copying application and creating Applications link..."
# Copy the .app bundle into the mounted DMG
cp -r "${APP_PATH}" "${MOUNT_DIR}/"

# Create a symbolic link to the /Applications folder
ln -s "${APP_DIR}" "${MOUNT_DIR}/Applications"

# --- 4. Unmount the temporary disk image ---
echo "Unmounting temporary disk image..."
# Use disk name in case volume name isn't recognized
hdiutil detach "${MOUNT_DIR}"

# --- 5. Convert to compressed, read-only final image (UDZO is highly recommended) ---
echo "Converting to final compressed .dmg..."
# 🚀 Using UDZO format for reliable distribution and compression
hdiutil convert "${DMG_NAME}.temp.dmg" -format ULMO -o "${DMG_NAME}.dmg"

# --- 6. Clean up temporary files ---
echo "Cleaning up..."
rm "${DMG_NAME}.temp.dmg"

echo "✅ Success! Final DMG created: ${DMG_NAME}.dmg"