// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../winrt_get_property.dart';
import '../winrt_method.dart';
import '../winrt_parameter.dart';
import '../winrt_set_property.dart';

class WinRTMethodReturningEnumProjection extends WinRTMethodProjection {
  WinRTMethodReturningEnumProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      ${returnType.methodParamType} $camelCasedName($methodParams) {
        final retValuePtr = calloc<${returnType.nativeType}>();
        $parametersPreamble

        try {
          ${ffiCall()}

          return ${returnType.methodParamType}.from(retValuePtr.value);
        } finally {
          $parametersPostamble
          free(retValuePtr);
        }
      }
  ''';
}

class WinRTGetPropertyReturningEnumProjection
    extends WinRTGetPropertyProjection {
  WinRTGetPropertyReturningEnumProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      ${returnType.methodParamType} get $exposedMethodName {
        final retValuePtr = calloc<${returnType.nativeType}>();

        try {
          ${ffiCall()}

          return ${returnType.methodParamType}.from(retValuePtr.value);
        } finally {
          free(retValuePtr);
        }
      }
  ''';
}

class WinRTSetPropertyReturningEnumProjection
    extends WinRTSetPropertyProjection {
  WinRTSetPropertyReturningEnumProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      set $exposedMethodName(${parameters.first.type.methodParamType} value) {
        ${ffiCall(params: 'value.value')}
      }
  ''';
}

class WinRTEnumParameterProjection extends WinRTParameterProjection {
  WinRTEnumParameterProjection(super.method, super.name, super.type);

  @override
  String get preamble => '';

  @override
  String get postamble => '';

  @override
  String get localIdentifier => '$identifier.value';
}
