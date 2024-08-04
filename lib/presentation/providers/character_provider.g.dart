// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$characterHash() => r'8438f3c2eaee4b2663ea822731e21833a3a5c520';

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

/// See also [character].
@ProviderFor(character)
const characterProvider = CharacterFamily();

/// See also [character].
class CharacterFamily extends Family<AsyncValue<CharacterEntity>> {
  /// See also [character].
  const CharacterFamily();

  /// See also [character].
  CharacterProvider call(
    int id,
  ) {
    return CharacterProvider(
      id,
    );
  }

  @override
  CharacterProvider getProviderOverride(
    covariant CharacterProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'characterProvider';
}

/// See also [character].
class CharacterProvider extends FutureProvider<CharacterEntity> {
  /// See also [character].
  CharacterProvider(
    int id,
  ) : this._internal(
          (ref) => character(
            ref as CharacterRef,
            id,
          ),
          from: characterProvider,
          name: r'characterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterHash,
          dependencies: CharacterFamily._dependencies,
          allTransitiveDependencies: CharacterFamily._allTransitiveDependencies,
          id: id,
        );

  CharacterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<CharacterEntity> Function(CharacterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterProvider._internal(
        (ref) => create(ref as CharacterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<CharacterEntity> createElement() {
    return _CharacterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CharacterRef on FutureProviderRef<CharacterEntity> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CharacterProviderElement extends FutureProviderElement<CharacterEntity>
    with CharacterRef {
  _CharacterProviderElement(super.provider);

  @override
  int get id => (origin as CharacterProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
