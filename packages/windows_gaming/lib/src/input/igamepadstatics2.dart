// igamepadstatics2.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'gamepad.dart';
import 'igamecontroller.dart';
import 'igamepadstatics.dart';

/// @nodoc
const IID_IGamepadStatics2 = '{42676dc5-0856-47c4-9213-b395504c3a3c}';

/// {@category Interface}
/// {@category winrt}
class IGamepadStatics2 extends IInspectable implements IGamepadStatics {
  // vtable begins at 6, is 1 entries long.
  IGamepadStatics2.fromRawPointer(super.ptr);

  factory IGamepadStatics2.from(IInspectable interface) =>
      IGamepadStatics2.fromRawPointer(
          interface.toInterface(IID_IGamepadStatics2));

  Gamepad? fromGameController(IGameController? gameController) {
    final retValuePtr = calloc<COMObject>();

    final hr =
        ptr
                .ref.vtable
                .elementAt(6)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                Pointer,
                                Pointer<COMObject> gameController,
                                Pointer<COMObject>)>>>()
                .value
                .asFunction<
                    int Function(Pointer, Pointer<COMObject> gameController,
                        Pointer<COMObject>)>()(
            ptr.ref.lpVtbl,
            gameController == null
                ? nullptr
                : gameController.ptr.cast<Pointer<COMObject>>().value,
            retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    if (retValuePtr.ref.lpVtbl == nullptr) {
      free(retValuePtr);
      return null;
    }

    return Gamepad.fromRawPointer(retValuePtr);
  }

  // IGamepadStatics methods
  late final _iGamepadStatics = IGamepadStatics.from(this);

  @override
  int add_GamepadAdded(Pointer<NativeFunction<EventHandler>> value) =>
      _iGamepadStatics.add_GamepadAdded(value);

  @override
  void remove_GamepadAdded(int token) =>
      _iGamepadStatics.remove_GamepadAdded(token);

  @override
  int add_GamepadRemoved(Pointer<NativeFunction<EventHandler>> value) =>
      _iGamepadStatics.add_GamepadRemoved(value);

  @override
  void remove_GamepadRemoved(int token) =>
      _iGamepadStatics.remove_GamepadRemoved(token);

  @override
  List<Gamepad> get gamepads => _iGamepadStatics.gamepads;
}