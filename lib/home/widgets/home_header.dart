import 'package:codyon/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 8,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/icons/logo_text.svg"),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset("assets/icons/fi_search.svg"),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset("assets/icons/fi_bell.svg"),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset("assets/icons/fi_user.svg"),
                ),
              ].withSpaceBetween(width: 12),
            ),
          ],
        ),
      ),
    );
  }
}
