// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: deprecated_member_use_from_same_package

import 'package:windows_foundation/windows_foundation.dart';

/// Describes the results of a notification update.
///
/// {@category enum}
enum NotificationUpdateResult implements WinRTEnum {
  succeeded(0),
  failed(1),
  notificationNotFound(2);

  @override
  final int value;

  const NotificationUpdateResult(this.value);

  factory NotificationUpdateResult.from(int value) =>
      NotificationUpdateResult.values.firstWhere((e) => e.value == value,
          orElse: () => throw ArgumentError.value(
              value, 'value', 'No enum value with that value'));
}