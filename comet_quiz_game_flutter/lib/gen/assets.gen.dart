/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/comet.svg
  SvgGenImage get comet => const SvgGenImage('assets/images/comet.svg');

  /// File path: assets/images/comet_banner.svg
  SvgGenImage get cometBanner =>
      const SvgGenImage('assets/images/comet_banner.svg');

  /// File path: assets/images/comet_logo.svg
  SvgGenImage get cometLogo =>
      const SvgGenImage('assets/images/comet_logo.svg');

  /// File path: assets/images/cursor.svg
  SvgGenImage get cursor => const SvgGenImage('assets/images/cursor.svg');

  /// File path: assets/images/dust.svg
  SvgGenImage get dust => const SvgGenImage('assets/images/dust.svg');

  /// File path: assets/images/fire.svg
  SvgGenImage get fire => const SvgGenImage('assets/images/fire.svg');

  /// File path: assets/images/innovate_together.svg
  SvgGenImage get innovateTogether =>
      const SvgGenImage('assets/images/innovate_together.svg');

  /// File path: assets/images/line.svg
  SvgGenImage get line => const SvgGenImage('assets/images/line.svg');

  /// File path: assets/images/question.svg
  SvgGenImage get question => const SvgGenImage('assets/images/question.svg');

  /// File path: assets/images/start.svg
  SvgGenImage get start => const SvgGenImage('assets/images/start.svg');

  /// File path: assets/images/start_v2.svg
  SvgGenImage get startV2 => const SvgGenImage('assets/images/start_v2.svg');

  /// File path: assets/images/users.svg
  SvgGenImage get users => const SvgGenImage('assets/images/users.svg');

  /// File path: assets/images/yellow_start.svg
  SvgGenImage get yellowStart =>
      const SvgGenImage('assets/images/yellow_start.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        comet,
        cometBanner,
        cometLogo,
        cursor,
        dust,
        fire,
        innovateTogether,
        line,
        question,
        start,
        startV2,
        users,
        yellowStart
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
