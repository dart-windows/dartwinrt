// networkitem.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'enums.g.dart';
import 'inetworkitem.dart';

/// Represents a connected network.
///
/// {@category Class}
/// {@category winrt}
class NetworkItem extends IInspectable implements INetworkItem {
  NetworkItem.fromRawPointer(super.ptr);

  // INetworkItem methods
  late final _iNetworkItem = INetworkItem.from(this);

  @override
  Guid get networkId => _iNetworkItem.networkId;

  @override
  NetworkTypes getNetworkTypes() => _iNetworkItem.getNetworkTypes();
}