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

import 'pedometerstepkind.dart';

/// @nodoc
const IID_IPedometerReading = '{2245dcf4-a8e1-432f-896a-be0dd9b02d24}';

class IPedometerReading extends IInspectable {
  IPedometerReading.fromPtr(super.ptr);

  factory IPedometerReading.from(IInspectable interface) =>
      interface.cast(IPedometerReading.fromPtr, IID_IPedometerReading);

  PedometerStepKind get stepKind {
    final value = calloc<Int32>();

    try {
      final hr = vtable
          .elementAt(6)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
                          VTablePointer lpVtbl, Pointer<Int32> value)>>>()
          .value
          .asFunction<
              int Function(
                  VTablePointer lpVtbl, Pointer<Int32> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return PedometerStepKind.from(value.value);
    } finally {
      free(value);
    }
  }

  int get cumulativeSteps {
    final value = calloc<Int32>();

    try {
      final hr = vtable
          .elementAt(7)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
                          VTablePointer lpVtbl, Pointer<Int32> value)>>>()
          .value
          .asFunction<
              int Function(
                  VTablePointer lpVtbl, Pointer<Int32> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.value;
    } finally {
      free(value);
    }
  }

  DateTime get timestamp {
    final value = calloc<Int64>();

    try {
      final hr = vtable
          .elementAt(8)
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

  Duration get cumulativeStepsDuration {
    final value = calloc<Int64>();

    try {
      final hr = vtable
          .elementAt(9)
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

      return value.toDartDuration();
    } finally {
      free(value);
    }
  }
}
