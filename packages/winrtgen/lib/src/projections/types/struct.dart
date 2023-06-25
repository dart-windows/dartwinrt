// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import '../../utilities/utilities.dart';
import '../getter.dart';
import '../method.dart';
import '../parameter.dart';
import '../setter.dart';
import 'default.dart';

mixin _StructMixin on MethodProjection {
  @override
  String get returnType => returnTypeProjection.typeIdentifier.shortName;

  @override
  String get methodDeclaration => '''
  $methodHeader {
    final retValuePtr = calloc<${returnTypeProjection.nativeType}>();

    try {
      ${ffiCall()}

      return retValuePtr.toDart();
    } finally {
      free(retValuePtr);
    }
  }
''';
}

/// Method projection for methods that return WinRT struct (e.g. `Point`).
final class StructMethodProjection extends MethodProjection with _StructMixin {
  StructMethodProjection(super.method, super.vtableOffset);
}

/// Getter projection for WinRT struct getters.
final class StructGetterProjection extends GetterProjection with _StructMixin {
  StructGetterProjection(super.method, super.vtableOffset);
}

/// Method projection for methods that return `List<T extends WinRTStruct>`.
final class StructListMethodProjection extends DefaultListMethodProjection {
  StructListMethodProjection(super.method, super.vtableOffset);

  @override
  String get returnType => 'List<$typeArgShortName>';
}

/// Getter projection for `List<T extends WinRTStruct>` getters.
final class StructListGetterProjection extends DefaultListGetterProjection {
  StructListGetterProjection(super.method, super.vtableOffset);

  @override
  String get returnType => 'List<$typeArgShortName>';
}

/// Setter projection for WinRT struct setters.
final class StructSetterProjection extends SetterProjection {
  StructSetterProjection(super.method, super.vtableOffset);

  String get dartType => param.typeProjection.typeIdentifier.shortName;

  @override
  String get methodDeclaration => '''
  $methodHeader {
    final nativeStructPtr = value.toNative();

    try {
      ${ffiCall(identifier: 'nativeStructPtr.ref')}
    } finally {
      free(nativeStructPtr);
    }
  }
''';
}

/// Parameter projection for WinRT struct parameters.
final class StructParameterProjection extends ParameterProjection {
  StructParameterProjection(super.parameter);

  @override
  String get type => typeProjection.typeIdentifier.shortName;

  @override
  String get preamble =>
      'final ${name}NativeStructPtr = $identifier.toNative();';

  @override
  String get postamble => 'free(${name}NativeStructPtr);';

  @override
  String get localIdentifier => '${name}NativeStructPtr.ref';
}

/// Parameter projection for `List<T extends WinRTStruct>` parameters.
final class StructListParameterProjection
    extends DefaultListParameterProjection {
  StructListParameterProjection(super.parameter);

  String get nativeStructName => typeArgProjection.nativeType;

  @override
  String get type => 'List<$typeArgShortName>';

  @override
  String get passArrayPreamble => '''
    final nativeStructPtrs = <Pointer<$nativeStructName>>[];
    final $localIdentifier = calloc<$nativeStructName>($paramName.length);
    for (var i = 0; i < $paramName.length; i++) {
      final nativeStructPtr = $paramName.elementAt(i).toNative();
      $localIdentifier[i] = nativeStructPtr.ref;
      nativeStructPtrs.add(nativeStructPtr);
    }''';

  @override
  String get passArrayPostamble => '''
    nativeStructPtrs.forEach(free);
    free($localIdentifier);''';
}
