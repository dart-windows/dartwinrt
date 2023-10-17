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
import 'package:windows_ui/windows_ui.dart';

import 'deviceinformation.dart';
import 'devicepicker.dart';
import 'devicepickerappearance.dart';
import 'devicepickerdisplaystatusoptions.dart';
import 'devicepickerfilter.dart';

/// @nodoc
const IID_IDevicePicker = '{84997aa2-034a-4440-8813-7d0bd479bf5a}';

class IDevicePicker extends IInspectable {
  IDevicePicker.fromPtr(super.ptr);

  factory IDevicePicker.from(IInspectable interface) =>
      interface.cast(IDevicePicker.fromPtr, IID_IDevicePicker);

  DevicePickerFilter? get filter {
    final filter = calloc<COMObject>();

    final hr = vtable
        .elementAt(6)
        .cast<
            Pointer<
                NativeFunction<
                    HRESULT Function(
                        VTablePointer lpVtbl, Pointer<COMObject> filter)>>>()
        .value
        .asFunction<
            int Function(VTablePointer lpVtbl,
                Pointer<COMObject> filter)>()(lpVtbl, filter);

    if (FAILED(hr)) {
      free(filter);
      throwWindowsException(hr);
    }

    if (filter.isNull) {
      free(filter);
      return null;
    }

    return DevicePickerFilter.fromPtr(filter);
  }

  DevicePickerAppearance? get appearance {
    final value = calloc<COMObject>();

    final hr = vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl, Pointer<COMObject> value)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, Pointer<COMObject> value)>()(
        lpVtbl, value);

    if (FAILED(hr)) {
      free(value);
      throwWindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return DevicePickerAppearance.fromPtr(value);
  }

  IVector<String>? get requestedProperties {
    final value = calloc<COMObject>();

    final hr = vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl, Pointer<COMObject> value)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, Pointer<COMObject> value)>()(
        lpVtbl, value);

    if (FAILED(hr)) {
      free(value);
      throwWindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return IVector.fromPtr(value,
        iterableIid: '{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}');
  }

  int add_DeviceSelected(Pointer<COMObject> handler) {
    final token = calloc<IntPtr>();

    try {
      final hr = vtable
          .elementAt(9)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(VTablePointer lpVtbl,
                          VTablePointer handler, Pointer<IntPtr> token)>>>()
          .value
          .asFunction<
              int Function(VTablePointer lpVtbl, VTablePointer handler,
                  Pointer<IntPtr> token)>()(lpVtbl, handler.ref.lpVtbl, token);

      if (FAILED(hr)) throwWindowsException(hr);

      return token.value;
    } finally {
      free(token);
    }
  }

  void remove_DeviceSelected(int token) {
    final hr =
        vtable
                .elementAt(10)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl, IntPtr token)>>>()
                .value
                .asFunction<int Function(VTablePointer lpVtbl, int token)>()(
            lpVtbl, token);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  int add_DisconnectButtonClicked(Pointer<COMObject> handler) {
    final token = calloc<IntPtr>();

    try {
      final hr = vtable
          .elementAt(11)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(VTablePointer lpVtbl,
                          VTablePointer handler, Pointer<IntPtr> token)>>>()
          .value
          .asFunction<
              int Function(VTablePointer lpVtbl, VTablePointer handler,
                  Pointer<IntPtr> token)>()(lpVtbl, handler.ref.lpVtbl, token);

      if (FAILED(hr)) throwWindowsException(hr);

      return token.value;
    } finally {
      free(token);
    }
  }

  void remove_DisconnectButtonClicked(int token) {
    final hr =
        vtable
                .elementAt(12)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl, IntPtr token)>>>()
                .value
                .asFunction<int Function(VTablePointer lpVtbl, int token)>()(
            lpVtbl, token);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  int add_DevicePickerDismissed(Pointer<COMObject> handler) {
    final token = calloc<IntPtr>();

    try {
      final hr = vtable
          .elementAt(13)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(VTablePointer lpVtbl,
                          VTablePointer handler, Pointer<IntPtr> token)>>>()
          .value
          .asFunction<
              int Function(VTablePointer lpVtbl, VTablePointer handler,
                  Pointer<IntPtr> token)>()(lpVtbl, handler.ref.lpVtbl, token);

      if (FAILED(hr)) throwWindowsException(hr);

      return token.value;
    } finally {
      free(token);
    }
  }

  void remove_DevicePickerDismissed(int token) {
    final hr =
        vtable
                .elementAt(14)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl, IntPtr token)>>>()
                .value
                .asFunction<int Function(VTablePointer lpVtbl, int token)>()(
            lpVtbl, token);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  void show(Rect selection) {
    final selectionNativeStructPtr = selection.toNative();

    final hr = vtable
            .elementAt(15)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl, NativeRect selection)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, NativeRect selection)>()(
        lpVtbl, selectionNativeStructPtr.ref);

    free(selectionNativeStructPtr);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  void showWithPlacement(Rect selection, Placement placement) {
    final selectionNativeStructPtr = selection.toNative();

    final hr =
        vtable
                .elementAt(16)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(VTablePointer lpVtbl,
                                NativeRect selection, Int32 placement)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, NativeRect selection,
                        int placement)>()(
            lpVtbl, selectionNativeStructPtr.ref, placement.value);

    free(selectionNativeStructPtr);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  Future<DeviceInformation?> pickSingleDeviceAsync(Rect selection) {
    final operation = calloc<COMObject>();
    final selectionNativeStructPtr = selection.toNative();

    final hr =
        vtable
                .elementAt(17)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                NativeRect selection,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, NativeRect selection,
                        Pointer<COMObject> operation)>()(
            lpVtbl, selectionNativeStructPtr.ref, operation);

    free(selectionNativeStructPtr);

    if (FAILED(hr)) {
      free(operation);
      throwWindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<DeviceInformation?>.fromPtr(
        operation,
        creator: DeviceInformation.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<DeviceInformation?> pickSingleDeviceAsyncWithPlacement(
      Rect selection, Placement placement) {
    final operation = calloc<COMObject>();
    final selectionNativeStructPtr = selection.toNative();

    final hr =
        vtable
                .elementAt(18)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                NativeRect selection,
                                Int32 placement,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, NativeRect selection,
                        int placement, Pointer<COMObject> operation)>()(
            lpVtbl, selectionNativeStructPtr.ref, placement.value, operation);

    free(selectionNativeStructPtr);

    if (FAILED(hr)) {
      free(operation);
      throwWindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<DeviceInformation?>.fromPtr(
        operation,
        creator: DeviceInformation.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  void hide() {
    final hr = vtable
        .elementAt(19)
        .cast<Pointer<NativeFunction<HRESULT Function(VTablePointer lpVtbl)>>>()
        .value
        .asFunction<int Function(VTablePointer lpVtbl)>()(lpVtbl);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  void setDisplayStatus(DeviceInformation? device, String status,
      DevicePickerDisplayStatusOptions options) {
    final hr =
        vtable
                .elementAt(20)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                VTablePointer device,
                                IntPtr status,
                                Uint32 options)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, VTablePointer device,
                        int status, int options)>()(
            lpVtbl, device.lpVtbl, status.toHString(), options.value);

    if (FAILED(hr)) throwWindowsException(hr);
  }
}
