// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An exception generated by the `winrtgen` package.
final class WinRTGenException implements Exception {
  final String message;

  WinRTGenException(this.message);

  @override
  String toString() => 'WinRTGenException: $message';
}