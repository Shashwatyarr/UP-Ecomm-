# Fix False Positive Connectivity and Debug Emulator Networking

The app's `NetworkManager` currently only checks if the device is connected to a network (WiFi/Mobile), but it doesn't verify if that network actually provides internet access. This leads to crashes when the emulator is "connected" to the virtual router but has no external DNS resolution (as seen with `Failed host lookup`).

## Proposed Changes

### Helper Functions

#### [MODIFY] [network_manager.dart](file:///D:/ecomm/lib/utils/helpers/network_manager.dart)
- Update `isConnected()` to perform a real internet check by attempting to lookup a common host (like `google.com`) or pinging a reliable IP.
- This will prevent the app from attempting network calls when the emulator's internet is broken.

## Verification Plan

### Manual Verification
- Restart the app.
- If the emulator's internet is still broken, `NetworkManager` should now correctly return `false`, and you should see the "No Internet Connection" snackbar instead of a crash.

## Critical Emulator Fix (Action Required)
> [!CAUTION]
> If your emulator continues to show "Failed host lookup", it is a configuration issue on your computer. Please try these steps in order:
> 1. **Cold Boot Emulator**: In Android Studio Device Manager, click the down arrow next to your emulator and select **"Cold Boot Now"**.
> 2. **Check DNS**: Ensure your host PC is not using a VPN or proxy that might interfere with the emulator.
> 3. **Sync Time**: Ensure the emulator's date and time match your computer.
