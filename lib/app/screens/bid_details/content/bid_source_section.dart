import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/app/landlord_bid_detail_controller.dart';
import '../../../../src/utils/components/circle_avatar_image.dart';
import '../../../../theme/colors.dart';

Widget bidSourceSection(
  colorScheme,
  media,
  BidDetailsController controller, {
  nameOfSource,
  emailOfSource,
  sourceTag,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleAvatarImage(
            colorScheme,
            height: media.height * .12,
            radius: 60,
          ),
          kWidthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: media.width / 2.2,
                child: Text(
                  nameOfSource ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: defaultTextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: media.width / 2.2,
                child: Text(
                  emailOfSource ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: defaultTextStyle(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                sourceTag.toUpperCase() ?? "",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
      kWidthSizedBox,
      controller.bidIsNull.value
          ? const SizedBox()
          : controller.bidIsAccepted.value
              ? Icon(
                  Icons.cancel,
                  color: kSuccessColor,
                  size: media.height * .05,
                )
              : Icon(
                  Icons.cancel,
                  color: kErrorColor,
                  size: media.height * .05,
                ),
    ],
  );
}
