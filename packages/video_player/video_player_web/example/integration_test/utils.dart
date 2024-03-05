// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:web/web.dart' as web;
import 'pkg_web_tweaks.dart';

// Returns the URL to load an asset from this example app as a network source.
//
// TODO(stuartmorgan): Convert this to a local `HttpServer` that vends the
// assets directly, https://github.com/flutter/flutter/issues/95420
String getUrlForAssetAsNetworkSource(String assetKey) {
  return 'https://github.com/flutter/packages/blob/'
      // This hash can be rolled forward to pick up newly-added assets.
      '2e1673307ff7454aff40b47024eaed49a9e77e81'
      '/packages/video_player/video_player/example/'
      '$assetKey'
      '?raw=true';
}

/// Forces a VideoElement to report "Infinity" duration.
///
/// Uses JS Object.defineProperty to set the value of a readonly property.
void setInfinityDuration(web.HTMLVideoElement element) {
  jsObjectConstructor.defineProperty(
    element,
    'duration',
    Descriptor(
      writable: true,
      value: double.infinity,
    ),
  );
}

/// Modifies a HTMLVideoElement to throw an exception when setting `currentTime`.
extension type ThrowyVideoElement(web.HTMLVideoElement _)
    implements web.HTMLVideoElement {
  set currentTime(num value) {
    throw Exception('Unexpected call to currentTime with value: $value');
  }

  int get currentTime => 100;
}
