// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:winmd/winmd.dart';

import '../extensions/extensions.dart';
import '../models/models.dart';
import '../utils.dart';
import 'interface.dart';
import 'parameter.dart';
import 'type.dart';
import 'types/types.dart';

/// A generic class representing an entry in a COM function vtable.
///
/// This is the base class for a range of WinRT-based objects, including
/// `GetterProjection`, `SetterProjection`.
/// All of these map down to an entry in a COM vtable representing a method.
///
/// Methods have names, a list of parameters, and may return a type.
abstract class MethodProjection {
  MethodProjection(this.method, this.vtableOffset)
      : name = uniquelyNameMethod(method),
        parameters = method.isGetProperty
            ? const []
            : method.parameters.map(ParameterProjection.create).toList(),
        returnTypeProjection = TypeProjection(method.returnType.typeIdentifier);

  /// The retrieved Windows metadata for the method or property.
  final Method method;

  /// Offset into the COM v-table that represents the method or property.
  final int vtableOffset;

  /// The name, incorporating any overloads that may be required.
  final String name;

  /// Projections for the parameters of the method.
  final List<ParameterProjection> parameters;

  /// Type projection of the return type.
  final TypeProjection returnTypeProjection;

  /// Returns the appropriate method projection for the [method] based on the
  /// return type.
  factory MethodProjection.create(Method method, int vtableOffset) {
    final projectionType =
        TypeProjection(method.returnType.typeIdentifier).projectionType;
    switch (projectionType) {
      case ProjectionType.asyncAction:
        return AsyncActionMethodProjection(method, vtableOffset);
      case ProjectionType.asyncActionWithProgress:
        return InspectableMethodProjection(method, vtableOffset);
      case ProjectionType.asyncOperation:
        return AsyncOperationMethodProjection(method, vtableOffset);
      case ProjectionType.asyncOperationWithProgress:
        return InspectableMethodProjection(method, vtableOffset);
      case ProjectionType.dartPrimitive:
        return DefaultMethodProjection(method, vtableOffset);
      case ProjectionType.dateTime:
        return DateTimeMethodProjection(method, vtableOffset);
      case ProjectionType.delegate:
        return DelegateMethodProjection(method, vtableOffset);
      case ProjectionType.duration:
        return DurationMethodProjection(method, vtableOffset);
      case ProjectionType.enum_:
        return EnumMethodProjection(method, vtableOffset);
      case ProjectionType.genericEnum:
        return GenericEnumMethodProjection(method, vtableOffset);
      case ProjectionType.genericInspectable:
        return GenericInspectableMethodProjection(method, vtableOffset);
      case ProjectionType.guid:
        return GuidMethodProjection(method, vtableOffset);
      case ProjectionType.inspectable:
        return InspectableMethodProjection(method, vtableOffset);
      case ProjectionType.map:
        return MapMethodProjection(method, vtableOffset);
      case ProjectionType.mapView:
        return MapViewMethodProjection(method, vtableOffset);
      case ProjectionType.object:
        return ObjectMethodProjection(method, vtableOffset);
      case ProjectionType.reference:
        return ReferenceMethodProjection(method, vtableOffset);
      case ProjectionType.string:
        return StringMethodProjection(method, vtableOffset);
      case ProjectionType.struct:
        return StructMethodProjection(method, vtableOffset);
      case ProjectionType.uri:
        return UriMethodProjection(method, vtableOffset);
      case ProjectionType.vector:
        return VectorMethodProjection(method, vtableOffset);
      case ProjectionType.vectorView:
        return VectorViewMethodProjection(method, vtableOffset);
      case ProjectionType.void_:
        return VoidMethodProjection(method, vtableOffset);
      default:
        throw UnsupportedError('Unsupported projection type: $projectionType');
    }
  }

  /// Attempts to create a [MethodProjection] from [fullyQualifiedType] and
  /// [methodName].
  ///
  /// ```dart
  /// final projection = MethodProjection.fromTypeAndMethodName(
  ///     'Windows.Globalization.Calendar', 'GetCalendarSystem');
  /// ```
  ///
  /// It does this by first creating an [InterfaceProjection] from the
  /// [fullyQualifiedType] and then searching the [MethodProjection] for the
  /// [methodName] in it.
  ///
  /// Throws an [Exception] if no [MethodProjection] matching [methodName] is
  /// found.
  factory MethodProjection.fromTypeAndMethodName(
      String fullyQualifiedType, String methodName) {
    final interfaceProjection = InterfaceProjection.from(fullyQualifiedType);
    final methodProjections = interfaceProjection.methodProjections
        .where((methodProjection) => methodProjection.name == methodName);
    if (methodProjections.isEmpty) throw Exception("Can't find $methodName");
    return methodProjections.first;
  }

