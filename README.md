# DummyTodoApp

A simple iOS todo app built with SwiftUI and SwiftData for learning iOS development.

![App running on iPhone](screenshots/06-app-running.png)

## Features

- Add todos (text field + button)
- Mark complete/incomplete (tap the circle)
- Delete todos (swipe left)
- Data persists across app launches (SwiftData)

---

## Quick Start

(Assuming you have git + xcode)

```bash
# get source code
git clone https://github.com/justinpearson/dummy-iphone-app.git

cd dummy-iphone-app

# test: build app from cmd line
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 17' build

# open proj in xcode to run in simulator + iphone
open DummyTodoApp/DummyTodoApp.xcodeproj
```

Run on iOS simulator in xcode:

1. In Xcode's top toolbar, click the device dropdown (may say "Any iOS Device")
2. Select a simulator, e.g., **iPhone 17**
3. Press the **Play button (▶)** in the upper-left corner, or press **Cmd+R**

TODO: screenshot w/ arrows

Run on iPhone:

1. Plug in iphone
1. In Xcode, ensure your iPhone is selected in the device dropdown
2. Press the **Play button (▶)** in the upper-left, or **Cmd+R**


Useful commands:

```bash
# List connected devices (simulators + physical)
xcrun xctrace list devices

# Build for simulator (reliable)
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj \
  -scheme DummyTodoApp \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  build
```

Note: Building for physical iPhone via command line is possible but finicky (device connection issues, Developer Mode authorization). Use Xcode's Run button for physical devices.


