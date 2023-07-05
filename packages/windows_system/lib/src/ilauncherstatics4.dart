// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart' hide DocumentProperties;
import 'package:windows_applicationmodel/windows_applicationmodel.dart';
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'launcheroptions.dart';
import 'launchquerysupportstatus.dart';
import 'launchuriresult.dart';
import 'launchuristatus.dart';
import 'user.dart';

/// @nodoc
const IID_ILauncherStatics4 = '{b9ec819f-b5a5-41c6-b3b3-dd1b3178bcf2}';

class ILauncherStatics4 extends IInspectable {
  // vtable begins at 6, is 8 entries long.
  ILauncherStatics4.fromPtr(super.ptr);

  factory ILauncherStatics4.from(IInspectable interface) =>
      ILauncherStatics4.fromPtr(interface.toInterface(IID_ILauncherStatics4));

  Future<LaunchQuerySupportStatus> queryAppUriSupportAsync(Uri? uri) {
    final operation = calloc<COMObject>();

    final hr =
        ptr.ref.vtable
                .elementAt(6)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                VTablePointer uri,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, VTablePointer uri,
                        Pointer<COMObject> operation)>()(ptr.ref.lpVtbl,
            uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr, operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchQuerySupportStatus>.fromPtr(
        operation,
        enumCreator: LaunchQuerySupportStatus.from);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<LaunchQuerySupportStatus> queryAppUriSupportWithPackageFamilyNameAsync(
      Uri? uri, String packageFamilyName) {
    final operation = calloc<COMObject>();
    final packageFamilyNameHString = packageFamilyName.toHString();

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer uri,
                            IntPtr packageFamilyName,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(VTablePointer lpVtbl, VTablePointer uri,
                    int packageFamilyName, Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl,
        uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr,
        packageFamilyNameHString,
        operation);

    WindowsDeleteString(packageFamilyNameHString);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchQuerySupportStatus>.fromPtr(
        operation,
        enumCreator: LaunchQuerySupportStatus.from);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<List<AppInfo?>> findAppUriHandlersAsync(Uri? uri) {
    final operation = calloc<COMObject>();

    final hr =
        ptr.ref.vtable
                .elementAt(8)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                VTablePointer uri,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, VTablePointer uri,
                        Pointer<COMObject> operation)>()(ptr.ref.lpVtbl,
            uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr, operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<IVectorView<AppInfo?>>.fromPtr(
        operation,
        creator: (ptr) => IVectorView.fromPtr(ptr,
            creator: AppInfo.fromPtr,
            iterableIid: '{63d0bffe-0e34-55b3-83d5-314caff2b137}'));
    return asyncOperation.toFuture(() => asyncOperation.getResults().toList());
  }

  Future<LaunchUriStatus> launchUriForUserAsync(User? user, Uri? uri) {
    final operation = calloc<COMObject>();

    final hr =
        ptr.ref.vtable
                .elementAt(9)
                .cast<
                    Pointer<
                        NativeFunction<
                            HRESULT Function(
                                VTablePointer lpVtbl,
                                VTablePointer user,
                                VTablePointer uri,
                                Pointer<COMObject> operation)>>>()
                .value
                .asFunction<
                    int Function(VTablePointer lpVtbl, VTablePointer user,
                        VTablePointer uri, Pointer<COMObject> operation)>()(
            ptr.ref.lpVtbl,
            user == null ? nullptr : user.ptr.ref.lpVtbl,
            uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr,
            operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchUriStatus>.fromPtr(operation,
        enumCreator: LaunchUriStatus.from);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<LaunchUriStatus> launchUriWithOptionsForUserAsync(
      User? user, Uri? uri, LauncherOptions? options) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(10)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer user,
                            VTablePointer uri,
                            VTablePointer options,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer user,
                    VTablePointer uri,
                    VTablePointer options,
                    Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl,
        user == null ? nullptr : user.ptr.ref.lpVtbl,
        uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr,
        options == null ? nullptr : options.ptr.ref.lpVtbl,
        operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchUriStatus>.fromPtr(operation,
        enumCreator: LaunchUriStatus.from);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<LaunchUriStatus> launchUriWithDataForUserAsync(
      User? user, Uri? uri, LauncherOptions? options, ValueSet inputData) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(11)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer user,
                            VTablePointer uri,
                            VTablePointer options,
                            VTablePointer inputData,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer user,
                    VTablePointer uri,
                    VTablePointer options,
                    VTablePointer inputData,
                    Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl,
        user == null ? nullptr : user.ptr.ref.lpVtbl,
        uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr,
        options == null ? nullptr : options.ptr.ref.lpVtbl,
        inputData.ptr.ref.lpVtbl,
        operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchUriStatus>.fromPtr(operation,
        enumCreator: LaunchUriStatus.from);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<LaunchUriResult?> launchUriForResultsForUserAsync(
      User? user, Uri? uri, LauncherOptions? options) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(12)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer user,
                            VTablePointer uri,
                            VTablePointer options,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer user,
                    VTablePointer uri,
                    VTablePointer options,
                    Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl,
        user == null ? nullptr : user.ptr.ref.lpVtbl,
        uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr,
        options == null ? nullptr : options.ptr.ref.lpVtbl,
        operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchUriResult?>.fromPtr(operation,
        creator: LaunchUriResult.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }

  Future<LaunchUriResult?> launchUriForResultsWithDataForUserAsync(
      User? user, Uri? uri, LauncherOptions? options, ValueSet inputData) {
    final operation = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(13)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            VTablePointer lpVtbl,
                            VTablePointer user,
                            VTablePointer uri,
                            VTablePointer options,
                            VTablePointer inputData,
                            Pointer<COMObject> operation)>>>()
            .value
            .asFunction<
                int Function(
                    VTablePointer lpVtbl,
                    VTablePointer user,
                    VTablePointer uri,
                    VTablePointer options,
                    VTablePointer inputData,
                    Pointer<COMObject> operation)>()(
        ptr.ref.lpVtbl,
        user == null ? nullptr : user.ptr.ref.lpVtbl,
        uri?.toWinRTUri().ptr.ref.lpVtbl ?? nullptr,
        options == null ? nullptr : options.ptr.ref.lpVtbl,
        inputData.ptr.ref.lpVtbl,
        operation);

    if (FAILED(hr)) {
      free(operation);
      throw WindowsException(hr);
    }

    final asyncOperation = IAsyncOperation<LaunchUriResult?>.fromPtr(operation,
        creator: LaunchUriResult.fromPtr);
    return asyncOperation.toFuture(asyncOperation.getResults);
  }
}
