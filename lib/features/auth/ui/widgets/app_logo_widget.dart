import 'package:ecommarceproject/app/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidgets extends StatelessWidget {
  const AppLogoWidgets({
    super.key, this.width, this.height, this.boxFit,
  });
final double? width;
final double? height;
final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.applogoSvg,
    width: width??120,
      height:height ??120,
      fit: boxFit?? BoxFit.scaleDown,

    );
  }
}
