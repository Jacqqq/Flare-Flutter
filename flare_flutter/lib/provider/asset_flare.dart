import 'package:flare_flutter/asset_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

/// Fetches a Flare from an [AssetBundle].
@immutable
class AssetFlare extends AssetProvider {
  /// The bundle from which the Flare will be obtained.
  final AssetBundle bundle;

  /// The key to use to obtain the resource from the [bundle].
  final String name;

  const AssetFlare({
    required this.bundle,
    required this.name,
  });

  @override
  int get hashCode => Object.hash(bundle, name); // Use Object.hash for better readability

  @override
  bool operator ==(Object other) { // Simplify the equality check
    if (identical(this, other)) return true;
    return other is AssetFlare && other.bundle == bundle && other.name == name;
  }

  @override
  Future<ByteData> load() => bundle.load(name);

  @override
  String toString() => '$runtimeType(bundle: $bundle, name: "$name")';
}
