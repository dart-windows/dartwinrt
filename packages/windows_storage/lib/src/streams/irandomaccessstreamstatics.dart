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

import 'iinputstream.dart';
import 'ioutputstream.dart';

/// @nodoc
const IID_IRandomAccessStreamStatics = '{524cedcf-6e29-4ce5-9573-6b753db66c3a}';

class IRandomAccessStreamStatics extends IInspectable {
  // vtable begins at 6, is 3 entries long.
  IRandomAccessStreamStatics.fromPtr(super.ptr);

  factory IRandomAccessStreamStatics.from(IInspectable interface) => interface
      .cast(IRandomAccessStreamStatics.fromPtr, IID_IRandomAccessStreamStatics);

  Pointer<COMObject> copyAsync(
      IInputStream? source, IOutputStream? destination) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer source,
                            VTablePointer destination,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer source,
                    VTablePointer destination, Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl, source.lpVtbl, destination.lpVtbl, operation);

    if (FAILED(hr)) {
      free(operation);
      throwWindowsException(hr);
    }

    return operation;
  }

  Pointer<COMObject> copySizeAsync(
      IInputStream? source, IOutputStream? destination, int bytesToCopy) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer source,
                            VTablePointer destination,
                            Uint64 bytesToCopy,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer source,
                    VTablePointer destination,
                    int bytesToCopy,
                    Pointer<COMObject> operation)>()(ptr.ref.lpVtbl,
        source.lpVtbl, destination.lpVtbl, bytesToCopy, operation);

    if (FAILED(hr)) {
      free(operation);
      throwWindowsException(hr);
    }

    return operation;
  }

  Pointer<COMObject> copyAndCloseAsync(
      IInputStream? source, IOutputStream? destination) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer source,
                            VTablePointer destination,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer source,
                    VTablePointer destination, Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl, source.lpVtbl, destination.lpVtbl, operation);

    if (FAILED(hr)) {
      free(operation);
      throwWindowsException(hr);
    }

    return operation;
  }
}
