// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The Flutter Cupertino Design library.
///
/// To use, import `package:cupertino_ui/cupertino_ui.dart`.
///
/// This package contains the Cupertino widgets previously part of the Flutter
/// framework itself (`package:flutter/cupertino.dart`). It is being decoupled
/// to allow for faster iteration and a more modular ecosystem.
///
/// ## Migration status
///
/// Source files have been staged in `lib/src/` for the following modules:
///
/// **Foundation (zero or minimal cupertino dependencies):**
/// - `icons.dart` — [CupertinoIcons]
/// - `interface_level.dart` — [CupertinoUserInterfaceLevel]
/// - `colors.dart` — [CupertinoColors], [CupertinoDynamicColor]
/// - `text_theme.dart` — [CupertinoTextThemeData]
/// - `icon_theme_data.dart` — [CupertinoIconThemeData]
/// - `theme.dart` — [CupertinoTheme], [CupertinoThemeData]
/// - `thumb_painter.dart` — [CupertinoThumbPainter]
/// - `activity_indicator.dart` — [CupertinoActivityIndicator]
///
/// These staged files are ready to become the authoritative source once the
/// framework's `package:flutter/cupertino.dart` re-exports from this package
/// instead of bundling the source directly. Until then, we re-export from
/// the framework to avoid duplicate-type conflicts.
library cupertino_ui;

// Phase 1: Re-export all cupertino widgets from the framework.
// Phase 2: Swap to exporting from src/ once the framework re-exports from here.
export 'package:flutter/cupertino.dart';
