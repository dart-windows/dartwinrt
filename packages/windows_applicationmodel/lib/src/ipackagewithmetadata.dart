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

/// @nodoc
const IID_IPackageWithMetadata = '{95949780-1de9-40f2-b452-0de9f1910012}';

class IPackageWithMetadata extends IInspectable {
  IPackageWithMetadata.fromPtr(super.ptr);

  factory IPackageWithMetadata.from(IInspectable interface) =>
      interface.cast(IPackageWithMetadata.fromPtr, IID_IPackageWithMetadata);

  DateTime get installDate {
    final value = calloc<Int64>();

    try {
      final hr = vtable
          .elementAt(6)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
                          VTablePointer lpVtbl, Pointer<Int64> value)>>>()
          .value
          .asFunction<
              int Function(
                  VTablePointer lpVtbl, Pointer<Int64> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.toDartDateTime();
    } finally {
      free(value);
    }
  }

  String getThumbnailToken() {
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

  @Deprecated(
      "Launch may be altered or unavailable for releases after Windows 8.1. Instead, for SmartCardTrigger scenarios use SmartCardTriggerDetails.TryLaunchSelfAsync")
  void launch(String parameters) {
    final hr = vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl, IntPtr parameters)>>>()
            .value
            .asFunction<int Function(VTablePointer lpVtbl, int parameters)>()(
        lpVtbl, parameters.toHString());

    if (FAILED(hr)) throwWindowsException(hr);
  }
}
