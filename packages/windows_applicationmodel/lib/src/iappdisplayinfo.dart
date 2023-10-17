// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart'
    hide DocumentProperties, WinRTStringConversion;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';
import 'package:windows_storage/windows_storage.dart';

/// @nodoc
const IID_IAppDisplayInfo = '{1aeb1103-e4d4-41aa-a4f6-c4a276e79eac}';

class IAppDisplayInfo extends IInspectable {
  IAppDisplayInfo.fromPtr(super.ptr);

  factory IAppDisplayInfo.from(IInspectable interface) =>
      interface.cast(IAppDisplayInfo.fromPtr, IID_IAppDisplayInfo);

  String get displayName {
    final value = calloc<IntPtr>();

    try {
      final hr = vtable
              .elementAt(6)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              VTablePointer lpVtbl, Pointer<IntPtr> value)>>>()
              .value
              .asFunction<
                  int Function(VTablePointer lpVtbl, Pointer<IntPtr> value)>()(
          lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.toDartString();
    } finally {
      free(value);
    }
  }

  String get description {
    final value = calloc<IntPtr>();

    try {
      final hr = vtable
              .elementAt(7)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              VTablePointer lpVtbl, Pointer<IntPtr> value)>>>()
              .value
              .asFunction<
                  int Function(VTablePointer lpVtbl, Pointer<IntPtr> value)>()(
          lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.toDartString();
    } finally {
      free(value);
    }
  }

  RandomAccessStreamReference? getLogo(Size size) {
    final value = calloc<COMObject>();
    final sizeNativeStructPtr = size.toNative();

    final hr = vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, NativeSize size,
                            Pointer<COMObject> value)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, NativeSize size,
                    Pointer<COMObject> value)>()(
        lpVtbl, sizeNativeStructPtr.ref, value);

    free(sizeNativeStructPtr);

    if (FAILED(hr)) {
      free(value);
      throwWindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return RandomAccessStreamReference.fromPtr(value);
  }
}
