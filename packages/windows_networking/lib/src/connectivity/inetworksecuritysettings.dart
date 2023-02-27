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

import 'enums.g.dart';

/// @nodoc
const IID_INetworkSecuritySettings = '{7ca07e8d-917b-4b5f-b84d-28f7a5ac5402}';

/// {@category interface}
class INetworkSecuritySettings extends IInspectable {
  // vtable begins at 6, is 2 entries long.
  INetworkSecuritySettings.fromRawPointer(super.ptr);

  factory INetworkSecuritySettings.from(IInspectable interface) =>
      INetworkSecuritySettings.fromRawPointer(
          interface.toInterface(IID_INetworkSecuritySettings));

  NetworkAuthenticationType get networkAuthenticationType {
    final retValuePtr = calloc<Int32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(6)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Int32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Int32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return NetworkAuthenticationType.from(retValuePtr.value);
    } finally {
      free(retValuePtr);
    }
  }

  NetworkEncryptionType get networkEncryptionType {
    final retValuePtr = calloc<Int32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(7)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Int32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Int32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return NetworkEncryptionType.from(retValuePtr.value);
    } finally {
      free(retValuePtr);
    }
  }
}