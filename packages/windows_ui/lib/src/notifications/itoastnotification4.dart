// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart'
    hide DocumentProperties, WinRTStringConversion;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'notificationdata.dart';
import 'toastnotificationpriority.dart';

/// @nodoc
const IID_IToastNotification4 = '{15154935-28ea-4727-88e9-c58680e2d118}';

class IToastNotification4 extends IInspectable {
  IToastNotification4.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable.cast<_IToastNotification4Vtbl>().ref;

  final _IToastNotification4Vtbl _vtable;

  factory IToastNotification4.from(IInspectable interface) =>
      interface.cast(IToastNotification4.fromPtr, IID_IToastNotification4);

  NotificationData? get data {
    final value = calloc<COMObject>();

    final hr = _vtable.get_Data.asFunction<
        int Function(
            VTablePointer lpVtbl, Pointer<COMObject> value)>()(lpVtbl, value);

    if (FAILED(hr)) {
      free(value);
      throwWindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return NotificationData.fromPtr(value);
  }

  set data(NotificationData? value) {
    final hr = _vtable.put_Data.asFunction<
        int Function(
            VTablePointer lpVtbl, VTablePointer value)>()(lpVtbl, value.lpVtbl);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  ToastNotificationPriority get priority {
    final value = calloc<Int32>();

    try {
      final hr = _vtable.get_Priority.asFunction<
          int Function(
              VTablePointer lpVtbl, Pointer<Int32> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return ToastNotificationPriority.from(value.value);
    } finally {
      free(value);
    }
  }

  set priority(ToastNotificationPriority value) {
    final hr = _vtable.put_Priority
            .asFunction<int Function(VTablePointer lpVtbl, int value)>()(
        lpVtbl, value.value);

    if (FAILED(hr)) throwWindowsException(hr);
  }
}

final class _IToastNotification4Vtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<COMObject> value)>>
      get_Data;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, VTablePointer value)>>
      put_Data;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<Int32> value)>>
      get_Priority;
  external Pointer<
          NativeFunction<HRESULT Function(VTablePointer lpVtbl, Int32 value)>>
      put_Priority;
}
