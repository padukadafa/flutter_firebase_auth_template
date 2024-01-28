import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';

class ReuseableAvatar extends StatelessWidget {
  final String avatarUrl;
  final double diameter;
  const ReuseableAvatar(
      {super.key, required this.avatarUrl, this.diameter = 100});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (_, imageProvider) {
        return Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider),
          ),
        );
      },
      errorWidget: (_, error, s) {
        return Container(
          width: diameter,
          height: diameter,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryLight,
          ),
        );
      },
      placeholder: (_, url) {
        return Container(
          width: diameter,
          height: diameter,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryLight,
          ),
        );
      },
    );
  }
}
