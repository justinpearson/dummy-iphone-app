# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

DummyTodoApp is a learning project for iOS development. It's a SwiftUI-based iOS application created with Xcode.

## Build Commands

Build, run, and test via Xcode or command line:

```zsh
# Build the app
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -configuration Debug build

# Run unit tests
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 16' test

# Run only unit tests (not UI tests)
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:DummyTodoAppTests test

# Run only UI tests
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:DummyTodoAppUITests test
```

## Architecture

- **Framework**: SwiftUI with Swift 5
- **Target**: iOS 26.2+, iPhone and iPad
- **Entry Point**: `DummyTodoAppApp.swift` - uses `@main` attribute with SwiftUI App lifecycle
- **Main View**: `ContentView.swift` - root view loaded in WindowGroup

### Test Structure

- **Unit Tests** (`DummyTodoAppTests/`): Uses Swift Testing framework (`import Testing`)
- **UI Tests** (`DummyTodoAppUITests/`): Uses XCTest with XCUIApplication for UI automation

## Project Layout

```
DummyTodoApp/
├── DummyTodoApp/           # Main app source
│   ├── Assets.xcassets/    # App icons, colors, images
│   ├── ContentView.swift
│   └── DummyTodoAppApp.swift
├── DummyTodoAppTests/      # Unit tests
└── DummyTodoAppUITests/    # UI tests
```
