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
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 17' test

# Run only unit tests (not UI tests)
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 17' -only-testing:DummyTodoAppTests test

# Run only UI tests
xcodebuild -project DummyTodoApp/DummyTodoApp.xcodeproj -scheme DummyTodoApp -destination 'platform=iOS Simulator,name=iPhone 17' -only-testing:DummyTodoAppUITests test
```

## Architecture

- **Framework**: SwiftUI with Swift 5
- **Target**: iOS 26.2+, iPhone and iPad
- **Persistence**: SwiftData with `TodoItem` model
- **Entry Point**: `DummyTodoAppApp.swift` - sets up SwiftData model container
- **Main View**: `ContentView.swift` - todo list with add, complete, and delete functionality

### Test Structure

- **Unit Tests** (`DummyTodoAppTests/`): Uses Swift Testing framework (`import Testing`)
- **UI Tests** (`DummyTodoAppUITests/`): Uses XCTest with XCUIApplication for UI automation

## Project Layout

```
DummyTodoApp/
├── DummyTodoApp/           # Main app source
│   ├── Assets.xcassets/    # App icons, colors, images
│   ├── TodoItem.swift      # SwiftData model
│   ├── ContentView.swift   # Main UI
│   └── DummyTodoAppApp.swift
├── DummyTodoAppTests/      # Unit tests
└── DummyTodoAppUITests/    # UI tests
```
