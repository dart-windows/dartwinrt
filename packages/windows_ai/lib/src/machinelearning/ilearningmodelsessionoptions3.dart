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
const IID_ILearningModelSessionOptions3 =
    '{58e15cee-d8c2-56fc-92e8-76d751081086}';

class ILearningModelSessionOptions3 extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  ILearningModelSessionOptions3.fromPtr(super.ptr);

  factory ILearningModelSessionOptions3.from(IInspectable interface) =>
      ILearningModelSessionOptions3.fromPtr(
          interface.toInterface(IID_ILearningModelSessionOptions3));

  void overrideNamedDimension(String name, int dimension) {
    final nameHString = name.toHString();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, IntPtr name,
                            Uint32 dimension)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, int name, int dimension)>()(
        ptr.ref.lpVtbl, nameHString, dimension);

    WindowsDeleteString(nameHString);

    if (FAILED(hr)) throw WindowsException(hr);
  }
}