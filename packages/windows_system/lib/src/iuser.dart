// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart' hide DocumentProperties;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';
import 'package:windows_storage/windows_storage.dart';

import 'userauthenticationstatus.dart';
import 'userpicturesize.dart';
import 'usertype.dart';

/// @nodoc
const IID_IUser = '{df9a26c6-e746-4bcd-b5d4-120103c4209b}';

class IUser extends IInspectable {
  // vtable begins at 6, is 6 entries long.
  IUser.fromPtr(super.ptr);

  factory IUser.from(IInspectable interface) =>
      IUser.fromPtr(interface.toInterface(IID_IUser));

  String get nonRoamableId {
    final value = calloc<IntPtr>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(6)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              VTablePointer lpVtbl, Pointer<IntPtr> value)>>>()
              .value
              .asFunction<
                  int Function(VTablePointer lpVtbl, Pointer<IntPtr> value)>()(
          ptr.ref.lpVtbl, value);

      if (FAILED(hr)) throw WindowsException(hr);

      return value.toDartString();
    } finally {
      WindowsDeleteString(value.value);
      free(value);
    }
  }

  UserAuthenticationStatus get authenticationStatus {
    final value = calloc<Int32>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(7)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              VTablePointer lpVtbl, Pointer<Int32> value)>>>()
              .value
              .asFunction<
                  int Function(VTablePointer lpVtbl, Pointer<Int32> value)>()(
          ptr.ref.lpVtbl, value);

      if (FAILED(hr)) throw WindowsException(hr);

      return UserAuthenticationStatus.from(value.value);
    } finally {
      free(value);
    }
  }

  UserType get type {
    final value = calloc<Int32>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(8)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              VTablePointer lpVtbl, Pointer<Int32> value)>>>()
              .value
              .asFunction<
                  int Function(VTablePointer lpVtbl, Pointer<Int32> value)>()(
          ptr.ref.lpVtbl, value);

      if (FAILED(hr)) throw WindowsException(hr);

      return UserType.from(value.value);
    } finally {
      free(value);
    }
  }

  Future<Object?> getPropertyAsync(String value) {
    final operation = calloc<COMObject>();
    final valueHString = value.toHString();

    final hr = ptr.ref.vtable
            .elementAt(9)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, IntPtr value,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, int value,
                    Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl, valueHString, operation);

    WindowsDeleteString(valueHString);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<Object?>.fromPtr(operation);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<IPropertySet> getPropertiesAsync(IVectorView<String> values) {
    final operation = calloc<COMObject>();

    final hr =
        ptr.ref.vtable
                .elementAt(10)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                VTablePointer values,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, VTablePointer values,
                        Pointer<COMObject> operation)>()(
            ptr.ref.lpVtbl, values.ptr.ref.lpVtbl, operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<IPropertySet>.fromPtr(operation,
        creator: IPropertySet.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<IRandomAccessStreamReference?> getPictureAsync(
      UserPictureSize desiredSize) {
    final operation = calloc<COMObject>();

    final hr =
        ptr.ref.vtable
                .elementAt(11)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                Int32 desiredSize,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, int desiredSize,
                        Pointer<COMObject> operation)>()(
            ptr.ref.lpVtbl, desiredSize.value, operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation =
        IAsyncOperation<IRandomAccessStreamReference?>.fromPtr(operation,
            creator: IRandomAccessStreamReference.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }
}
