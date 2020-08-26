import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonTextSelectionGestureDetectorBuilder
    extends ExtendedTextSelectionGestureDetectorBuilder {
  CommonTextSelectionGestureDetectorBuilder({
    @required ExtendedTextSelectionGestureDetectorBuilderDelegate delegate,
    @required Function showToolbar,
    @required Function hideToolbar,
    @required GestureTapUpCallback onTapUp,
    @required BuildContext context,
    @required Function requestKeyboard,
  })  : _hideToolbar = hideToolbar,
        _onTapUp = onTapUp,
        _context = context,
        _requestKeyboard = requestKeyboard,
        super(delegate: delegate, showToolbar: showToolbar);

  final Function _hideToolbar;

  final GestureTapUpCallback _onTapUp;

  final BuildContext _context;

  final Function _requestKeyboard;

  @override
  void onForcePressStart(ForcePressDetails details) {
    super.onForcePressStart(details);
    if (delegate.selectionEnabled && shouldShowSelectionToolbar) {
      showToolbar();
    }
  }

  @override
  void onForcePressEnd(ForcePressDetails details) {
    // Not required.
  }

  @override
  void onSingleLongTapMoveUpdate(LongPressMoveUpdateDetails details) {
    if (delegate.selectionEnabled) {
      switch (Theme.of(_context).platform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          renderEditable.selectPositionAt(
            from: details.globalPosition,
            cause: SelectionChangedCause.longPress,
          );
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          renderEditable.selectWordsInRange(
            from: details.globalPosition - details.offsetFromOrigin,
            to: details.globalPosition,
            cause: SelectionChangedCause.longPress,
          );
          break;
      }
    }
  }

  @override
  void onSingleTapUp(TapUpDetails details) {
    _hideToolbar();
    if (delegate.selectionEnabled) {
      switch (Theme.of(_context).platform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          renderEditable.selectWordEdge(cause: SelectionChangedCause.tap);
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          renderEditable.selectPosition(cause: SelectionChangedCause.tap);
          break;
      }
    }
    _requestKeyboard?.call();
    _onTapUp?.call(details);
  }

  @override
  void onSingleLongTapStart(LongPressStartDetails details) {
    switch (Theme.of(_context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        renderEditable.selectPositionAt(
          from: details.globalPosition,
          cause: SelectionChangedCause.longPress,
        );
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        renderEditable.selectWord(cause: SelectionChangedCause.longPress);
        Feedback.forLongPress(_context);
        break;
    }
  }
}