import 'package:codyon/home/widgets/home_banner.dart';
import 'package:flutter/material.dart';

class HomeRecommendedView extends StatelessWidget {
  const HomeRecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeBanner(),
        )
      ],
    );
  }
}
