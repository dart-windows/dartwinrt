import 'declarations/comobject.dart';
import 'declarations/datetime.dart';
import 'declarations/default.dart';
import 'declarations/duration.dart';
import 'declarations/enum.dart';
import 'declarations/guid.dart';
import 'declarations/reference.dart';
import 'declarations/string.dart';
import 'declarations/uri.dart';
import 'winrt_property.dart';

class WinRTSetPropertyProjection extends WinRTPropertyProjection {
  WinRTSetPropertyProjection(super.method, super.vtableOffset);

  // WinRTPropertyProjection overrides

  @override
  String get nativeParams => 'Pointer, ${parameters.first.type.nativeType}';

  @override
  String get dartParams => 'Pointer, ${parameters.first.type.dartType}';

  // MethodProjection override

  @override
  String get shortForm => '$exposedMethodName = value';

  @override
  String ffiCall({String params = '', bool freeRetValOnFailure = false}) => '''
    final hr = ptr.ref.vtable
      .elementAt($vtableOffset)
      .cast<Pointer<NativeFunction<$nativePrototype>>>()
      .value
      .asFunction<$dartPrototype>()(ptr.ref.lpVtbl, $params);

    if (FAILED(hr)) throw WindowsException(hr);
  ''';

  // Matcher properties

  bool get isComObjectProperty =>
      parameters.first.type.dartType == 'Pointer<COMObject>';

  bool get isGuidProperty =>
      parameters.first.type.typeIdentifier.name == 'System.Guid';

  bool get isStringProperty => parameters.first.type.isString;

  bool get isDateTimeProperty =>
      parameters.first.type.typeIdentifier.name ==
      'Windows.Foundation.DateTime';

  bool get isReferenceProperty =>
      parameters.first.type.typeIdentifier.type?.name
          .endsWith('IReference`1') ??
      false;

  bool get isTimeSpanProperty =>
      parameters.first.type.typeIdentifier.name ==
      'Windows.Foundation.TimeSpan';

  bool get isEnumProperty => parameters.first.type.isWinRTEnum;

  bool get isUriProperty =>
      parameters.first.type.typeIdentifier.name == 'Windows.Foundation.Uri';

  @override
  String toString() {
    try {
      // TODO: declarationFor(WinRTSetPropertyReturningMapProjection.new)
      // TODO: declarationFor(WinRTSetPropertyReturningMapViewProjection.new)
      // TODO: declarationFor(WinRTSetPropertyReturningVectorProjection.new)
      // TODO: declarationFor(WinRTSetPropertyReturningVectorViewProjection.new)

      if (isEnumProperty) {
        return declarationFor(WinRTSetPropertyReturningEnumProjection.new);
      }

      if (isGuidProperty) {
        return declarationFor(WinRTSetPropertyReturningGuidProjection.new);
      }

      if (isReferenceProperty) {
        return declarationFor(WinRTSetPropertyReturningReferenceProjection.new);
      }

      if (isUriProperty) {
        return declarationFor(WinRTSetPropertyReturningUriProjection.new);
      }

      if (isComObjectProperty) {
        return declarationFor(WinRTSetPropertyReturningComObjectProjection.new);
      }

      if (isStringProperty) {
        return declarationFor(WinRTSetPropertyReturningStringProjection.new);
      }

      if (isDateTimeProperty) {
        return declarationFor(WinRTSetPropertyReturningDateTimeProjection.new);
      }

      if (isTimeSpanProperty) {
        return declarationFor(WinRTSetPropertyReturningDurationProjection.new);
      }

      return declarationFor(WinRTSetPropertyReturningDefaultProjection.new);
    } on Exception {
      // Print an error if we're unable to project a method, but don't
      // completely bail out. The rest may be useful.

      // TODO: Fix these errors as they occur.
      print('Unable to project set property: ${method.name}');
      return '';
    }
  }
}