  /// The method name without uppercased first letter.
  ///
  /// Windows Runtime methods and properties are typically named in TitleCase,
  /// but the Dart idiom is camelCase. This also has the significant advantage
  /// of making it easier to avoid name conflicts.
  String get camelCasedName => safeIdentifierForString(name.toCamelCase());

  /// The parameters, with the exception of some `__valueSize` parameters.
  Iterable<ParameterProjection> get _params {
    return parameters.where((param) {
      // Exclude the __valueSize parameter on FillArray and PassArray styles as
      // simpleArray params are projected as List.
      // See DefaultListParameterProjection class.
      if (param.parameter.name == '__valueSize') {
        if (param.parameter.isInParam ||
            (param.parameter.isOutParam &&
                param.parameter.typeIdentifier.baseType ==
                    BaseType.pointerTypeModifier)) {
          return false;
        }
      }

      return true;
    });
  }

  /// The parameters exposed by a projected Dart method (e.g. `int age`,
  /// `int index, String value`).
  String get methodParams =>
      _params.map((param) => param.paramProjection).join(', ');

  /// The return type of the method (e.g. `String`).
  String get returnType => returnTypeProjection.dartType;

  /// A shortened version of the method declaration for use in factory
  /// constructors, static methods, and method forwarders.
  ///   e.g. `void setDateTime(DateTime value)` or `void setToNow()` (method)
  ///   e.g. `int get period` or `int get second` (get property)
  ///   e.g. `set second(int value)` (set property)
  String get shortDeclaration => toString().split('{').first.trim();

  /// A shortened version of the method for use in factory constructors, static
  /// methods, and method forwarders.
  ///   e.g. `setDateTime(value)` or `setToNow()` (method)
  ///   e.g. `period` or `second` (get property)
  ///   e.g. `second = value` (set property)
  String get shortForm {
    final paramIdentifiers =
        _params.map((param) => param.identifier).join(', ');
    return '$camelCasedName($paramIdentifiers)';
  }

  String get parametersPreamble =>
      parameters.map((param) => param.preamble).join('\n');

  String get parametersPostamble =>
      parameters.map((param) => param.postamble).join('\n');

  // WinRT methods always return an HRESULT
  String get nativePrototype => 'HRESULT Function($nativeParams)';

  // WinRT properties always return an HRESULT
  String get dartPrototype => 'int Function($dartParams)';

  /// The names of the parameters to be passed through to the underlying WinRT
  /// function.
  String get identifiers => [
        'ptr.ref.lpVtbl',
        ...parameters.map((param) => param.localIdentifier),
        if (!returnTypeProjection.isVoid) 'retValuePtr',
      ].join(', ');

  String get nativeParams => [
        'LPVTBL',
        ...parameters.map((param) => param.ffiProjection),
        if (!returnTypeProjection.isVoid)
          returnTypeProjection.dartType == 'Pointer<COMObject>'
              ? 'Pointer<COMObject>'
              : 'Pointer<${returnTypeProjection.nativeType}>',
      ].join(', ');

  String get dartParams => [
        'LPVTBL',
        ...parameters.map((param) => param.dartProjection),
        if (!returnTypeProjection.isVoid)
          returnTypeProjection.dartType == 'Pointer<COMObject>'
              ? 'Pointer<COMObject>'
              : 'Pointer<${returnTypeProjection.nativeType}>',
      ].join(', ');

  String ffiCall({String params = '', bool freeRetValOnFailure = false}) {
    final identifiers =
        params.isNotEmpty ? 'ptr.ref.lpVtbl, $params' : this.identifiers;
    return [
      '''
    final hr = ptr.ref.vtable
      .elementAt($vtableOffset)
      .cast<Pointer<NativeFunction<$nativePrototype>>>()
      .value
      .asFunction<$dartPrototype>()($identifiers);
''',
      if (freeRetValOnFailure)
        'if (FAILED(hr)) { free(retValuePtr); throw WindowsException(hr); }'
      else
        'if (FAILED(hr)) throw WindowsException(hr);'
    ].join('\n');
  }

  /// The projection of the method.
  String get methodProjection;

  @override
  String toString() {
    try {
      return methodProjection;
    } on Exception {
      // Print an error if we're unable to project a method, but don't
      // completely bail out. The rest may be useful.
      print('Unable to project WinRT method: ${method.name}');
      return '';
    }
  }
}
