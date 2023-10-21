import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _index = 1;
  void _onChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) => _onChanged(index),
            aspectRatio: 1,
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Image.asset(
                      "assets/images/banner_example.png",
                      fit: BoxFit.cover,
                      width: viewportWidth,
                      height: viewportWidth,
                    ),
                    const Positioned(
                      left: 0,
                      bottom: 76,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "내 정확한 패션 스타일을 알려주는\n패션 MBTI 테스트",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "테스트 하러가기",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.chevron_right, color: Colors.white)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 16,
          bottom: 20,
          child: Row(
            children: [0, 1, 2, 3, 4]
                .map(
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: _index == i ? 40 : 6,
                    height: 2,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color:
                          _index == i ? Colors.white : const Color(0x99ffffff),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
