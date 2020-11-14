import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common.dart';

class AppImage extends StatelessWidget {
  final String assetName;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;
  final Alignment alignment;
  final String semanticLabel;

  const AppImage.asset(
    this.assetName, {
    Key key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
    this.semanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (assetName.endsWith('svg')) {
      return _svgAsset(
        assetName,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticsLabel: semanticLabel,
      );
    } else {
      return Image.asset(
        assetName,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticLabel: semanticLabel,
      );
    }
  }

  Widget _svgAsset(
    String assetName, {
    double width,
    double height,
    BoxFit fit = BoxFit.contain,
    Color color,
    alignment = Alignment.center,
    String semanticsLabel,
  }) {
    if (platform.isWeb) {
      return Image.network(
        '/assets/$assetName',
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticLabel: semanticsLabel,
      );
    } else {
      return SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticsLabel: semanticsLabel,
      );
    }
  }
}
