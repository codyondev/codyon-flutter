import 'package:codyon/auth/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginBadge extends StatelessWidget {
  final Color? foregroundColor, backgroundColor;
  final Function(LoginProvider provider) onPressed;
  final LoginProvider provider;

  const SocialLoginBadge({
    super.key,
    this.foregroundColor,
    this.backgroundColor = Colors.white,
    required this.provider,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(56, 56),
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor ?? Colors.grey.shade100,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(56),
          side: BorderSide(
            color: const Color(0xFF12121d).withOpacity(0.1),
          ),
        ),
      ),
      child: _renderProviderIcon(),
    );
  }

  SvgPicture _renderProviderIcon() {
    switch (provider) {
      case LoginProvider.kakao:
        return SvgPicture.asset(
          "assets/icons/kakao_symbol.svg",
          width: 24,
          height: 24,
        );
      case LoginProvider.naver:
        return SvgPicture.asset(
          "assets/icons/naver_symbol.svg",
          width: 24,
          height: 24,
        );
      case LoginProvider.google:
        return SvgPicture.asset(
          "assets/icons/google_symbol.svg",
          width: 24,
          height: 24,
        );
      case LoginProvider.facebook:
        return SvgPicture.asset(
          "assets/icons/facebook_symbol.svg",
          width: 24,
          height: 24,
        );
      case LoginProvider.apple:
        return SvgPicture.asset(
          "assets/icons/apple_symbol.svg",
          width: 24,
          height: 24,
        );
    }
  }
}
