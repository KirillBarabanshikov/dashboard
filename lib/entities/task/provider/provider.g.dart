// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksHash() => r'bf40eb722aad5c97f40540fdaa3cf69e7404a2aa';

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

abstract class _$Tasks
    extends BuildlessAutoDisposeAsyncNotifier<List<TaskModel>> {
  late final String? displayName;

  FutureOr<List<TaskModel>> build({
    String? displayName,
  });
}

/// See also [Tasks].
@ProviderFor(Tasks)
const tasksProvider = TasksFamily();

/// See also [Tasks].
class TasksFamily extends Family<AsyncValue<List<TaskModel>>> {
  /// See also [Tasks].
  const TasksFamily();

  /// See also [Tasks].
  TasksProvider call({
    String? displayName,
  }) {
    return TasksProvider(
      displayName: displayName,
    );
  }

  @override
  TasksProvider getProviderOverride(
    covariant TasksProvider provider,
  ) {
    return call(
      displayName: provider.displayName,
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
  String? get name => r'tasksProvider';
}

/// See also [Tasks].
class TasksProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Tasks, List<TaskModel>> {
  /// See also [Tasks].
  TasksProvider({
    String? displayName,
  }) : this._internal(
          () => Tasks()..displayName = displayName,
          from: tasksProvider,
          name: r'tasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tasksHash,
          dependencies: TasksFamily._dependencies,
          allTransitiveDependencies: TasksFamily._allTransitiveDependencies,
          displayName: displayName,
        );

  TasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.displayName,
  }) : super.internal();

  final String? displayName;

  @override
  FutureOr<List<TaskModel>> runNotifierBuild(
    covariant Tasks notifier,
  ) {
    return notifier.build(
      displayName: displayName,
    );
  }

  @override
  Override overrideWith(Tasks Function() create) {
    return ProviderOverride(
      origin: this,
      override: TasksProvider._internal(
        () => create()..displayName = displayName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        displayName: displayName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Tasks, List<TaskModel>>
      createElement() {
    return _TasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TasksProvider && other.displayName == displayName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, displayName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TasksRef on AutoDisposeAsyncNotifierProviderRef<List<TaskModel>> {
  /// The parameter `displayName` of this provider.
  String? get displayName;
}

class _TasksProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Tasks, List<TaskModel>>
    with TasksRef {
  _TasksProviderElement(super.provider);

  @override
  String? get displayName => (origin as TasksProvider).displayName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
