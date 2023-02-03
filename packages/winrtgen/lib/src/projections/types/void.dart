// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../method.dart';

/// Method projection for `void` methods.
class VoidMethodProjection extends MethodProjection {
  VoidMethodProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  void $camelCasedName($methodParams) {
    $parametersPreamble

    ${ffiCall()}

    $parametersPostamble
  }
''';
}
