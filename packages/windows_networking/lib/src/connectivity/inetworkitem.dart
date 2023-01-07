// inetworkitem.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'enums.g.dart';

/// @nodoc
const IID_INetworkItem = '{01bc4d39-f5e0-4567-a28c-42080c831b2b}';

/// {@category Interface}
/// {@category winrt}
class INetworkItem extends IInspectable {
  // vtable begins at 6, is 2 entries long.
  INetworkItem.fromRawPointer(super.ptr);

  factory INetworkItem.from(IInspectable interface) =>
      INetworkItem.fromRawPointer(interface.toInterface(IID_INetworkItem));

  Guid get networkId {
    final retValuePtr = calloc<GUID>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(6)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(Pointer, Pointer<GUID>)>>>()
          .value
          .asFunction<
              int Function(
                  Pointer, Pointer<GUID>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.toDartGuid();
    } finally {
      free(retValuePtr);
    }
  }

  NetworkTypes getNetworkTypes() {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(7)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(Pointer, Pointer<Uint32>)>>>()
          .value
          .asFunction<
              int Function(
                  Pointer, Pointer<Uint32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return NetworkTypes.from(retValuePtr.value);
    } finally {
      free(retValuePtr);
    }
  }
}