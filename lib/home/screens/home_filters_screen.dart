import 'package:codyon/common/constants/colors.dart';
import 'package:codyon/home/screens/home_recommended_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeFiltersScreen extends StatefulWidget {
  final List<String> filters;
  final Function(List<String> filters) onFilter;

  const HomeFiltersScreen({
    super.key,
    required this.filters,
    required this.onFilter,
  });

  @override
  State<HomeFiltersScreen> createState() => _HomeFiltersScreenState();
}

class _HomeFiltersScreenState extends State<HomeFiltersScreen> {
  late List<String> filters = widget.filters;

  @override
  void initState() {
    super.initState();
  }

  void _onSelect(String value) {
    setState(() {
      if (filters.contains(value)) {
        filters = filters.where((filter) => filter != value).toList();
      } else {
        filters = [...filters, value];
      }
    });
  }

  void _reset() => setState(() => filters = []);

  void _onConfirm() {
    widget.onFilter(filters);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).padding.bottom + 16,
        ),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(74, 56),
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: GRAY_100,
                foregroundColor: GRAY_500,
              ),
              child: const Text("초기화"),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: _onConfirm,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.infinity, 56),
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  backgroundColor: const Color(0xFF16182C),
                  foregroundColor: Colors.white,
                ),
                child: const Text("확인"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "FEMC 필터",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 12,
                spacing: 8,
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
