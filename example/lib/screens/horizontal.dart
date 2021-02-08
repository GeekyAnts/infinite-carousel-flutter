import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../mock_data.dart';

class Horizontal extends StatefulWidget {
  @override
  _HorizontalState createState() => _HorizontalState();
}

class _HorizontalState extends State<Horizontal> {
  // Wheater to loop through elements
  bool _loop = true;

  // Scroll controller for carousel
  InfiniteScrollController _controller;

  // Maintain current index of carousel
  int _selectedIndex = 0;

  // Width of each item
  double _itemExtent;

  // Get screen width of viewport.
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: _selectedIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemExtent = screenWidth - 200;
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal Example')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: InfiniteCarousel.builder(
                itemCount: kDemoImages.length,
                itemExtent: _itemExtent,
                loop: _loop,
                controller: _controller,
                onIndexChanged: (index) {
                  if (_selectedIndex != index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
                },
                itemBuilder: (context, itemIndex, realIndex) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        _controller.animateToItem(realIndex);
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
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Current Index: $_selectedIndex'),
            SwitchListTile(
              title: Text('Loop'),
              value: _loop,
              onChanged: (newValue) {
                setState(() {
                  _loop = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton.icon(
                  label: Text('Left'),
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    _controller.previousItem();
                  },
                ),
                RaisedButton.icon(
                  label: Text('Right'),
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    _controller.nextItem();
                  },
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text('Adjustable Item Extent'),
            Slider(
              min: 100.0,
              max: screenWidth - 100.0,
              value: _itemExtent,
              onChanged: (newValue) {
                setState(() {
                  _itemExtent = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
