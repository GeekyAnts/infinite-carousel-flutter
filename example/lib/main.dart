import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import 'mock_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Infinite Carousel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InfiniteScrollController controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: InfiniteCarousel.builder(
              itemCount: kDemoImages.length,
              itemExtent: 120,
              center: false,
              anchor: 0.1,
              velocityFactor: 0.5,
              onIndexChanged: (index) {
                if (selectedIndex != index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }
              },
              controller: controller,
              itemBuilder: (context, itemIndex, realIndex) {
                final currentOffset = 120 * realIndex;
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final diff = (controller.offset - currentOffset);
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
                    child: GestureDetector(
                      onTap: () {
                        controller.animateToItem(realIndex);
                      },
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
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text('$selectedIndex'),
        ],
      ),
    );
  }
}
