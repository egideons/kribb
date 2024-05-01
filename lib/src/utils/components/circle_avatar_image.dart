import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../constants/assets.dart';
import '../../constants/consts.dart';

Widget circleAvatarImage(colorScheme, {height, radius, foregroundImage}) {
  return SizedBox(
    height: height ?? 40,
    child: FittedBox(
      fit: BoxFit.contain,
      child: CircleAvatar(
        backgroundColor: colorScheme.inversePrimary,
        radius: radius ?? 64,
        foregroundImage:
            foregroundImage ?? const NetworkImage(Assets.userPlaceholderImage),
        child: Text(
          "P",
          style: defaultTextStyle(
            fontSize: 32.0,
            color: kLightBackgroundColor,
          ),
        ),
      ),
    ),
  );
}
