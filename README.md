# Infinite Carousel

_Infinite Carousel_ is a flutter carousel widget that supports infinite looping and gives precise control over selected item anchor and carousel scroll velocity.

You can easily customize the placement of selected element on the viewport, and increase/decrease scroll speed.

Based on Flutter's ListWheelScrollView to create smooth scroll effects.

# Usage

Add the package to `pubspec.yaml`

```yaml
dependencies:
  infinite_carousel: 0.0.1
```

After that import the package.

```dart
import 'package:infinite_carousel/infinite_carousel.dart';
```

```dart
InfiniteCarousel.builder(
  itemCount: 10,
  itemExtent: 120,
  center: true,
  anchor: 0.0,
  velocityFactor: 0.2,
  onIndexChanged: (index) {},
  controller: controller,
  axisDirection: Axis.horizontal,
  loop: true,
  itemBuilder: (context, itemIndex, realIndex) {
  },
)
```

## Controller

It also supports its own scroll controller called _`InfiniteScrollController`_ which has number of useful methods to programmatically control the carousel.

- You can pass initialItem in the constructor.
- animateToItem(index)
- jumpToItem(index)
- nextItem()
- previousItem()

# Attributes

| Attribute      | Data Type                                                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default Value            |
| -------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| itemCount      | int                                                         | Total number of items.                                                                                                                                                                                                                                                                                                                                                                                                                                         | Required                 |
| itemExtent     | double                                                      | Size of single item in viewport. If axis is horizontal, then this corresponds to width of item, else height of the item.                                                                                                                                                                                                                                                                                                                                       | Required                 |
| itemBuilder    | Widget Function(BuildContext, int itemIndex, int realIndex) | To lazily build items on the viewport. When Loop is false, ItemIndex is equal to RealIndex (i.e, index of element). When loop is true, two indexes are exposed by item builder. One is itemIndex, that is the modded item index i.e., for list of 10, position(11) = 1, and position(-1) = 9. Other is realIndex, that is the actual index, i.e. [..., -2, -1, 0, 1, 2, ...] in loop. Real Index is needed if you want to support JumpToItem by tapping on it. | Required                 |
| physics        | ScrollPhysics                                               | Defaults to InfiniteScrollPhysics, which makes sure we always land on a particular item after scrolling.                                                                                                                                                                                                                                                                                                                                                       | InfiniteScrollPhysics    |
| controller     | ScrollController                                            | Scroll Controller for the carousel.                                                                                                                                                                                                                                                                                                                                                                                                                            | InfiniteScrollController |
| onIndexChanged | void Function(int)                                          | Callback that includes new selected index.                                                                                                                                                                                                                                                                                                                                                                                                                     |                          |
| anchor         | double                                                      | Where to place selected item on the viewport. Ranges from 0 to 1. 0.0 means selected item is aligned to start of the viewport, and 1.0 meaning selected item is aligned to end of the viewport. This property is ignored when center is set to true.                                                                                                                                                                                                           | 0.0                      |
| loop           | bool                                                        | Whether to create a infinite looping list                                                                                                                                                                                                                                                                                                                                                                                                                      | true                     |
| velocityFactor | double                                                      | Increase/Decrease velocity of carousel scrolling to this factor.                                                                                                                                                                                                                                                                                                                                                                                               | 0.2                      |
| axisDirection  | Axis                                                        | Axis direction of carousel.                                                                                                                                                                                                                                                                                                                                                                                                                                    | Axis.horizontal          |
| center         | bool                                                        | Align selected item to center of the viewport. When this is true, anchor property is ignored.                                                                                                                                                                                                                                                                                                                                                                  | true                     |


