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
import 'package:windows_system/windows_system.dart';

/// @nodoc
const IID_IAppListEntry3 = '{6099f28d-fc32-470a-bc69-4b061a76ef2e}';

/// {@category interface}
class IAppListEntry3 extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IAppListEntry3.fromPtr(super.ptr);

  factory IAppListEntry3.from(IInspectable interface) =>
      IAppListEntry3.fromPtr(interface.toInterface(IID_IAppListEntry3));

  Future<bool> launchForUserAsync(User? user) {
    final retValuePtr = calloc<COMObject>();
    final userPtr = user == null ? nullptr : user.ptr.ref.lpVtbl;

    final hr =
        ptr.ref.vtable
                .elementAt(6)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                VTablePointer user,
                                Pointer<COMObject> retValuePtr)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, VTablePointer user,
                        Pointer<COMObject> retValuePtr)>()(
            ptr.ref.lpVtbl, userPtr, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<bool>.fromPtr(retValuePtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }
}
