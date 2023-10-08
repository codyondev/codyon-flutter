import 'package:codyon/auth/constants/data.dart';
import 'package:codyon/auth/widgets/social_login_badge.dart';
import 'package:codyon/common/constants/colors.dart';
import 'package:codyon/common/layout/default_layout.dart';
import 'package:codyon/extensions.dart';
import 'package:codyon/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "원하는 스타일의 완벽한 발견",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              Hero(
                tag: "codyon_logo",
                child: SvgPicture.asset("assets/icons/logo_text.svg"),
              ),
              const SizedBox(height: 52),
              _SnsLoginButton(
                "카카오 계정으로 로그인",
                foregroundColor: Colors.black.withOpacity(0.85),
                backgroundColor: const Color(0xFFFEE500),
                svgIcon: SvgPicture.asset("assets/icons/kakao_symbol.svg"),
              ),
              const SizedBox(height: 16),
              _SnsLoginButton(
                "카카오 계정으로 로그인",
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF03C75A),
                svgIcon: SvgPicture.asset("assets/icons/naver_symbol.svg"),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginBadge(
                    provider: LoginProvider.google,
                    onPressed: (provider) {},
                  ),
                  SocialLoginBadge(
                    provider: LoginProvider.facebook,
                    onPressed: (provider) {},
                  ),
                  SocialLoginBadge(
                    provider: LoginProvider.apple,
                    onPressed: (provider) {},
                  ),
                ].withSpaceBetween(width: 32),
              ),
              const SizedBox(height: 40),
              _GoEmailLoginButton(
                onPressed: () => context.pushNamed(Routes.login.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SnsLoginButton extends StatelessWidget {
  final Color foregroundColor, backgroundColor;
  final String label;
  final SvgPicture svgIcon;

  const _SnsLoginButton(
    this.label, {
    required this.foregroundColor,
    required this.backgroundColor,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svgIcon,
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ].withSpaceBetween(width: 5),
      ),
    );
  }
}

class _GoEmailLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _GoEmailLoginButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: GRAY_300, width: 1),
          ),
        ),
        child: const Text(
          "이메일로 로그인하기",
          style: TextStyle(
            fontSize: 13,
            color: GRAY_300,
          ),
        ),
      ),
    );
  }
}
