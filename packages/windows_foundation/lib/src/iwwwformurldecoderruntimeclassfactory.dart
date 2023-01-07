// iwwwformurldecoderruntimeclassfactory.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import '../../../internal.dart';
import 'winrt_callbacks.dart';
import 'winrt_helpers.dart';
import 'wwwformurldecoder.dart';

/// @nodoc
const IID_IWwwFormUrlDecoderRuntimeClassFactory =
    '{5b8c6b3d-24ae-41b5-a1bf-f0c3d544845b}';

/// {@category Interface}
/// {@category winrt}
class IWwwFormUrlDecoderRuntimeClassFactory extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IWwwFormUrlDecoderRuntimeClassFactory.fromRawPointer(super.ptr);

  factory IWwwFormUrlDecoderRuntimeClassFactory.from(IInspectable interface) =>
      IWwwFormUrlDecoderRuntimeClassFactory.fromRawPointer(
          interface.toInterface(IID_IWwwFormUrlDecoderRuntimeClassFactory));

  WwwFormUrlDecoder createWwwFormUrlDecoder(String query) {
    final retValuePtr = calloc<COMObject>();
    final queryHstring = convertToHString(query);

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, IntPtr query, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int query, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, queryHstring, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(queryHstring);

    return WwwFormUrlDecoder.fromRawPointer(retValuePtr);
  }
}
