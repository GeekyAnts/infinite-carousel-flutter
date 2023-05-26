import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../mock_data.dart';

class Complex extends StatefulWidget {
  const Complex({super.key});

  @override
  State<Complex> createState() => _ComplexState();
}

class _ComplexState extends State<Complex> {
  double _anchor = 0.0;
  bool _center = true;
  double _velocityFactor = 0.2;
  final double _itemExtent = 120;
  late InfiniteScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex Example')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: InfiniteCarousel.builder(
                itemCount: kDemoImages.length,
                itemExtent: _itemExtent,
                center: _center,
                anchor: _anchor,
                velocityFactor: _velocityFactor,
                scrollBehavior: kIsWeb
                    ? ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          // Allows to swipe in web browsers
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse
                        },
                      )
                    : null,
                controller: _controller,
                itemBuilder: (context, itemIndex, realIndex) {
                  final currentOffset = _itemExtent * realIndex;
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final diff = (_controller.offset - currentOffset);
                      const maxPadding = 10.0;
                      final carouselRatio = _itemExtent / maxPadding;

                      return Padding(
                        padding: EdgeInsets.only(
                          top: (diff / carouselRatio).abs(),
                          bottom: (diff / carouselRatio).abs(),
                        ),
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
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
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Center selected element'),
              value: _center,
              onChanged: (newValue) {
                setState(() {
                  _center = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            if (!_center) ...[
              Text('Selected Item Anchor: ${_anchor.toStringAsFixed(2)}'),
              Slider(
                min: 0.0,
                max: 1.0,
                value: _anchor,
                onChanged: (value) {
                  setState(() {
                    _anchor = value;
                  });
                },
              ),
            ],
            const SizedBox(height: 20),
            Text('Velocity Factor: ${_velocityFactor.toStringAsFixed(2)}'),
            Slider(
              min: 0.1,
              max: 1.0,
              value: _velocityFactor,
              onChanged: (value) {
                setState(() {
                  _velocityFactor = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
