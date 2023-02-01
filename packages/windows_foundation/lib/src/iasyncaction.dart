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
import 'package:win32/win32.dart';

import '../../../internal.dart';
import 'callbacks.dart';
import 'collections/iiterator.dart';
import 'enums.g.dart';
import 'helpers.dart';
import 'iasyncinfo.dart';
import 'iinspectable.dart';
import 'types.dart';

/// @nodoc
const IID_IAsyncAction = '{5a648006-843a-4da9-865b-9d26e5dfad7b}';

/// Represents an asynchronous action. This is the return type for many
/// Windows Runtime asynchronous methods that don't have a result object,
/// and don't report ongoing progress.
///
/// {@category interface}
class IAsyncAction extends IInspectable implements IAsyncInfo {
  // vtable begins at 6, is 3 entries long.
  IAsyncAction.fromRawPointer(super.ptr);

  factory IAsyncAction.from(IInspectable interface) =>
      IAsyncAction.fromRawPointer(interface.toInterface(IID_IAsyncAction));

  set completed(Pointer<NativeFunction<AsyncActionCompletedHandler>> value) {
    final hr =
        ptr.ref.vtable
                .elementAt(6)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                Pointer,
                                Pointer<
                                    NativeFunction<
                                        AsyncActionCompletedHandler>>)>>>()
                .value
                .asFunction<
                    int Function(
                        Pointer,
                        Pointer<
                            NativeFunction<AsyncActionCompletedHandler>>)>()(
            ptr.ref.lpVtbl, value);

    if (FAILED(hr)) throw WindowsException(hr);
  }

  Pointer<NativeFunction<AsyncActionCompletedHandler>> get completed {
    final retValuePtr =
        calloc<Pointer<NativeFunction<AsyncActionCompletedHandler>>>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(7)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              Pointer,
                              Pointer<
                                  Pointer<
                                      NativeFunction<
                                          AsyncActionCompletedHandler>>>)>>>()
              .value
              .asFunction<
                  int Function(
                      Pointer,
                      Pointer<
                          Pointer<
                              NativeFunction<AsyncActionCompletedHandler>>>)>()(
          ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  void getResults() {
    final hr = ptr.ref.vtable
        .elementAt(8)
        .cast<Pointer<NativeFunction<HRESULT Function(Pointer)>>>()
        .value
        .asFunction<int Function(Pointer)>()(ptr.ref.lpVtbl);

    if (FAILED(hr)) throw WindowsException(hr);
  }

  // IAsyncInfo methods
  late final _iAsyncInfo = IAsyncInfo.from(this);

  @override
  int get id => _iAsyncInfo.id;

  @override
  AsyncStatus get status => _iAsyncInfo.status;

  @override
  int get errorCode => _iAsyncInfo.errorCode;

  @override
  void cancel() => _iAsyncInfo.cancel();

  @override
  void close() => _iAsyncInfo.close();
}
