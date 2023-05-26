import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../mock_data.dart';

class Vertical extends StatefulWidget {
  const Vertical({super.key});

  @override
  State<Vertical> createState() => _VerticalState();
}

class _VerticalState extends State<Vertical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vertical Example')),
      body: SafeArea(
        child: InfiniteCarousel.builder(
          itemCount: kDemoImages.length,
          itemExtent: 300,
          loop: true,
          axisDirection: Axis.vertical,
          scrollBehavior: kIsWeb
              ? ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    // Allows to swipe in web browsers
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse
                  },
                )
              : null,
          itemBuilder: (context, itemIndex, realIndex) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: kElevationToShadow[2],
                  image: DecorationImage(
                    image: NetworkImage(kDemoImages[itemIndex]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
