import 'package:codyon/home/screens/home_recommended_view.dart';
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
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const HomeHeader(),
              HomeTabBar(tabController: _tabController, tabs: tabs),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              const HomeRecommendedView(),
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
        ),
      ),
    );
  }
}

class HomeTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;

  const HomeTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        tabBar: TabBar(
          indicatorColor: const Color(0xff4400eb),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          labelColor: const Color(0xFF0C0C0C),
          unselectedLabelColor: const Color(0xFF0C0C0C).withOpacity(0.6),
          isScrollable: true,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: tabs,
          labelPadding: const EdgeInsets.symmetric(horizontal: 12),
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
