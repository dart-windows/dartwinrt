// ihostnamefactory.dart

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

import 'hostname.dart';

/// @nodoc
const IID_IHostNameFactory = '{458c23ed-712f-4576-adf1-c20b2c643558}';

/// {@category Interface}
/// {@category winrt}
class IHostNameFactory extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IHostNameFactory.fromRawPointer(super.ptr);

  factory IHostNameFactory.from(IInspectable interface) =>
      IHostNameFactory.fromRawPointer(
          interface.toInterface(IID_IHostNameFactory));

  HostName createHostName(String hostName) {
    final retValuePtr = calloc<COMObject>();
    final hostNameHstring = convertToHString(hostName);

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, IntPtr hostName, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int hostName, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, hostNameHstring, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(hostNameHstring);

    return HostName.fromRawPointer(retValuePtr);
  }
}
