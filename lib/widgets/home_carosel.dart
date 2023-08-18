import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> imageAssets = [
      'assets/images/advert_one.png',
      'assets/images/advert_two.png',
    ];
    return Center(
      child: CarouselSlider.builder(
        itemCount: imageAssets.length,
        options: CarouselOptions(
          height: 112,
          viewportFraction: 1,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 112,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageAssets[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
