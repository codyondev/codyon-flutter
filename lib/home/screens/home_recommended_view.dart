import 'package:codyon/common/constants/colors.dart';
import 'package:codyon/extensions.dart';
import 'package:codyon/home/screens/home_filters_screen.dart';
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
        ),
        SliverToBoxAdapter(
          child: HomeFilters(),
        )
      ],
    );
  }
}

class HomeFilters extends StatefulWidget {
  const HomeFilters({super.key});

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  List<String> filters = [];

  void _onSelect(String value) {
    setState(() {
      if (filters.contains(value)) {
        filters = filters.where((filter) => filter != value).toList();
      } else {
        filters = [...filters, value];
      }
    });
  }

  void _onFilter(List<String> filters) =>
      setState(() => this.filters = filters);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 56,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: GRAY_200),
          bottom: BorderSide(width: 0.5, color: GRAY_200),
        ),
      ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          HomeFilterSettingButton(
            filters: filters,
            onFilter: _onFilter,
          ),
          HomeFilter(
            label: "미니멀",
            value: "minimal",
            onSelect: _onSelect,
            active: filters.contains("minimal"),
          ),
          HomeFilter(
            label: "모던",
            value: "modern",
            onSelect: _onSelect,
            active: filters.contains("modern"),
          ),
          HomeFilter(
            label: "스트릿",
            value: "street",
            onSelect: _onSelect,
            active: filters.contains("street"),
          ),
          HomeFilter(
            label: "빈티지",
            value: "vintage",
            onSelect: _onSelect,
            active: filters.contains("vintage"),
          ),
          HomeFilter(
            label: "캐주얼",
            value: "casual",
            onSelect: _onSelect,
            active: filters.contains("casual"),
          ),
          HomeFilter(
            label: "러블리",
            value: "lovely",
            onSelect: _onSelect,
            active: filters.contains("lovely"),
          ),
          HomeFilter(
            label: "클래식",
            value: "classic",
            onSelect: _onSelect,
            active: filters.contains("classic"),
          ),
          HomeFilter(
            label: "아메카지",
            value: "amekaji",
            onSelect: _onSelect,
            active: filters.contains("amekaji"),
          ),
        ].withSpaceBetween(width: 8),
      ),
    );
  }
}

class HomeFilter extends StatelessWidget {
  final String label, value;
  final Function(String value) onSelect;
  final bool? active;

  const HomeFilter({
    super.key,
    required this.label,
    required this.value,
    required this.onSelect,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(value),
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: active! ? PRIMARY_COLOR : GRAY_300),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: active! ? PRIMARY_COLOR : GRAY_400,
          ),
        ),
      ),
    );
  }
}

class HomeFilterSettingButton extends StatelessWidget {
  final Function(List<String> filters) onFilter;
  final List<String> filters;

  const HomeFilterSettingButton({
    super.key,
    required this.filters,
    required this.onFilter,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      useRootNavigator: true,
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return HomeFiltersScreen(
          filters: filters,
          onFilter: onFilter,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 37,
        decoration: BoxDecoration(
          border: Border.all(color: GRAY_300),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Row(
            children: [
              Icon(
                Icons.settings,
                size: 12,
                color: GRAY_400,
              ),
              SizedBox(width: 4),
              Text(
                "필터",
                style: TextStyle(
                  fontSize: 12,
                  color: GRAY_400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
