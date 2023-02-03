// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../getter.dart';
import '../method.dart';
import '../setter.dart';

/// Method projection for methods that return a WinRT struct (e.g. `Point`).
class StructMethodProjection extends MethodProjection {
  StructMethodProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  ${returnType.dartType} $camelCasedName($methodParams) {
    final retValuePtr = calloc<${returnType.nativeType}>();
    $parametersPreamble

    ${ffiCall()}

    return retValuePtr.ref;
  }
''';
}

/// Getter projection for WinRT struct getters.
class StructGetterProjection extends GetterProjection {
  StructGetterProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  ${returnType.dartType} get $camelCasedName {
    final retValuePtr = calloc<${returnType.nativeType}>();

    ${ffiCall()}

    return retValuePtr.ref;
  }
''';
}

/// Setter projection for WinRT struct setters.
class StructSetterProjection extends SetterProjection {
  StructSetterProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  set $camelCasedName(${parameters.first.type.dartType} value) {
    ${ffiCall(params: 'value')}
  }
''';
}
