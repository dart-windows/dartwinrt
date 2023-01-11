// ifileopenpickerstatics2.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_system/windows_system.dart';

import 'fileopenpicker.dart';

/// @nodoc
const IID_IFileOpenPickerStatics2 = '{e8917415-eddd-5c98-b6f3-366fdfcad392}';

/// {@category Interface}
/// {@category winrt}
class IFileOpenPickerStatics2 extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IFileOpenPickerStatics2.fromRawPointer(super.ptr);

  factory IFileOpenPickerStatics2.from(IInspectable interface) =>
      IFileOpenPickerStatics2.fromRawPointer(
          interface.toInterface(IID_IFileOpenPickerStatics2));

  FileOpenPicker? createForUser(User? user) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Pointer<COMObject> user,
                            Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(
                    Pointer, Pointer<COMObject> user, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl,
        user == null ? nullptr : user.ptr.cast<Pointer<COMObject>>().value,
        retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    if (retValuePtr.ref.lpVtbl == nullptr) {
      free(retValuePtr);
      return null;
    }

    return FileOpenPicker.fromRawPointer(retValuePtr);
  }
}