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

import '../connectivity/connectionprofile.dart';
import '../connectivity/networkadapter.dart';
import 'networkoperatortetheringmanager.dart';

/// @nodoc
const IID_INetworkOperatorTetheringManagerStatics3 =
    '{8fdaadb6-4af9-4f21-9b58-d53e9f24231e}';

class INetworkOperatorTetheringManagerStatics3 extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  INetworkOperatorTetheringManagerStatics3.fromPtr(super.ptr);

  factory INetworkOperatorTetheringManagerStatics3.from(
          IInspectable interface) =>
      INetworkOperatorTetheringManagerStatics3.fromPtr(
          interface.toInterface(IID_INetworkOperatorTetheringManagerStatics3));

  NetworkOperatorTetheringManager? createFromConnectionProfileWithTargetAdapter(
      ConnectionProfile? profile, NetworkAdapter? adapter) {
    final ppManager = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer profile,
                            VTablePointer adapter,
                            Pointer<COMObject> ppManager)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer profile,
                    VTablePointer adapter, Pointer<COMObject> ppManager)>()(
        ptr.ref.lpVtbl,
        profile?.ptr.ref.lpVtbl ?? nullptr,
        adapter?.ptr.ref.lpVtbl ?? nullptr,
        ppManager);

    if (FAILED(hr)) {
      free(ppManager);
      throwWindowsException(hr);
    }

    if (ppManager.isNull) {
      free(ppManager);
      return null;
    }

    return NetworkOperatorTetheringManager.fromPtr(ppManager);
  }
}
