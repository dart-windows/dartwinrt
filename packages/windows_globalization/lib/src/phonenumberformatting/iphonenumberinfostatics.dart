// iphonenumberinfostatics.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'enums.g.dart';
import 'phonenumberinfo.dart';

/// @nodoc
const IID_IPhoneNumberInfoStatics = '{5b3f4f6a-86a9-40e9-8649-6d61161928d4}';

/// {@category Interface}
/// {@category winrt}
class IPhoneNumberInfoStatics extends IInspectable {
  // vtable begins at 6, is 2 entries long.
  IPhoneNumberInfoStatics.fromRawPointer(super.ptr);

  factory IPhoneNumberInfoStatics.from(IInspectable interface) =>
      IPhoneNumberInfoStatics.fromRawPointer(
          interface.toInterface(IID_IPhoneNumberInfoStatics));

  PhoneNumberParseResult tryParse(String input, PhoneNumberInfo phoneNumber) {
    final retValuePtr = calloc<Int32>();
    final inputHstring = convertToHString(input);

    try {
      final hr =
          ptr.ref.vtable
                  .elementAt(6)
                  .cast<
                      Pointer<
                          NativeFunction<
                              HRESULT Function(
                                  Pointer,
                                  IntPtr input,
                                  Pointer<COMObject> phoneNumber,
                                  Pointer<Int32>)>>>()
                  .value
                  .asFunction<
                      int Function(Pointer, int input,
                          Pointer<COMObject> phoneNumber, Pointer<Int32>)>()(
              ptr.ref.lpVtbl, inputHstring, phoneNumber.ptr, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return PhoneNumberParseResult.from(retValuePtr.value);
    } finally {
      WindowsDeleteString(inputHstring);

      free(retValuePtr);
    }
  }

  PhoneNumberParseResult tryParseWithRegion(
      String input, String regionCode, PhoneNumberInfo phoneNumber) {
    final retValuePtr = calloc<Int32>();
    final inputHstring = convertToHString(input);
    final regionCodeHstring = convertToHString(regionCode);

    try {
      final hr =
          ptr.ref.vtable
                  .elementAt(7)
                  .cast<
                      Pointer<
                          NativeFunction<
                              HRESULT Function(
                                  Pointer,
                                  IntPtr input,
                                  IntPtr regionCode,
                                  Pointer<COMObject> phoneNumber,
                                  Pointer<Int32>)>>>()
                  .value
                  .asFunction<
                      int Function(Pointer, int input, int regionCode,
                          Pointer<COMObject> phoneNumber, Pointer<Int32>)>()(
              ptr.ref.lpVtbl,
              inputHstring,
              regionCodeHstring,
              phoneNumber.ptr,
              retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return PhoneNumberParseResult.from(retValuePtr.value);
    } finally {
      WindowsDeleteString(inputHstring);
      WindowsDeleteString(regionCodeHstring);

      free(retValuePtr);
    }
  }
}