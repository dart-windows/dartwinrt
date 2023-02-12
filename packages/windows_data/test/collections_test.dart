// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@TestOn('windows')

import 'package:test/test.dart';
import 'package:win32/win32.dart';
import 'package:windows_data/windows_data.dart';
import 'package:windows_foundation/windows_foundation.dart';

void main() {
  if (!isWindowsRuntimeAvailable()) {
    print('Skipping tests because Windows Runtime is not available.');
    return;
  }

  group('IMap<String, IJsonValue?>', () {
    late IMap<String, IJsonValue?> map;

    setUp(() {
      final jsonStr =
          '{"key1": "strVal", "key2": 97, "key3": false, "key4": [1, 2, 3], "key5": null}';
      map = JsonObject()
        ..insert('key1', JsonValue.parse(jsonStr))
        ..insert('key2', JsonValue.createBooleanValue(true))
        ..insert('key3', JsonValue.createNumberValue(2022))
        ..insert('key4', JsonValue.createStringValue('strVal'))
        ..insert('key5', null);
    });

    test('lookup fails if the map is empty', () {
      map.clear();
      expect(() => map.lookup('key1'), throwsException);
    });

    test('lookup throws exception if the item does not exists', () {
      expect(() => map.lookup('key0'), throwsException);
    });

    test('lookup returns items', () {
      expect(
          map.lookup('key1')?.stringify(),
          equals(
              '{"key1":"strVal","key2":97,"key3":false,"key4":[1,2,3],"key5":null}'));
      expect(map.lookup('key2')?.getBoolean(), isTrue);
      expect(map.lookup('key3')?.getNumber(), equals(2022));
      expect(map.lookup('key4')?.getString(), equals('strVal'));
      expect(map.lookup('key5')?.valueType, equals(JsonValueType.null_));
    });

    test('hasKey finds items', () {
      expect(map.hasKey('key1'), isTrue);
      expect(map.hasKey('key2'), isTrue);
      expect(map.hasKey('key3'), isTrue);
      expect(map.hasKey('key4'), isTrue);
      expect(map.hasKey('key5'), isTrue);
    });

    test('hasKey returns false if the item does not exists', () {
      expect(map.hasKey('key0'), isFalse);
    });

    test('getView', () {
      final unmodifiableMap = map.getView();
      expect(unmodifiableMap.length, equals(5));
      expect(() => unmodifiableMap..clear(), throwsUnsupportedError);
    });

    test('insert replaces an existing item', () {
      expect(map.size, equals(5));
      expect(
          map.insert('key4', JsonValue.createStringValue('strValNew')), isTrue);
      expect(map.size, equals(5));
      expect(map.lookup('key4')?.getString(), equals('strValNew'));
    });

    test('insert inserts a new item', () {
      expect(map.size, equals(5));
      expect(
          map.insert('key6', JsonValue.parse('{"hello": "world"}')), isFalse);
      expect(map.size, equals(6));
      expect(map.lookup('key6')?.stringify(), equals('{"hello":"world"}'));
    });

    test('remove returns normally if the map is empty', () {
      map.clear();
      expect(() => map.remove('key1'), returnsNormally);
    });

    test('remove returns normally if the item does not exists', () {
      expect(() => map.remove('key0'), returnsNormally);
    });

    test('remove', () {
      expect(map.size, equals(5));
      map.remove('key1');
      expect(map.size, equals(4));
      expect(() => map.lookup('key1'), throwsException);

      map.remove('key2');
      expect(map.size, equals(3));
      expect(() => map.lookup('key2'), throwsException);
    });

    test('clear', () {
      expect(map.size, equals(5));
      map.clear();
      expect(map.size, equals(0));
    });

    test('toMap', () {
      final dartMap = map.toMap();
      expect(dartMap.length, equals(5));
      expect(
          dartMap['key1']?.stringify(),
          equals(
              '{"key1":"strVal","key2":97,"key3":false,"key4":[1,2,3],"key5":null}'));
      expect(dartMap['key2']?.getBoolean(), isTrue);
      expect(dartMap['key3']?.getNumber(), equals(2022));
      expect(dartMap['key4']?.getString(), equals('strVal'));
      expect(dartMap['key5']?.valueType, equals(JsonValueType.null_));
      expect(() => dartMap..clear(), throwsUnsupportedError);
    });

    test('first', () {
      final iterator = map.first();
      expect(iterator.hasCurrent, isTrue);
      expect(iterator.current.key, equals('key3'));
      expect(iterator.current.value?.getNumber(), equals(2022));
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current.key, equals('key5'));
      expect(iterator.current.value?.valueType, equals(JsonValueType.null_));
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current.key, equals('key2'));
      expect(iterator.current.value?.getBoolean(), isTrue);
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current.key, equals('key1'));
      expect(
          iterator.current.value?.stringify(),
          equals(
              '{"key1":"strVal","key2":97,"key3":false,"key4":[1,2,3],"key5":null}'));
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current.key, equals('key4'));
      expect(iterator.current.value?.getString(), equals('strVal'));
      expect(iterator.moveNext(), isFalse);
    });
  });
}
