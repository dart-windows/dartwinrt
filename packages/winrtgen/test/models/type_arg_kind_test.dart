// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('windows')

import 'package:test/test.dart';
import 'package:win32/win32.dart';
import 'package:winmd/winmd.dart';
import 'package:winrtgen/winrtgen.dart';

void main() {
  if (!isWindowsRuntimeAvailable()) {
    print('Skipping tests because Windows Runtime is not available.');
    return;
  }

  group('TypeArgKind.from constructor', () {
    test('throws an ArgumentError if invalid name is given', () {
      expect(() => TypeArgKind.from('foo'), throwsArgumentError);
    });

    test('returns the appropriate TypeArgKind (1)', () {
      expect(TypeArgKind.from('bool'), equals(TypeArgKind.bool_));
    });

    test('returns the appropriate TypeArgKind (2)', () {
      expect(TypeArgKind.from('bool?'), equals(TypeArgKind.nullableBool));
    });

    test('returns the appropriate TypeArgKind (3)', () {
      expect(TypeArgKind.from('Inspectable'), equals(TypeArgKind.inspectable));
    });

    test('returns the appropriate TypeArgKind (4)', () {
      expect(TypeArgKind.from('Inspectable?'),
          equals(TypeArgKind.nullableInspectable));
    });

    test('returns the appropriate TypeArgKind (5)', () {
      expect(TypeArgKind.from('WinRTEnum'), equals(TypeArgKind.winrtEnum));
    });

    test('returns the appropriate TypeArgKind (6)', () {
      expect(TypeArgKind.from('WinRTFlagsEnum'),
          equals(TypeArgKind.winrtFlagsEnum));
    });
  });

  group('isEnum', () {
    test('returns true for TypeArgKind.winrtEnum', () {
      expect(TypeArgKind.winrtEnum.isEnum, isTrue);
    });

    test('returns true for TypeArgKind.winrtFlagsEnum', () {
      expect(TypeArgKind.winrtEnum.isEnum, isTrue);
    });
  });

  group('isInt', () {
    test('returns true for TypeArgKind.int16', () {
      expect(TypeArgKind.int16.isInt, isTrue);
    });

    test('returns true for TypeArgKind.int32', () {
      expect(TypeArgKind.int32.isInt, isTrue);
    });

    test('returns false for TypeArgKind.int64', () {
      expect(TypeArgKind.int64.isInt, isTrue);
    });

    test('returns true for TypeArgKind.uint8', () {
      expect(TypeArgKind.uint16.isInt, isTrue);
    });

    test('returns true for TypeArgKind.uint16', () {
      expect(TypeArgKind.uint16.isInt, isTrue);
    });

    test('returns true for TypeArgKind.uint32', () {
      expect(TypeArgKind.uint32.isInt, isTrue);
    });

    test('returns false for TypeArgKind.uint64', () {
      expect(TypeArgKind.uint64.isInt, isTrue);
    });
  });

  group('isInspectable', () {
    test('returns true for TypeArgKind.inspectable', () {
      expect(TypeArgKind.inspectable.isInspectable, isTrue);
    });

    test('returns true for TypeArgKind.nullableInspectable', () {
      expect(TypeArgKind.nullableInspectable.isInspectable, isTrue);
    });
  });

  group('typeIdentifier', () {
    test('throws WinRTGenException for TypeArgKind.inspectable', () {
      expect(() => TypeArgKind.inspectable.typeIdentifier,
          throwsA(isA<WinRTGenException>()));
    });

    test('throws WinRTGenException for TypeArgKind.nullableInspectable', () {
      expect(() => TypeArgKind.nullableInspectable.typeIdentifier,
          throwsA(isA<WinRTGenException>()));
    });

    test('throws WinRTGenException for TypeArgKind.winrtEnum', () {
      expect(() => TypeArgKind.winrtEnum.typeIdentifier,
          throwsA(isA<WinRTGenException>()));
    });

    test('throws WinRTGenException for TypeArgKind.winrtFlagsEnum', () {
      expect(() => TypeArgKind.winrtFlagsEnum.typeIdentifier,
          throwsA(isA<WinRTGenException>()));
    });

    test('returns correct TypeIdentifier for TypeArgKind.bool', () {
      expect(TypeArgKind.bool_.typeIdentifier.baseType,
          equals(BaseType.booleanType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableBool', () {
      expect(TypeArgKind.nullableBool.typeIdentifier.baseType,
          equals(BaseType.booleanType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.dateTime', () {
      expect(TypeArgKind.dateTime.typeIdentifier.name,
          equals('Windows.Foundation.DateTime'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableDateTime', () {
      expect(TypeArgKind.nullableDateTime.typeIdentifier.name,
          equals('Windows.Foundation.DateTime'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.double', () {
      expect(TypeArgKind.double.typeIdentifier.baseType,
          equals(BaseType.doubleType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableDouble', () {
      expect(TypeArgKind.nullableDouble.typeIdentifier.baseType,
          equals(BaseType.doubleType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.duration', () {
      expect(TypeArgKind.duration.typeIdentifier.name,
          equals('Windows.Foundation.TimeSpan'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableDuration', () {
      expect(TypeArgKind.nullableDuration.typeIdentifier.name,
          equals('Windows.Foundation.TimeSpan'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.float', () {
      expect(TypeArgKind.float.typeIdentifier.baseType,
          equals(BaseType.floatType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableFloat', () {
      expect(TypeArgKind.nullableFloat.typeIdentifier.baseType,
          equals(BaseType.floatType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.guid', () {
      expect(TypeArgKind.guid.typeIdentifier.name, equals('System.Guid'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableGuid', () {
      expect(
          TypeArgKind.nullableGuid.typeIdentifier.name, equals('System.Guid'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.int16', () {
      expect(TypeArgKind.int16.typeIdentifier.baseType,
          equals(BaseType.int16Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableInt16', () {
      expect(TypeArgKind.nullableInt16.typeIdentifier.baseType,
          equals(BaseType.int16Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.int32', () {
      expect(TypeArgKind.int32.typeIdentifier.baseType,
          equals(BaseType.int32Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableInt32', () {
      expect(TypeArgKind.nullableInt32.typeIdentifier.baseType,
          equals(BaseType.int32Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.int64', () {
      expect(TypeArgKind.int64.typeIdentifier.baseType,
          equals(BaseType.int64Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableInt64', () {
      expect(TypeArgKind.nullableInt64.typeIdentifier.baseType,
          equals(BaseType.int64Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.object', () {
      expect(TypeArgKind.object.typeIdentifier.baseType,
          equals(BaseType.objectType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableObject', () {
      expect(TypeArgKind.nullableObject.typeIdentifier.baseType,
          equals(BaseType.objectType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.point', () {
      expect(TypeArgKind.point.typeIdentifier.name,
          equals('Windows.Foundation.Point'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullablePoint', () {
      expect(TypeArgKind.nullablePoint.typeIdentifier.name,
          equals('Windows.Foundation.Point'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.rect', () {
      expect(TypeArgKind.rect.typeIdentifier.name,
          equals('Windows.Foundation.Rect'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableRect', () {
      expect(TypeArgKind.nullableRect.typeIdentifier.name,
          equals('Windows.Foundation.Rect'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.size', () {
      expect(TypeArgKind.size.typeIdentifier.name,
          equals('Windows.Foundation.Size'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableSize', () {
      expect(TypeArgKind.nullableSize.typeIdentifier.name,
          equals('Windows.Foundation.Size'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.string', () {
      expect(TypeArgKind.string.typeIdentifier.baseType,
          equals(BaseType.stringType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableString', () {
      expect(TypeArgKind.nullableString.typeIdentifier.baseType,
          equals(BaseType.stringType));
    });

    test('returns correct TypeIdentifier for TypeArgKind.uint16', () {
      expect(TypeArgKind.uint16.typeIdentifier.baseType,
          equals(BaseType.uint16Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableUint16', () {
      expect(TypeArgKind.nullableUint16.typeIdentifier.baseType,
          equals(BaseType.uint16Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.uint32', () {
      expect(TypeArgKind.uint32.typeIdentifier.baseType,
          equals(BaseType.uint32Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableUint32', () {
      expect(TypeArgKind.nullableUint32.typeIdentifier.baseType,
          equals(BaseType.uint32Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.uint64', () {
      expect(TypeArgKind.uint64.typeIdentifier.baseType,
          equals(BaseType.uint64Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableUint64', () {
      expect(TypeArgKind.nullableUint64.typeIdentifier.baseType,
          equals(BaseType.uint64Type));
    });

    test('returns correct TypeIdentifier for TypeArgKind.uri', () {
      expect(TypeArgKind.uri.typeIdentifier.name,
          equals('Windows.Foundation.Uri'));
    });

    test('returns correct TypeIdentifier for TypeArgKind.nullableUri', () {
      expect(TypeArgKind.nullableUri.typeIdentifier.name,
          equals('Windows.Foundation.Uri'));
    });
  });
}