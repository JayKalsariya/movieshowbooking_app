import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carouselImg({
  required Size size,
  required String carouselImg,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Popular',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          // reverse: true,
          height: size.height * 0.25,
          autoPlayInterval: const Duration(milliseconds: 1500),
          enableInfiniteScroll: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeCenterPage: true,
        ),
        items: List.generate(
          carouselImg.length,
          (index) => Container(
            width: size.width * 0.92,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(index as String),
            ),
          ),
        ),
      )
    ],
  );
}
