// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

// Test the WinRT helper functions to make sure everything is working correctly.

void main() {
  test('isSameType', () {
    expect(isSameType<Guid, Guid>(), isTrue);
    expect(isSameType<int, int>(), isTrue);
    expect(isSameType<int, int?>(), isFalse);
    expect(isSameType<Object, Object>(), isTrue);
    expect(isSameType<String, String>(), isTrue);
    expect(isSameType<String?, String>(), isFalse);
  });

  test('isSimilarType', () {
    expect(isSimilarType<Guid, Guid>(), isTrue);
    expect(isSimilarType<int?, int>(), isTrue);
    expect(isSimilarType<int?, int?>(), isTrue);
    expect(isSimilarType<Object, Object>(), isTrue);
    expect(isSimilarType<String, String>(), isTrue);
    expect(isSimilarType<String?, String?>(), isTrue);
  });

  test('isSubtype', () {
    expect(isSubtype<StringMap, IInspectable>(), isTrue);
    expect(isSubtype<IAsyncInfo, IInspectable>(), isTrue);
    expect(isSubtype<IUnknown, IInspectable>(), isFalse);
    expect(isSubtype<IInspectable, IUnknown>(), isTrue);
  });

  test('isSubtypeOfInspectable', () {
    expect(isSubtypeOfInspectable<StringMap>(), isTrue);
    expect(isSubtypeOfInspectable<IAsyncInfo>(), isTrue);
    expect(isSubtypeOfInspectable<IUnknown>(), isFalse);
    expect(isSubtypeOfInspectable<INetwork>(), isFalse);
  });

  test('isSubtypeOfWinRTEnum', () {
    expect(isSubtypeOfWinRTEnum<AsyncStatus>(), isTrue);
    expect(isSubtypeOfWinRTEnum<WinRTEnum>(), isTrue);
    expect(isSubtypeOfWinRTEnum<IAsyncAction>(), isFalse);
  });
}
