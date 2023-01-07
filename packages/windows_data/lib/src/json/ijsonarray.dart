// ijsonarray.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'enums.g.dart';
import 'ijsonvalue.dart';
import 'jsonarray.dart';
import 'jsonobject.dart';

/// @nodoc
const IID_IJsonArray = '{08c1ddb6-0cbd-4a9a-b5d3-2f852dc37e81}';

/// {@category Interface}
/// {@category winrt}
class IJsonArray extends IInspectable implements IJsonValue {
  // vtable begins at 6, is 5 entries long.
  IJsonArray.fromRawPointer(super.ptr);

  factory IJsonArray.from(IInspectable interface) =>
      IJsonArray.fromRawPointer(interface.toInterface(IID_IJsonArray));

  JsonObject? getObjectAt(int index) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint32 index, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int index, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, index, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    if (retValuePtr.ref.lpVtbl == nullptr) {
      free(retValuePtr);
      return null;
    }

    return JsonObject.fromRawPointer(retValuePtr);
  }

  JsonArray? getArrayAt(int index) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint32 index, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int index, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, index, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    if (retValuePtr.ref.lpVtbl == nullptr) {
      free(retValuePtr);
      return null;
    }

    return JsonArray.fromRawPointer(retValuePtr);
  }

  String getStringAt(int index) {
    final retValuePtr = calloc<HSTRING>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(8)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              Pointer, Uint32 index, Pointer<IntPtr>)>>>()
              .value
              .asFunction<int Function(Pointer, int index, Pointer<IntPtr>)>()(
          ptr.ref.lpVtbl, index, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.toDartString();
      return retValue;
    } finally {
      WindowsDeleteString(retValuePtr.value);
      free(retValuePtr);
    }
  }

  double getNumberAt(int index) {
    final retValuePtr = calloc<Double>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(9)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              Pointer, Uint32 index, Pointer<Double>)>>>()
              .value
              .asFunction<int Function(Pointer, int index, Pointer<Double>)>()(
          ptr.ref.lpVtbl, index, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  bool getBooleanAt(int index) {
    final retValuePtr = calloc<Bool>();

    try {
      final hr = ptr.ref.vtable
              .elementAt(10)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(
                              Pointer, Uint32 index, Pointer<Bool>)>>>()
              .value
              .asFunction<int Function(Pointer, int index, Pointer<Bool>)>()(
          ptr.ref.lpVtbl, index, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  // IJsonValue methods
  late final _iJsonValue = IJsonValue.from(this);

  @override
  JsonValueType get valueType => _iJsonValue.valueType;

  @override
  String stringify() => _iJsonValue.stringify();

  @override
  String getString() => _iJsonValue.getString();

  @override
  double getNumber() => _iJsonValue.getNumber();

  @override
  bool getBoolean() => _iJsonValue.getBoolean();

  @override
  JsonArray? getArray() => _iJsonValue.getArray();

  @override
  JsonObject? getObject() => _iJsonValue.getObject();
}
