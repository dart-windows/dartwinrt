// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart' hide DocumentProperties;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'deviceinformation.dart';
import 'deviceinformationcollection.dart';
import 'devicewatcher.dart';
import 'enums.g.dart';

/// @nodoc
const IID_IDeviceInformationStatics2 = '{493b4f34-a84f-45fd-9167-15d1cb1bd1f9}';

/// {@category interface}
class IDeviceInformationStatics2 extends IInspectable {
  // vtable begins at 6, is 4 entries long.
  IDeviceInformationStatics2.fromRawPointer(super.ptr);

  factory IDeviceInformationStatics2.from(IInspectable interface) =>
      IDeviceInformationStatics2.fromRawPointer(
          interface.toInterface(IID_IDeviceInformationStatics2));

  String getAqsFilterFromDeviceClass(DeviceClass deviceClass) {
    final retValuePtr = calloc<HSTRING>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(6)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(LPVTBL lpVtbl, Int32 deviceClass,
                              Pointer<IntPtr> retValuePtr)>>>()
              .value
              .asFunction<
                  int Function(LPVTBL lpVtbl, int deviceClass,
                      Pointer<IntPtr> retValuePtr)>()(
          ptr.ref.lpVtbl, deviceClass.value, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.toDartString();
    } finally {
      WindowsDeleteString(retValuePtr.value);
      free(retValuePtr);
    }
  }

  Future<DeviceInformation?> createFromIdAsyncWithKindAndAdditionalProperties(
      String deviceId,
      IIterable<String>? additionalProperties,
      DeviceInformationKind kind) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<DeviceInformation?>();
    final deviceIdHString = convertToHString(deviceId);
    final additionalPropertiesPtr = additionalProperties == null
        ? nullptr
        : IInspectable(additionalProperties
                .toInterface('{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}'))
            .ptr
            .ref
            .lpVtbl;

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            LPVTBL lpVtbl,
                            IntPtr deviceId,
                            LPVTBL additionalProperties,
                            Int32 kind,
                            Pointer<COMObject> retValuePtr)>>>()
            .value
            .asFunction<
                int Function(
                    LPVTBL lpVtbl,
                    int deviceId,
                    LPVTBL additionalProperties,
                    int kind,
                    Pointer<COMObject> retValuePtr)>()(ptr.ref.lpVtbl,
        deviceIdHString, additionalPropertiesPtr, kind.value, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(deviceIdHString);
    additionalProperties?.release();

    final asyncOperation = IAsyncOperation<DeviceInformation?>.fromRawPointer(
        retValuePtr,
        creator: DeviceInformation.fromRawPointer);
    completeAsyncOperation(
        asyncOperation, completer, asyncOperation.getResults);

    return completer.future;
  }

  Future<DeviceInformationCollection?>
      findAllAsyncWithKindAqsFilterAndAdditionalProperties(String aqsFilter,
          IIterable<String>? additionalProperties, DeviceInformationKind kind) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<DeviceInformationCollection?>();
    final aqsFilterHString = convertToHString(aqsFilter);
    final additionalPropertiesPtr = additionalProperties == null
        ? nullptr
        : IInspectable(additionalProperties
                .toInterface('{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}'))
            .ptr
            .ref
            .lpVtbl;

    final hr = ptr.ref.vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            LPVTBL lpVtbl,
                            IntPtr aqsFilter,
                            LPVTBL additionalProperties,
                            Int32 kind,
                            Pointer<COMObject> retValuePtr)>>>()
            .value
            .asFunction<
                int Function(
                    LPVTBL lpVtbl,
                    int aqsFilter,
                    LPVTBL additionalProperties,
                    int kind,
                    Pointer<COMObject> retValuePtr)>()(ptr.ref.lpVtbl,
        aqsFilterHString, additionalPropertiesPtr, kind.value, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(aqsFilterHString);
    additionalProperties?.release();

    final asyncOperation =
        IAsyncOperation<DeviceInformationCollection?>.fromRawPointer(
            retValuePtr,
            creator: DeviceInformationCollection.fromRawPointer);
    completeAsyncOperation(
        asyncOperation, completer, asyncOperation.getResults);

    return completer.future;
  }

  DeviceWatcher? createWatcherWithKindAqsFilterAndAdditionalProperties(
      String aqsFilter,
      IIterable<String>? additionalProperties,
      DeviceInformationKind kind) {
    final retValuePtr = calloc<COMObject>();
    final aqsFilterHString = convertToHString(aqsFilter);
    final additionalPropertiesPtr = additionalProperties == null
        ? nullptr
        : IInspectable(additionalProperties
                .toInterface('{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}'))
            .ptr
            .ref
            .lpVtbl;

    final hr = ptr.ref.vtable
            .elementAt(9)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            LPVTBL lpVtbl,
                            IntPtr aqsFilter,
                            LPVTBL additionalProperties,
                            Int32 kind,
                            Pointer<COMObject> retValuePtr)>>>()
            .value
            .asFunction<
                int Function(
                    LPVTBL lpVtbl,
                    int aqsFilter,
                    LPVTBL additionalProperties,
                    int kind,
                    Pointer<COMObject> retValuePtr)>()(ptr.ref.lpVtbl,
        aqsFilterHString, additionalPropertiesPtr, kind.value, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(aqsFilterHString);
    additionalProperties?.release();

    if (retValuePtr.ref.isNull) {
      free(retValuePtr);
      return null;
    }

    return DeviceWatcher.fromRawPointer(retValuePtr);
  }
}
