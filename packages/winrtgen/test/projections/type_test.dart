// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@TestOn('windows')

import 'package:test/test.dart';
import 'package:win32/win32.dart';
import 'package:winrtgen/winrtgen.dart';

void main() {
  if (!isWindowsRuntimeAvailable()) {
    print('Skipping tests because Windows Runtime is not available.');
    return;
  }

  group('Windows.Foundation.', () {
    test('DateTime types are projected correctly', () {
      final methodProjection = MethodProjection.fromTypeAndMethodName(
          'Windows.Globalization.ICalendar', 'GetDateTime');
      final typeProjection = methodProjection.returnType;
      expect(typeProjection.dartType, equals('int'));
      expect(typeProjection.nativeType, equals('Uint64'));
      expect(typeProjection.exposedType, equals('DateTime'));
    });

    test('EventRegistrationToken types are projected correctly', () {
      final methodProjection = MethodProjection.fromTypeAndMethodName(
          'Windows.UI.Notifications.IToastNotification', 'remove_Dismissed');
      final typeProjection = methodProjection.parameters.first.type;
      expect(typeProjection.dartType, equals('int'));
      expect(typeProjection.nativeType, equals('IntPtr'));
      expect(typeProjection.exposedType, equals('int'));
    });

    test('HResult types are projected correctly', () {
      final methodProjection = MethodProjection.fromTypeAndMethodName(
          'Windows.Foundation.IAsyncInfo', 'get_ErrorCode');
      final typeProjection = methodProjection.returnType;
      expect(typeProjection.dartType, equals('int'));
      expect(typeProjection.nativeType, equals('Int32'));
      expect(typeProjection.exposedType, equals('int'));
    });

    test('TimeSpan types are projected correctly', () {
      final methodProjection = MethodProjection.fromTypeAndMethodName(
          'Windows.Foundation.IPropertyValue', 'GetTimeSpan');
      final typeProjection = methodProjection.returnType;
      expect(typeProjection.dartType, equals('int'));
      expect(typeProjection.nativeType, equals('Uint64'));
      expect(typeProjection.exposedType, equals('Duration'));
    });
  });

  test('Delegate types are projected correctly', () {
    final methodProjection = MethodProjection.fromTypeAndMethodName(
        'Windows.UI.Notifications.IToastNotification', 'add_Activated');
    final typeProjection = methodProjection.parameters.first.type;
    // TypedEventHandler<ToastNotification, object>
    expect(typeProjection.dartType,
        equals('Pointer<NativeFunction<TypedEventHandler>>'));
    expect(typeProjection.nativeType,
        equals('Pointer<NativeFunction<TypedEventHandler>>'));
    expect(typeProjection.exposedType,
        equals('Pointer<NativeFunction<TypedEventHandler>>'));
  });

  test('Simple array types are projected correctly', () {
    final methodProjection = MethodProjection.fromTypeAndMethodName(
        'Windows.Foundation.IPropertyValueStatics', 'CreateUInt8Array');
    expect(methodProjection.parameters.length, equals(2));

    final valueSizeParam = methodProjection.parameters.first;
    expect(valueSizeParam.name, equals('__valueSize'));
    final valueSizeParamProjection = valueSizeParam.type;
    expect(valueSizeParamProjection.dartType, equals('int'));
    expect(valueSizeParamProjection.nativeType, equals('Uint32'));

    final valueParam = methodProjection.parameters.last;
    expect(valueParam.name, equals('value'));
    final valueParamProjection = valueParam.type;
    expect(valueParamProjection.dartType, equals('Pointer<Uint8>'));
    expect(valueParamProjection.nativeType, equals('Pointer<Uint8>'));
  });

  test('Reference simple array COMObject types are projected correctly', () {
    // virtual HRESULT STDMETHODCALLTYPE GetInspectableArray(
    //   UINT32* valueLength,
    //   IInspectable*** value
    // )
    final methodProjection = MethodProjection.fromTypeAndMethodName(
        'Windows.Foundation.IPropertyValue', 'GetInspectableArray');
    expect(methodProjection.parameters.length, equals(2));

    final valueSizeParam = methodProjection.parameters.first;
    expect(valueSizeParam.name, equals('__valueSize'));
    final valueSizeParamProjection = valueSizeParam.type;
    expect(valueSizeParamProjection.dartType, equals('Pointer<Uint32>'));
    expect(valueSizeParamProjection.nativeType, equals('Pointer<Uint32>'));

    final valueParam = methodProjection.parameters.last;
    expect(valueParam.name, equals('value'));
    final valueParamProjection = valueParam.type;
    expect(
        valueParamProjection.dartType, equals('Pointer<Pointer<COMObject>>'));
    expect(
        valueParamProjection.nativeType, equals('Pointer<Pointer<COMObject>>'));
  });

  test('Reference simple array int types are projected correctly', () {
    // virtual HRESULT STDMETHODCALLTYPE GetUInt8Array(
    //   UINT32* valueLength,
    //   BYTE** value
    // )
    final methodProjection = MethodProjection.fromTypeAndMethodName(
        'Windows.Foundation.IPropertyValue', 'GetUInt8Array');
    expect(methodProjection.parameters.length, equals(2));

    final valueSizeParam = methodProjection.parameters.first;
    expect(valueSizeParam.name, equals('__valueSize'));
    final valueSizeParamProjection = valueSizeParam.type;
    expect(valueSizeParamProjection.dartType, equals('Pointer<Uint32>'));
    expect(valueSizeParamProjection.nativeType, equals('Pointer<Uint32>'));

    final valueParam = methodProjection.parameters.last;
    expect(valueParam.name, equals('value'));
    final valueParamProjection = valueParam.type;
    expect(valueParamProjection.dartType, equals('Pointer<Pointer<Uint8>>'));
    expect(valueParamProjection.nativeType, equals('Pointer<Pointer<Uint8>>'));
  });
}
