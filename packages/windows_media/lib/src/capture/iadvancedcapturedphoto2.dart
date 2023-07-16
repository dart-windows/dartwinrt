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

/// @nodoc
const IID_IAdvancedCapturedPhoto2 = '{18cf6cd8-cffe-42d8-8104-017bb318f4a1}';

class IAdvancedCapturedPhoto2 extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IAdvancedCapturedPhoto2.fromPtr(super.ptr);

  factory IAdvancedCapturedPhoto2.from(IInspectable interface) =>
      IAdvancedCapturedPhoto2.fromPtr(
          interface.toInterface(IID_IAdvancedCapturedPhoto2));

  Rect? get frameBoundsRelativeToReferencePhoto {
    final value = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl, Pointer<COMObject> value)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, Pointer<COMObject> value)>()(
        ptr.ref.lpVtbl, value);

    if (FAILED(hr)) {
      free(value);
      throwWindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return IReference<Rect?>.fromPtr(value,
            referenceIid: '{80423f11-054f-5eac-afd3-63b6ce15e77b}')
        .value;
  }
}