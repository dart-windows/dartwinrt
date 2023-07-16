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

import 'frameflashcapabilities.dart';

/// @nodoc
const IID_IFrameControlCapabilities2 = '{ce9b0464-4730-440f-bd3e-efe8a8f230a8}';

class IFrameControlCapabilities2 extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IFrameControlCapabilities2.fromPtr(super.ptr);

  factory IFrameControlCapabilities2.from(IInspectable interface) =>
      IFrameControlCapabilities2.fromPtr(
          interface.toInterface(IID_IFrameControlCapabilities2));

  FrameFlashCapabilities? get flash {
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

    return FrameFlashCapabilities.fromPtr(value);
  }
}