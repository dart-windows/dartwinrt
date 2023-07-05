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
import 'package:windows_system/windows_system.dart';

import 'notificationmirroring.dart';
import 'toastnotificationmanagerforuser.dart';

/// @nodoc
const IID_IToastNotificationManagerStatics4 =
    '{8f993fd3-e516-45fb-8130-398e93fa52c3}';

class IToastNotificationManagerStatics4 extends IInspectable {
  // vtable begins at 6, is 2 entries long.
  IToastNotificationManagerStatics4.fromPtr(super.ptr);

  factory IToastNotificationManagerStatics4.from(IInspectable interface) =>
      IToastNotificationManagerStatics4.fromPtr(
          interface.toInterface(IID_IToastNotificationManagerStatics4));

  ToastNotificationManagerForUser? getForUser(User? user) {
    final result = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, VTablePointer user,
                            Pointer<COMObject> result)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer user,
                    Pointer<COMObject> result)>()(
        ptr.ref.lpVtbl, user == null ? nullptr : user.ptr.ref.lpVtbl, result);

    if (FAILED(hr)) {
      free(result);
      throwWindowsException(hr);
    }

    if (result.isNull) {
      free(result);
      return null;
    }

    return ToastNotificationManagerForUser.fromPtr(result);
  }

  void configureNotificationMirroring(NotificationMirroring value) {
    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(VTablePointer lpVtbl, Int32 value)>>>()
            .value
            .asFunction<int Function(VTablePointer lpVtbl, int value)>()(
        ptr.ref.lpVtbl, value.value);

    if (FAILED(hr)) throwWindowsException(hr);
  }
}
