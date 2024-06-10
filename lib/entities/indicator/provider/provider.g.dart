// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$indicatorsHash() => r'd0bbdad20eb83c55f6ebbf7056e95ff6ac064f4f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Indicators
    extends BuildlessAutoDisposeAsyncNotifier<List<IndicatorModel>> {
  late final String field;

  FutureOr<List<IndicatorModel>> build(
    String field,
  );
}

/// See also [Indicators].
@ProviderFor(Indicators)
const indicatorsProvider = IndicatorsFamily();

/// See also [Indicators].
class IndicatorsFamily extends Family<AsyncValue<List<IndicatorModel>>> {
  /// See also [Indicators].
  const IndicatorsFamily();

  /// See also [Indicators].
  IndicatorsProvider call(
    String field,
  ) {
    return IndicatorsProvider(
      field,
    );
  }

  @override
  IndicatorsProvider getProviderOverride(
    covariant IndicatorsProvider provider,
  ) {
    return call(
      provider.field,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'indicatorsProvider';
}

/// See also [Indicators].
class IndicatorsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    Indicators, List<IndicatorModel>> {
  /// See also [Indicators].
  IndicatorsProvider(
    String field,
  ) : this._internal(
          () => Indicators()..field = field,
          from: indicatorsProvider,
          name: r'indicatorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$indicatorsHash,
          dependencies: IndicatorsFamily._dependencies,
          allTransitiveDependencies:
              IndicatorsFamily._allTransitiveDependencies,
          field: field,
        );

  IndicatorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.field,
  }) : super.internal();

  final String field;

  @override
  FutureOr<List<IndicatorModel>> runNotifierBuild(
    covariant Indicators notifier,
  ) {
    return notifier.build(
      field,
    );
  }

  @override
  Override overrideWith(Indicators Function() create) {
    return ProviderOverride(
      origin: this,
      override: IndicatorsProvider._internal(
        () => create()..field = field,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        field: field,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Indicators, List<IndicatorModel>>
      createElement() {
    return _IndicatorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IndicatorsProvider && other.field == field;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, field.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IndicatorsRef
    on AutoDisposeAsyncNotifierProviderRef<List<IndicatorModel>> {
  /// The parameter `field` of this provider.
  String get field;
}

class _IndicatorsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Indicators,
        List<IndicatorModel>> with IndicatorsRef {
  _IndicatorsProviderElement(super.provider);

  @override
  String get field => (origin as IndicatorsProvider).field;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
