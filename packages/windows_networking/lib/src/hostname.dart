// hostname.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'connectivity/ipinformation.dart';
import 'enums.g.dart';
import 'ihostname.dart';
import 'ihostnamefactory.dart';
import 'ihostnamestatics.dart';

/// Provides data for a hostname or an IP address.
///
/// {@category Class}
/// {@category winrt}
class HostName extends IInspectable implements IHostName, IStringable {
  HostName.fromRawPointer(super.ptr);

  static const _className = 'Windows.Networking.HostName';

  // IHostNameFactory methods
  static HostName createHostName(String hostName) {
    final activationFactoryPtr =
        CreateActivationFactory(_className, IID_IHostNameFactory);
    final object = IHostNameFactory.fromRawPointer(activationFactoryPtr);

    try {
      return object.createHostName(hostName);
    } finally {
      object.release();
    }
  }

  // IHostNameStatics methods
  static int compare(String value1, String value2) {
    final activationFactoryPtr =
        CreateActivationFactory(_className, IID_IHostNameStatics);
    final object = IHostNameStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.compare(value1, value2);
    } finally {
      object.release();
    }
  }

  // IHostName methods
  late final _iHostName = IHostName.from(this);

  @override
  IPInformation? get ipInformation => _iHostName.ipInformation;

  @override
  String get rawName => _iHostName.rawName;

  @override
  String get displayName => _iHostName.displayName;

  @override
  String get canonicalName => _iHostName.canonicalName;

  @override
  HostNameType get type => _iHostName.type;

  @override
  bool isEqual(HostName? hostName) => _iHostName.isEqual(hostName);

  // IStringable methods
  late final _iStringable = IStringable.from(this);

  @override
  String toString() => _iStringable.toString();
}