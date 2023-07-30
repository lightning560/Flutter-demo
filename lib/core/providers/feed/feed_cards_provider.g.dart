// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_cards_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredFeedCardsHash() => r'3dcf40c6e6f1255a5c0d73009f30a642a0d45aaf';

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

typedef FilteredFeedCardsRef = AutoDisposeProviderRef<List<FeedCard>>;

/// See also [filteredFeedCards].
@ProviderFor(filteredFeedCards)
const filteredFeedCardsProvider = FilteredFeedCardsFamily();

/// See also [filteredFeedCards].
class FilteredFeedCardsFamily extends Family<List<FeedCard>> {
  /// See also [filteredFeedCards].
  const FilteredFeedCardsFamily();

  /// See also [filteredFeedCards].
  FilteredFeedCardsProvider call(
    dynamic cards,
    dynamic kind,
  ) {
    return FilteredFeedCardsProvider(
      cards,
      kind,
    );
  }

  @override
  FilteredFeedCardsProvider getProviderOverride(
    covariant FilteredFeedCardsProvider provider,
  ) {
    return call(
      provider.cards,
      provider.kind,
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
  String? get name => r'filteredFeedCardsProvider';
}

/// See also [filteredFeedCards].
class FilteredFeedCardsProvider extends AutoDisposeProvider<List<FeedCard>> {
  /// See also [filteredFeedCards].
  FilteredFeedCardsProvider(
    this.cards,
    this.kind,
  ) : super.internal(
          (ref) => filteredFeedCards(
            ref,
            cards,
            kind,
          ),
          from: filteredFeedCardsProvider,
          name: r'filteredFeedCardsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredFeedCardsHash,
          dependencies: FilteredFeedCardsFamily._dependencies,
          allTransitiveDependencies:
              FilteredFeedCardsFamily._allTransitiveDependencies,
        );

  final dynamic cards;
  final dynamic kind;

  @override
  bool operator ==(Object other) {
    return other is FilteredFeedCardsProvider &&
        other.cards == cards &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cards.hashCode);
    hash = _SystemHash.combine(hash, kind.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
