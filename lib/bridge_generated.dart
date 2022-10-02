// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.48.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names

import 'dart:convert';
import 'dart:async';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'package:meta/meta.dart';
import 'package:meta/meta.dart';
import 'dart:ffi' as ffi;

abstract class Rust {
  Future<int> getCounter({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetCounterConstMeta;

  Future<int> increment({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kIncrementConstMeta;

  Future<int> decrement({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDecrementConstMeta;

  Future<int> getResult({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetResultConstMeta;

  Future<int> calculateSimple({required List<String> args, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCalculateSimpleConstMeta;

  Future<String> calculateBongal({required String argss, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCalculateBongalConstMeta;

  Future<String> getNewBongal({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetNewBongalConstMeta;

  Future<double> calculate({required List<String> args, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCalculateConstMeta;

  Future<double> calculateVerbose({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCalculateVerboseConstMeta;

  Future<String> calculate27({required List<String> args, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCalculate27ConstMeta;
}

class RustImpl implements Rust {
  final RustPlatform _platform;
  factory RustImpl(ExternalLibrary dylib) => RustImpl.raw(RustPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory RustImpl.wasm(FutureOr<WasmModule> module) =>
      RustImpl(module as ExternalLibrary);
  RustImpl.raw(this._platform);
  Future<int> getCounter({dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_get_counter(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kGetCounterConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetCounterConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_counter",
        argNames: [],
      );

  Future<int> increment({dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_increment(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kIncrementConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kIncrementConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "increment",
        argNames: [],
      );

  Future<int> decrement({dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_decrement(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kDecrementConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kDecrementConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "decrement",
        argNames: [],
      );

  Future<int> getResult({dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_get_result(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kGetResultConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetResultConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_result",
        argNames: [],
      );

  Future<int> calculateSimple({required List<String> args, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner
            .wire_calculate_simple(port_, _platform.api2wire_StringList(args)),
        parseSuccessData: _wire2api_u64,
        constMeta: kCalculateSimpleConstMeta,
        argValues: [args],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kCalculateSimpleConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "calculate_simple",
        argNames: ["args"],
      );

  Future<String> calculateBongal({required String argss, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner
            .wire_calculate_bongal(port_, _platform.api2wire_String(argss)),
        parseSuccessData: _wire2api_String,
        constMeta: kCalculateBongalConstMeta,
        argValues: [argss],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kCalculateBongalConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "calculate_bongal",
        argNames: ["argss"],
      );

  Future<String> getNewBongal({dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_get_new_bongal(port_),
        parseSuccessData: _wire2api_String,
        constMeta: kGetNewBongalConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetNewBongalConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_new_bongal",
        argNames: [],
      );

  Future<double> calculate({required List<String> args, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner
            .wire_calculate(port_, _platform.api2wire_StringList(args)),
        parseSuccessData: _wire2api_f64,
        constMeta: kCalculateConstMeta,
        argValues: [args],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kCalculateConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "calculate",
        argNames: ["args"],
      );

  Future<double> calculateVerbose({dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner.wire_calculate_verbose(port_),
        parseSuccessData: _wire2api_f64,
        constMeta: kCalculateVerboseConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kCalculateVerboseConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "calculate_verbose",
        argNames: [],
      );

  Future<String> calculate27({required List<String> args, dynamic hint}) =>
      _platform.executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => _platform.inner
            .wire_calculate27(port_, _platform.api2wire_StringList(args)),
        parseSuccessData: _wire2api_String,
        constMeta: kCalculate27ConstMeta,
        argValues: [args],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kCalculate27ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "calculate27",
        argNames: ["args"],
      );
}

// Section: api2wire

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: wire2api

String _wire2api_String(dynamic raw) {
  return raw as String;
}

double _wire2api_f64(dynamic raw) {
  return raw as double;
}

int _wire2api_u64(dynamic raw) {
  return castInt(raw);
}

int _wire2api_u8(dynamic raw) {
  return raw as int;
}

Uint8List _wire2api_uint_8_list(dynamic raw) {
  return raw as Uint8List;
}

class RustPlatform extends FlutterRustBridgeBase<RustWire> {
  RustPlatform(ffi.DynamicLibrary dylib) : super(RustWire(dylib));
// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_StringList> api2wire_StringList(List<String> raw) {
    final ans = inner.new_StringList_0(raw.length);
    for (var i = 0; i < raw.length; i++) {
      ans.ref.ptr[i] = api2wire_String(raw[i]);
    }
    return ans;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: api_fill_to_wire

}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class RustWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustWire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  void wire_get_counter(
    int port_,
  ) {
    return _wire_get_counter(
      port_,
    );
  }

  late final _wire_get_counterPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_counter');
  late final _wire_get_counter =
      _wire_get_counterPtr.asFunction<void Function(int)>();

  void wire_increment(
    int port_,
  ) {
    return _wire_increment(
      port_,
    );
  }

  late final _wire_incrementPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_increment');
  late final _wire_increment =
      _wire_incrementPtr.asFunction<void Function(int)>();

  void wire_decrement(
    int port_,
  ) {
    return _wire_decrement(
      port_,
    );
  }

  late final _wire_decrementPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_decrement');
  late final _wire_decrement =
      _wire_decrementPtr.asFunction<void Function(int)>();

  void wire_get_result(
    int port_,
  ) {
    return _wire_get_result(
      port_,
    );
  }

  late final _wire_get_resultPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_result');
  late final _wire_get_result =
      _wire_get_resultPtr.asFunction<void Function(int)>();

  void wire_calculate_simple(
    int port_,
    ffi.Pointer<wire_StringList> args,
  ) {
    return _wire_calculate_simple(
      port_,
      args,
    );
  }

  late final _wire_calculate_simplePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_StringList>)>>('wire_calculate_simple');
  late final _wire_calculate_simple = _wire_calculate_simplePtr
      .asFunction<void Function(int, ffi.Pointer<wire_StringList>)>();

  void wire_calculate_bongal(
    int port_,
    ffi.Pointer<wire_uint_8_list> argss,
  ) {
    return _wire_calculate_bongal(
      port_,
      argss,
    );
  }

  late final _wire_calculate_bongalPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_calculate_bongal');
  late final _wire_calculate_bongal = _wire_calculate_bongalPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_get_new_bongal(
    int port_,
  ) {
    return _wire_get_new_bongal(
      port_,
    );
  }

  late final _wire_get_new_bongalPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_new_bongal');
  late final _wire_get_new_bongal =
      _wire_get_new_bongalPtr.asFunction<void Function(int)>();

  void wire_calculate(
    int port_,
    ffi.Pointer<wire_StringList> args,
  ) {
    return _wire_calculate(
      port_,
      args,
    );
  }

  late final _wire_calculatePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_StringList>)>>('wire_calculate');
  late final _wire_calculate = _wire_calculatePtr
      .asFunction<void Function(int, ffi.Pointer<wire_StringList>)>();

  void wire_calculate_verbose(
    int port_,
  ) {
    return _wire_calculate_verbose(
      port_,
    );
  }

  late final _wire_calculate_verbosePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_calculate_verbose');
  late final _wire_calculate_verbose =
      _wire_calculate_verbosePtr.asFunction<void Function(int)>();

  void wire_calculate27(
    int port_,
    ffi.Pointer<wire_StringList> args,
  ) {
    return _wire_calculate27(
      port_,
      args,
    );
  }

  late final _wire_calculate27Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_StringList>)>>('wire_calculate27');
  late final _wire_calculate27 = _wire_calculate27Ptr
      .asFunction<void Function(int, ffi.Pointer<wire_StringList>)>();

  ffi.Pointer<wire_StringList> new_StringList_0(
    int len,
  ) {
    return _new_StringList_0(
      len,
    );
  }

  late final _new_StringList_0Ptr = _lookup<
          ffi.NativeFunction<ffi.Pointer<wire_StringList> Function(ffi.Int32)>>(
      'new_StringList_0');
  late final _new_StringList_0 = _new_StringList_0Ptr
      .asFunction<ffi.Pointer<wire_StringList> Function(int)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_StringList extends ffi.Struct {
  external ffi.Pointer<ffi.Pointer<wire_uint_8_list>> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
