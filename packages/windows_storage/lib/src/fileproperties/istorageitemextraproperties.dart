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

/// @nodoc
const IID_IStorageItemExtraProperties =
    '{c54361b2-54cd-432b-bdbc-4b19c4b470d7}';

/// {@category interface}
class IStorageItemExtraProperties extends IInspectable {
  // vtable begins at 6, is 3 entries long.
  IStorageItemExtraProperties.fromRawPointer(super.ptr);

  factory IStorageItemExtraProperties.from(IInspectable interface) =>
      IStorageItemExtraProperties.fromRawPointer(
          interface.toInterface(IID_IStorageItemExtraProperties));

  Future<IMap<String, Object?>> retrievePropertiesAsync(
      IIterable<String>? propertiesToRetrieve) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<IMap<String, Object?>>();
    final propertiesToRetrievePtr = propertiesToRetrieve == null
        ? nullptr
        : IInspectable(propertiesToRetrieve
                .toInterface('{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}'))
            .ptr
            .ref
            .lpVtbl;

    final hr =
        ptr.ref.vtable
                .elementAt(6)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                LPVTBL lpVtbl,
                                LPVTBL propertiesToRetrieve,
                                Pointer<COMObject> retValuePtr)>>>()
                .value
                .asFunction<
                    int Function(LPVTBL lpVtbl, LPVTBL propertiesToRetrieve,
                        Pointer<COMObject> retValuePtr)>()(
            ptr.ref.lpVtbl, propertiesToRetrievePtr, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    propertiesToRetrieve?.release();

    final asyncOperation =
        IAsyncOperation<IMap<String, Object?>>.fromRawPointer(retValuePtr,
            creator: (Pointer<COMObject> ptr) => IMap.fromRawPointer(ptr,
                iterableIid: '{fe2f3d47-5d47-5499-8374-430c7cda0204}'));
    completeAsyncOperation(
        asyncOperation, completer, asyncOperation.getResults);

    return completer.future;
  }

  Future<void> savePropertiesAsync(
      IIterable<IKeyValuePair<String, Object?>>? propertiesToSave) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<void>();
    final propertiesToSavePtr = propertiesToSave == null
        ? nullptr
        : IInspectable(propertiesToSave
                .toInterface('{fe2f3d47-5d47-5499-8374-430c7cda0204}'))
            .ptr
            .ref
            .lpVtbl;

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(LPVTBL lpVtbl, LPVTBL propertiesToSave,
                            Pointer<COMObject> retValuePtr)>>>()
            .value
            .asFunction<
                int Function(LPVTBL lpVtbl, LPVTBL propertiesToSave,
                    Pointer<COMObject> retValuePtr)>()(
        ptr.ref.lpVtbl, propertiesToSavePtr, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    propertiesToSave?.release();

    final asyncAction = IAsyncAction.fromRawPointer(retValuePtr);
    completeAsyncAction(asyncAction, completer);

    return completer.future;
  }

  Future<void> savePropertiesAsyncOverloadDefault() {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<void>();

    final hr = ptr.ref.vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            LPVTBL lpVtbl, Pointer<COMObject> retValuePtr)>>>()
            .value
            .asFunction<
                int Function(LPVTBL lpVtbl, Pointer<COMObject> retValuePtr)>()(
        ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    final asyncAction = IAsyncAction.fromRawPointer(retValuePtr);
    completeAsyncAction(asyncAction, completer);

    return completer.future;
  }
}
