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

import 'bitmappropertyset.dart';

/// @nodoc
const IID_IBitmapPropertiesView = '{7e0fe87a-3a70-48f8-9c55-196cf5a545f5}';

class IBitmapPropertiesView extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IBitmapPropertiesView.fromPtr(super.ptr);

  factory IBitmapPropertiesView.from(IInspectable interface) =>
      IBitmapPropertiesView.fromPtr(
          interface.toInterface(IID_IBitmapPropertiesView));

  Future<BitmapPropertySet> getPropertiesAsync(
      IIterable<String>? propertiesToRetrieve) {
    final retValuePtr = calloc<COMObject>();
    final propertiesToRetrievePtr = propertiesToRetrieve == null
        ? nullptr
        : IInspectable(propertiesToRetrieve
                .toInterface('{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}'))
            .ptr
            .ref
            .lpVtbl;

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer propertiesToRetrieve,
                            Pointer<COMObject> retValuePtr)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer propertiesToRetrieve,
                    Pointer<COMObject> retValuePtr)>()(
        ptr.ref.lpVtbl, propertiesToRetrievePtr, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<BitmapPropertySet>.fromPtr(
        retValuePtr,
        creator: BitmapPropertySet.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }
}