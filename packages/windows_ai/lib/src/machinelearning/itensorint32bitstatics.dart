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

import 'tensorint32bit.dart';

/// @nodoc
const IID_ITensorInt32BitStatics = '{6539864b-52fa-4e35-907c-834cac417b50}';

class ITensorInt32BitStatics extends IInspectable {
  // vtable begins at 6, is 4 entries long.
  ITensorInt32BitStatics.fromPtr(super.ptr);

  factory ITensorInt32BitStatics.from(IInspectable interface) =>
      ITensorInt32BitStatics.fromPtr(
          interface.toInterface(IID_ITensorInt32BitStatics));

  TensorInt32Bit? create() {
    final result = calloc<COMObject>();

    final hr = ptr.ref.vtable
        .elementAt(6)
        .cast<
            Pointer<
                NativeFunction<
                    HRESULT Function(
                        VTablePointer lpVtbl, Pointer<COMObject> result)>>>()
        .value
        .asFunction<
            int Function(VTablePointer lpVtbl,
                Pointer<COMObject> result)>()(ptr.ref.lpVtbl, result);

    if (FAILED(hr)) {
      free(result);
      throw WindowsException(hr);
    }

    if (result.isNull) {
      free(result);
      return null;
    }

    return TensorInt32Bit.fromPtr(result);
  }

  TensorInt32Bit? create2(IIterable<int>? shape) {
    final result = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, VTablePointer shape,
                            Pointer<COMObject> result)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer shape,
                    Pointer<COMObject> result)>()(
        ptr.ref.lpVtbl,
        shape == null
            ? nullptr
            : IInspectable(
                    shape.toInterface('{7784427e-f9cc-518d-964b-e50d5ce727f1}'))
                .ptr
                .ref
                .lpVtbl,
        result);

    if (FAILED(hr)) {
      free(result);
      throw WindowsException(hr);
    }

    if (result.isNull) {
      free(result);
      return null;
    }

    return TensorInt32Bit.fromPtr(result);
  }

  TensorInt32Bit? createFromArray(IIterable<int>? shape, List<int> data) {
    final result = calloc<COMObject>();
    final pDataArray = calloc<Int32>(data.length);
    for (var i = 0; i < data.length; i++) {
      pDataArray[i] = data[i];
    }

    final hr = ptr.ref.vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer shape,
                            Uint32 dataSize,
                            Pointer<Int32> data,
                            Pointer<COMObject> result)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer shape,
                    int dataSize,
                    Pointer<Int32> data,
                    Pointer<COMObject> result)>()(
        ptr.ref.lpVtbl,
        shape == null
            ? nullptr
            : IInspectable(
                    shape.toInterface('{7784427e-f9cc-518d-964b-e50d5ce727f1}'))
                .ptr
                .ref
                .lpVtbl,
        data.length,
        pDataArray,
        result);

    free(pDataArray);

    if (FAILED(hr)) {
      free(result);
      throw WindowsException(hr);
    }

    if (result.isNull) {
      free(result);
      return null;
    }

    return TensorInt32Bit.fromPtr(result);
  }

  TensorInt32Bit? createFromIterable(
      IIterable<int>? shape, IIterable<int>? data) {
    final result = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(9)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, VTablePointer shape,
                            VTablePointer data, Pointer<COMObject> result)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer shape,
                    VTablePointer data, Pointer<COMObject> result)>()(
        ptr.ref.lpVtbl,
        shape == null
            ? nullptr
            : IInspectable(
                    shape.toInterface('{7784427e-f9cc-518d-964b-e50d5ce727f1}'))
                .ptr
                .ref
                .lpVtbl,
        data == null
            ? nullptr
            : IInspectable(
                    data.toInterface('{81a643fb-f51c-5565-83c4-f96425777b66}'))
                .ptr
                .ref
                .lpVtbl,
        result);

    if (FAILED(hr)) {
      free(result);
      throw WindowsException(hr);
    }

    if (result.isNull) {
      free(result);
      return null;
    }

    return TensorInt32Bit.fromPtr(result);
  }
}
