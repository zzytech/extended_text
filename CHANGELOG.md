## [0.6.6]

* Fix kMinInteractiveSize is missing in high version of flutter
* Fix text overflow about WidgetSpan

## [0.6.4]

* Improve codes about selection
* Select all SpecialTextSpan which deleteAll is true when double tap or long tap

## [0.6.3]

* Fix issue [ImageSpan is not TextSpan](https://github.com/fluttercandies/extended_text/issues/24)

## [0.6.2]

* Fix wrong selection offset
* Fix wrong text clip due to overflowspan

## [0.6.1]

* Fix issue [type 'List<InlineSpan>' is not a subtype of type 'List<TextSpan>'](https://github.com/fluttercandies/extended_text/issues/20)

## [0.6.0]

* Improve codes base on v1.7.8
* Support WidgetSpan (ExtendedWidgetSpan)

## [0.5.8]

* Breaking change: 
  Remove background parameter of [OverFlowTextSpan]

## [0.5.7]

* Issue: 
  Fix textEditingValue and textSelectionControls are not update when didUpdateWidget

## [0.5.4]

* Feature: 
  Support text selection
* Issue: 
   Fix issue about rect of overFlowTextSpan 

## [0.5.3]

* Update extended_text_library

## [0.5.2]

* Update path_provider 1.1.0

## [0.5.0]

* Update extended_text_library
  Remove caretIn parameter(SpecialTextSpan)
  DeleteAll parameter has the same effect as caretIn parameter(SpecialTextSpan)

## [0.4.9]

* Fix wrong background rect of OverFlowTextSpan when over flow area has image span

## [0.4.8]

* Fix wrong background rect of OverFlowTextSpan(issue 6)

## [0.4.7]

* Disabled informationCollector to keep backwards compatibility for now (ExtendedNetworkImageProvider)

## [0.4.5]

* Add GestureRecognizer for ImageSpan
* Add demo to show image in photo view

## [0.4.3]

* Handle image span load failed

## [0.4.2]

* Update extended_text_library for cache folder is changed

## [0.4.0]

* Update extended_text_library for BackgroundTextSpan

## [0.3.9]

* Override compareTo method in BackgroundTextSpan and OverFlowTextSpan to
  Fix issue that it was error rendering

## [0.3.8]

* Import extended_text_library

## [0.3.4]

* Fix issue that tap exception throw when use OverFlowTextSpan

## [0.3.1]

* Add clearFailedCache parameter for CachedNetworkImage
  Add clearLoadFailedImageMemoryCache method
  Both them are used to clear image load failed memory cache, so that image will be reloaded

## [0.2.9]

* Update path_provider version from 0.4.1 to 0.5.0+1

## [0.2.8]

* Change SpecialTextGestureTapCallback input from string to dynamic
 
## [0.2.7]

* Change BeforePaintImage function to BeforePaintTextImage 
  Change AfterPaintImage function to AfterPaintTextImage 

## [0.2.5]

* Fix issue that BackgroundTextSpan has error clip.

## [0.2.4]

* Add TextPainter wholeTextPainter for BackgroundTextSpan's paintBackground call back,so that you can get info for
  whole text painter. 

## [0.2.2]

* Fix issue that find TextPosition near overflow is not accurate.

## [0.2.1]

* Use ExtendedTextOverflow to replace TextOverflow(new flutter sdk TextOverflow has new value TextOverflow.visible)

## [0.1.8]

* Suport inline image, custom background ,custom over flow.
