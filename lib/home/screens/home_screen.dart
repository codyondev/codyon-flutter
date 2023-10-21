import 'package:codyon/home/widgets/home_banner.dart';
import 'package:codyon/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final tabs = [
    const Tab(text: "추천"),
    const Tab(text: "랭킹"),
    const Tab(text: "브랜드"),
    const Tab(text: "아이템"),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _tabController = TabController(length: tabs.length, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: HomeHeader()),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                tabBar: TabBar(
                  indicatorColor: const Color(0xff4400eb),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  labelColor: const Color(0xFF0C0C0C),
                  unselectedLabelColor:
                      const Color(0xFF0C0C0C).withOpacity(0.6),
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: tabs,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: HomeBanner()),
            SliverFillRemaining(
              hasScrollBody: true,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.redAccent,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.tabBar,
  });

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
