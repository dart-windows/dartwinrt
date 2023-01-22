// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
// import 'package:windows_data/windows_data.dart';
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'enums.g.dart';
import 'itoastnotification.dart';
import 'itoastnotification2.dart';
import 'itoastnotification3.dart';
import 'itoastnotification4.dart';
import 'itoastnotification6.dart';
import 'itoastnotificationfactory.dart';
import 'notificationdata.dart';

/// Defines the content, associated metadata and events, and expiration time
/// of a toast notification.
///
/// {@category class}
class ToastNotification extends IInspectable
    implements
        IToastNotification,
        IToastNotification2,
        IToastNotification3,
        IToastNotification4,
        IToastNotification6 {
  ToastNotification.fromRawPointer(super.ptr);

  // static const _className = 'Windows.UI.Notifications.ToastNotification';

  // IToastNotificationFactory methods
  // static ToastNotification createToastNotification(XmlDocument content) {
  //   final activationFactoryPtr =
  //       createActivationFactory(_className, IID_IToastNotificationFactory);
  //   final object =
  //       IToastNotificationFactory.fromRawPointer(activationFactoryPtr);

  //   try {
  //     return object.createToastNotification(content);
  //   } finally {
  //     object.release();
  //   }
  // }

  // IToastNotification methods
  late final _iToastNotification = IToastNotification.from(this);

  // @override
  // XmlDocument? get content => _iToastNotification.content;

  @override
  set expirationTime(DateTime? value) =>
      _iToastNotification.expirationTime = value;

  @override
  DateTime? get expirationTime => _iToastNotification.expirationTime;

  @override
  int add_Dismissed(Pointer<NativeFunction<TypedEventHandler>> handler) =>
      _iToastNotification.add_Dismissed(handler);

  @override
  void remove_Dismissed(int token) =>
      _iToastNotification.remove_Dismissed(token);

  @override
  int add_Activated(Pointer<NativeFunction<TypedEventHandler>> handler) =>
      _iToastNotification.add_Activated(handler);

  @override
  void remove_Activated(int token) =>
      _iToastNotification.remove_Activated(token);

  @override
  int add_Failed(Pointer<NativeFunction<TypedEventHandler>> handler) =>
      _iToastNotification.add_Failed(handler);

  @override
  void remove_Failed(int token) => _iToastNotification.remove_Failed(token);

  // IToastNotification2 methods
  late final _iToastNotification2 = IToastNotification2.from(this);

  @override
  set tag(String value) => _iToastNotification2.tag = value;

  @override
  String get tag => _iToastNotification2.tag;

  @override
  set group(String value) => _iToastNotification2.group = value;

  @override
  String get group => _iToastNotification2.group;

  @override
  set suppressPopup(bool value) => _iToastNotification2.suppressPopup = value;

  @override
  bool get suppressPopup => _iToastNotification2.suppressPopup;

  // IToastNotification3 methods
  late final _iToastNotification3 = IToastNotification3.from(this);

  @override
  NotificationMirroring get notificationMirroring =>
      _iToastNotification3.notificationMirroring;

  @override
  set notificationMirroring(NotificationMirroring value) =>
      _iToastNotification3.notificationMirroring = value;

  @override
  String get remoteId => _iToastNotification3.remoteId;

  @override
  set remoteId(String value) => _iToastNotification3.remoteId = value;

  // IToastNotification4 methods
  late final _iToastNotification4 = IToastNotification4.from(this);

  @override
  NotificationData? get data => _iToastNotification4.data;

  @override
  set data(NotificationData? value) => _iToastNotification4.data = value;

  @override
  ToastNotificationPriority get priority => _iToastNotification4.priority;

  @override
  set priority(ToastNotificationPriority value) =>
      _iToastNotification4.priority = value;

  // IToastNotification6 methods
  late final _iToastNotification6 = IToastNotification6.from(this);

  @override
  bool get expiresOnReboot => _iToastNotification6.expiresOnReboot;

  @override
  set expiresOnReboot(bool value) =>
      _iToastNotification6.expiresOnReboot = value;
}