---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Run in iOS Simulator](#run-in-ios-simulator)
3. [Run on iPhone](#run-on-iphone)
4. [Limitations](#limitations)
5. [Uninstall & Cleanup](#uninstall--cleanup)
6. [Development](#development)

---

## Prerequisites

| Requirement | Needed for | How to check |
|-------------|-----------|--------------|
| **Xcode** | Simulator + iPhone | Run `xcode-select -p` in Terminal. If it prints a path, Xcode is installed. |
| **git** | Cloning the repo | Run `git --version` in Terminal. |
| **Apple Account** | iPhone only | Go to [appleid.apple.com](https://appleid.apple.com). If you can sign in, you have an account. Free account works. |
| **iPhone** | iPhone only | iPhone 12 or newer running iOS 26+, with USB cable. |

### Installing Xcode

**Do I need to do this?** Run `xcode-select -p` in Terminal. If you get an error or no output, you need Xcode.

**How to do it:** Download [Xcode from the Mac App Store](macappstore://itunes.apple.com/app/id497799835) (~12GB download). After installing, open Xcode once to complete setup — it will prompt you to install additional components including the iOS Simulator.

**Success check:** Run `xcrun simctl list devices` — you should see a list of simulators (e.g., "iPhone 17").

---

## Run in iOS Simulator

Complete these steps first before attempting to run on a physical iPhone.

### Step 1: Clone the Repository

**Do I need to do this?** Check if you already have the folder: `ls dummy-iphone-app`. If it exists, skip to Step 2.

**How to do it (Terminal):**
```bash
git clone https://github.com/justinpearson/dummy-iphone-app.git
cd dummy-iphone-app
```

> **Error: `git: command not found`** — Install Xcode Command Line Tools: `xcode-select --install`

**Success check:** The folder `dummy-iphone-app` exists and contains `DummyTodoApp/`.

---

### Step 2: Build from Command Line (Optional)

**Do I need to do this?** Optional sanity check. Verifies the project builds before opening Xcode.

**How to do it (Terminal):**
```bash
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj \
  -scheme DummyTodoApp \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  build
```

**Expected:** Output ends with `** BUILD SUCCEEDED **`

> **Error: `xcodebuild: command not found`** — Xcode isn't installed. See [Prerequisites](#prerequisites).

> **Error: `Unable to find a destination matching the provided destination specifier`** — The iOS Simulator isn't installed. Open Xcode, go to **Settings → Components** (or **Platforms**), and download an iOS Simulator. Then run `xcrun simctl list devices` to find the simulator name and update the command above.



---

### Step 3: Open Project in Xcode

**Do I need to do this?** If Xcode is already open with DummyTodoApp, skip to Step 4.

**How to do it:** Double-click `DummyTodoApp/DummyTodoApp.xcodeproj` in Finder, or run:
```bash
open DummyTodoApp/DummyTodoApp.xcodeproj
```

> **Error: "The file couldn't be opened"** — You need Xcode. See [Prerequisites](#prerequisites).

**Success check:** Xcode opens and shows the project in the left sidebar.

---

### Step 4: Run in Simulator

**Do I need to do this?** If the app is already running in a simulator, you're done with this section.

**How to do it:**
1. In Xcode's top toolbar, click the device dropdown (may say "Any iOS Device")
2. Select a simulator, e.g., **iPhone 17**
3. Press the **Play button (▶)** in the upper-left corner, or press **Cmd+R**

> **Error: "No such module 'SwiftData'"** — Your Xcode may be too old. Update Xcode from the App Store.

**Success check:** A simulator window opens and displays the "Todos" app.

---

## Run on iPhone

**Prerequisite:** Complete [Run in iOS Simulator](#run-in-ios-simulator) first. This confirms Xcode and the project are set up correctly.

### Step 1: Configure Code Signing

**Do I need to do this?** In Xcode, go to the Signing & Capabilities tab (see below). If **Team** shows your name and there are no red errors, skip to Step 2.

**How to do it:**
1. In Xcode's left sidebar, click **DummyTodoApp** (blue project icon at the top)
2. In the middle panel under **TARGETS**, click **DummyTodoApp**
3. Click the **Signing & Capabilities** tab
4. Click the **Team** dropdown:
   - If your account appears, select it (shows as "Your Name (Personal Team)")
   - If not, click **Add Account...** → **Add Apple Account...** → sign in with your Apple ID

![Add Apple Account](screenshots/01-signing-add-account.png)
![Team Selected](screenshots/02-signing-team-selected.png)

**Success check:** The Team dropdown shows your name, and no red error banners appear.

---

### Step 2: Connect iPhone and Select It

**Do I need to do this?** Look at Xcode's device dropdown in the top toolbar. If your iPhone's name appears and is selected, skip to Step 3.

**How to do it:**
1. Connect your iPhone to your Mac via USB cable
2. If prompted on your iPhone, tap **Trust** and enter your passcode
3. In Xcode's top toolbar, click the device dropdown and select your iPhone

> **First-time connection:** Xcode may show "Copying shared cache symbols from [iPhone]" for 5-15 minutes. Wait for it to complete.

![Copying Symbols](screenshots/04-copying-symbols.png)

**Success check:** Your iPhone appears in the device dropdown and is selected.

---

### Step 3: Enable Developer Mode on iPhone

**Do I need to do this?** On your **iPhone**, go to **Settings → Privacy & Security → Developer Mode**. If the toggle is ON, skip to Step 4.

**How to do it (iPhone):**
1. Open **Settings**
2. Go to **Privacy & Security**
3. Scroll down and tap **Developer Mode**
4. Toggle it **ON**
5. Tap **Restart** when prompted
6. After restart, confirm enabling Developer Mode

> **Can't find Developer Mode?** It only appears after connecting your iPhone to Xcode at least once. Connect your phone, wait a moment, then check again.

![Developer Mode Disabled Error](screenshots/03-developer-mode-disabled.png)

**Success check:** Settings → Privacy & Security → Developer Mode shows the toggle ON.

---

### Step 4: Trust Developer Certificate on iPhone

**Do I need to do this?** On your **iPhone**, go to **Settings → General → VPN & Device Management**. If you see your Apple ID email under "Developer App" and it says "trusted", skip to Step 5.

**How to do it:**

First, attempt to run the app from Xcode (press **Play ▶** or **Cmd+R**). If you see this error:

![Certificate Not Trusted](screenshots/05-certificate-not-trusted.png)

Then on your **iPhone**:
1. Open **Settings**
2. Go to **General → VPN & Device Management**
3. Under "Developer App", tap your Apple ID email
4. Tap **Trust "[your email]"**
5. Tap **Trust** to confirm

**Success check:** Settings → General → VPN & Device Management shows your developer certificate as trusted.

---

### Step 5: Run on iPhone

**Do I need to do this?** If the app is already running on your iPhone, you're done!

**How to do it:**
1. In Xcode, ensure your iPhone is selected in the device dropdown
2. Press the **Play button (▶)** in the upper-left, or **Cmd+R**

> **Error: "OS version lower than deployment target"** — Your iPhone's iOS version is older than the app requires. In Xcode: select the project → DummyTodoApp target → General tab → under "Minimum Deployments", lower the iOS version.

**Success check:** The app launches on your iPhone showing the "Todos" screen.

---

## Limitations

### 7-Day Certificate Expiration (Free Accounts)

Apps installed with a free Apple developer account expire after **7 days**.

- The app icon stays but won't launch
- Your data (todos) is preserved
- To fix: reconnect iPhone to Xcode and press Play to reinstall

A paid Apple Developer account ($99/year) removes this limitation.

### iOS Version Compatibility

The app targets iOS 26.0. If your iPhone runs an older version, lower the deployment target in Xcode (see error handling in Step 5 above).

---

## Uninstall & Cleanup

### Remove the App

**Do I need to do this?** Check if DummyTodoApp is on your iPhone's Home Screen. If not, skip this.

**How to do it (iPhone):**
1. Find the **DummyTodoApp** icon on your Home Screen
2. Long-press the icon until the menu appears
3. Tap **Remove App** → **Delete App** → **Delete**

**Success check:** The app no longer appears on your Home Screen. (Note: this also deletes your todos.)

---

### Disable Developer Mode

**Do I need to do this?** On your **iPhone**, check Settings → Privacy & Security → Developer Mode. If it's already OFF (or not visible), skip this.

**How to do it (iPhone):**
1. Open **Settings**
2. Go to **Privacy & Security**
3. Tap **Developer Mode**
4. Toggle it **OFF**
5. Your iPhone will restart

> **Warning:** Disabling Developer Mode removes ALL apps installed via Xcode.

**Success check:** Settings → Privacy & Security no longer shows Developer Mode, or the toggle is OFF.

---

### Remove Developer Certificate Trust

**Do I need to do this?** On your **iPhone**, check Settings → General → VPN & Device Management. If there's no "Developer App" section, skip this.

**How to do it (iPhone):**
1. Open **Settings**
2. Go to **General → VPN & Device Management**
3. Under "Developer App", tap your Apple ID email
4. Tap **Delete App**

**Success check:** Settings → General → VPN & Device Management no longer shows a Developer App section.

---

## Development

### Build from Command Line

```bash
# Build
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj \
  -scheme DummyTodoApp -configuration Debug build

# Run tests
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj \
  -scheme DummyTodoApp \
  -destination 'platform=iOS Simulator,name=iPhone 17' test
```

### Debug Logging

The app includes `print()` statements visible in Xcode's debug console (bottom panel) when you add, toggle, or delete todos.

### Project Structure

```
DummyTodoApp/
├── DummyTodoApp/           # App source
│   ├── TodoItem.swift      # Data model (SwiftData)
│   ├── ContentView.swift   # Main UI
│   └── DummyTodoAppApp.swift
├── DummyTodoAppTests/      # Unit tests
└── DummyTodoAppUITests/    # UI tests
```
