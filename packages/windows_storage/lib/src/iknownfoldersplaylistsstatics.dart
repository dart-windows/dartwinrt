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

import 'storagefolder.dart';

/// @nodoc
const IID_IKnownFoldersPlaylistsStatics =
    '{dad5ecd6-306f-4d6a-b496-46ba8eb106ce}';

class IKnownFoldersPlaylistsStatics extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IKnownFoldersPlaylistsStatics.fromPtr(super.ptr);

  factory IKnownFoldersPlaylistsStatics.from(IInspectable interface) =>
      IKnownFoldersPlaylistsStatics.fromPtr(
          interface.toInterface(IID_IKnownFoldersPlaylistsStatics));

  StorageFolder? get playlists {
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
      throw WindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return StorageFolder.fromPtr(value);
  }
}
