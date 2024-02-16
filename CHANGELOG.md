## 1.1.1

- Lower Dart SDK version to 3.2.1

## 1.1.0

- Add alternate scroll physics:- `PageViewTypeScrollPhysics`.

Similar to PageView scroll physics. This disables friction effect and allows the user to land on the next item only most of the time, instead of the free-hand scrolling that is provided with the default `InfiniteScrollPhysics`.

- Fixed issue:- 'FixedScrollMetrics' is not a subtype of type 'InfiniteExtentMetrics' in type cast. Thanks to [PR #19](https://github.com/GeekyAnts/infinite-carousel-flutter/pull/19)
- Update package to support Flutter 3.19

## 1.0.3

- Upgrade package to support flutter 3.10
- Add missing `devicePixelRatio` parameter and replace deprecated methods. Thanks to [PR #11](https://github.com/GeekyAnts/infinite-carousel-flutter/pull/11)
- Update example app to fix Android embedding v1 errors.

## 1.0.2

- Add support to set custom `ScrollBehavior` to widget. Fixes [this issue](https://github.com/GeekyAnts/infinite-carousel-flutter/issues/7).

## 1.0.1

- Fix: Null check operator used on null value.

## 1.0.0

- Add null Safety support.

## 0.0.2

- Update example gifs for different variants.

## 0.0.1

- Initial release.
- Support infinite looping.
- Add anchor control and center attribute.
- Add scroll velocity control attribute.
