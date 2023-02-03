// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import '../internal.dart';
import 'callbacks.dart';
import 'collections/iiterator.dart';
import 'helpers.dart';
import 'iinspectable.dart';
import 'ipropertyvaluestatics.dart';
import 'structs.g.dart';
import 'types.dart';

/// Represents a value in a property store (such as a [PropertySet]
/// instance).
///
/// {@category class}
class PropertyValue extends IInspectable {
  PropertyValue.fromRawPointer(super.ptr);

  static const _className = 'Windows.Foundation.PropertyValue';

  // IPropertyValueStatics methods
  static Pointer<COMObject> createEmpty() {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createEmpty();
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt8(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt8(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInt16(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInt16(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt16(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt16(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInt32(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInt32(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt32(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt32(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInt64(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInt64(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt64(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt64(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createSingle(double value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createSingle(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createDouble(double value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createDouble(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createChar16(int value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createChar16(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createBoolean(bool value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createBoolean(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createString(String value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createString(value);
    } finally {
      object.release();
    }
  }

  static Pointer<COMObject> createInspectable(Object? value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInspectable(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createGuid(Guid value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createGuid(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createDateTime(DateTime value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createDateTime(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createTimeSpan(Duration value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createTimeSpan(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createPoint(Point value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createPoint(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createSize(Size value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createSize(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createRect(Rect value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createRect(value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt8Array(int valueSize, Pointer<Uint8> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt8Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInt16Array(int valueSize, Pointer<Int16> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInt16Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt16Array(
      int valueSize, Pointer<Uint16> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt16Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInt32Array(int valueSize, Pointer<Int32> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInt32Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt32Array(
      int valueSize, Pointer<Uint32> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt32Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInt64Array(int valueSize, Pointer<Int64> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInt64Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createUInt64Array(
      int valueSize, Pointer<Uint64> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createUInt64Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createSingleArray(int valueSize, Pointer<Float> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createSingleArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createDoubleArray(
      int valueSize, Pointer<Double> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createDoubleArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createChar16Array(
      int valueSize, Pointer<Uint16> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createChar16Array(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createBooleanArray(int valueSize, Pointer<Bool> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createBooleanArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createStringArray(
      int valueSize, Pointer<IntPtr> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createStringArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createInspectableArray(
      int valueSize, Pointer<COMObject> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createInspectableArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createGuidArray(int valueSize, Pointer<GUID> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createGuidArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createDateTimeArray(
      int valueSize, Pointer<Uint64> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createDateTimeArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createTimeSpanArray(
      int valueSize, Pointer<Uint64> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createTimeSpanArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createPointArray(int valueSize, Pointer<Point> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createPointArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createSizeArray(int valueSize, Pointer<Size> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createSizeArray(valueSize, value);
    } finally {
      object.release();
    }
  }

  static IPropertyValue createRectArray(int valueSize, Pointer<Rect> value) {
    final activationFactoryPtr =
        createActivationFactory(_className, IID_IPropertyValueStatics);
    final object = IPropertyValueStatics.fromRawPointer(activationFactoryPtr);

    try {
      return object.createRectArray(valueSize, value);
    } finally {
      object.release();
    }
  }
}
