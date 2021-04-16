import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../mock_data.dart';

class Complex extends StatefulWidget {
  @override
  _ComplexState createState() => _ComplexState();
}

class _ComplexState extends State<Complex> {
  double _anchor = 0.0;
  bool _center = true;
  double _velocityFactor = 0.2;
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
      appBar: AppBar(title: Text('Complex Example')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: InfiniteCarousel.builder(
                itemCount: kDemoImages.length,
                itemExtent: 120,
                center: _center,
                anchor: _anchor,
                velocityFactor: _velocityFactor,
                controller: _controller,
                itemBuilder: (context, itemIndex, realIndex) {
                  final currentOffset = 120 * realIndex;
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final diff = (_controller.offset - currentOffset);
                      final maxPadding = 10.0;
                      final _carouselRatio = 120 / maxPadding;

                      return Padding(
                        padding: EdgeInsets.only(
                          top: (diff / _carouselRatio).abs(),
                          bottom: (diff / _carouselRatio).abs(),
                        ),
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
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
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Center selected element'),
              value: _center,
              onChanged: (newValue) {
                setState(() {
                  _center = newValue;
                });
              },
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
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
