// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../utils.dart';
import '../type.dart';
import '../winrt_method.dart';

/// Method projection for methods that return an `IAsyncAction`.
class WinRTAsyncActionMethodProjection extends WinRTMethodProjection {
  WinRTAsyncActionMethodProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  Future<void> $camelCasedName($methodParams) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<void>();
    $parametersPreamble

    ${ffiCall(freeRetValOnFailure: true)}

    $parametersPostamble

    final asyncAction = IAsyncAction.fromRawPointer(retValuePtr);
    completeAsyncAction(asyncAction, completer);

    return completer.future;
  }
''';
}

mixin _AsyncOperationProjection on WinRTMethodProjection {
  /// The type argument of `IAsyncOperation`, as represented in the
  /// [returnType]'s [TypeIdentifier] (e.g. `bool`, `String`, `StorageFile?`).
  String get asyncOperationTypeArg =>
      typeArguments(returnType.typeIdentifier.name);

  String get futureTypeArg {
    if (asyncOperationTypeArg.startsWith('IMapView')) {
      // e.g. return Map<String, String> instead of IMapView<String, String>
      return asyncOperationTypeArg.replaceFirst('IMapView', 'Map');
    } else if (asyncOperationTypeArg.startsWith('IVectorView')) {
      // e.g. return List<String> instead of IVectorView<String>
      return asyncOperationTypeArg.replaceFirst('IVectorView', 'List');
    } else if (asyncOperationTypeArg.startsWith('IReference')) {
      // e.g. return Duration? instead of IReference<Duration>?
      return nullable(typeArguments(asyncOperationTypeArg));
    }

    return asyncOperationTypeArg;
  }

  /// The constructor arguments passed to the constructor of `IAsyncOperation`.
  String get asyncOperationConstructorArgs {
    final typeProjection = TypeProjection(returnType.typeIdentifier.typeArg!);

    // If the type argument is an enum or a WinRT Object (e.g. StorageFile), the
    // constructor of that class must be passed in the 'enumCreator' parameter
    // for enums, 'creator' parameter for WinRT Objects so that the
    // IAsyncOperation implementation can instantiate the object.
    final creator =
        parseArgumentForCreatorParameter(returnType.typeIdentifier.typeArg!);

    // If the type argument is an enum or int, its native type (e.g. Int32,
    // Uint32) must be passed in the 'intType' parameter so that the
    // 'IAsyncOperation' implementations can use the appropriate native type
    final intType = typeProjection.isEnum || asyncOperationTypeArg == 'int'
        ? typeProjection.nativeType
        : null;

    final args = <String>[];
    if (typeProjection.isEnum) {
      args.add('enumCreator: $creator');
    } else if (creator != null) {
      args.add('creator: $creator');
    }
    if (intType != null) {
      args.add('intType: $intType');
    }

    return args.isEmpty ? '' : ', ${args.join(', ')}';
  }

  /// The function to call when completing the completer after the asynchronous
  /// operation has successfully completed.
  String get onCompletedCallback {
    if (asyncOperationTypeArg.startsWith('IMapView')) {
      return '() => asyncOperation.getResults().toMap()';
    } else if (asyncOperationTypeArg.startsWith('IVectorView')) {
      return '() => asyncOperation.getResults().toList()';
    } else if (asyncOperationTypeArg.startsWith('IReference')) {
      return '() => asyncOperation.getResults()?.value';
    }

    return 'asyncOperation.getResults';
  }
}

/// Method projection for methods that return `IAsyncOperation<TResult>`.
class WinRTAsyncOperationMethodProjection extends WinRTMethodProjection
    with _AsyncOperationProjection {
  WinRTAsyncOperationMethodProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  Future<$futureTypeArg> $camelCasedName($methodParams) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<$futureTypeArg>();
    $parametersPreamble

    ${ffiCall(freeRetValOnFailure: true)}

    $parametersPostamble

    final asyncOperation = IAsyncOperation<$asyncOperationTypeArg>
            .fromRawPointer(retValuePtr$asyncOperationConstructorArgs);
    completeAsyncOperation(asyncOperation, completer, $onCompletedCallback);

    return completer.future;
  }
''';
}
