library angular_infinite_scroll;

import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';

@NgDirective(selector: "[infinite-scroll]",
map: const {
    'infinite-scroll': '@exp',
    'infinite-scroll-disabled': '=>scrollDisabled',
    'infinite-scroll-distance': '=>scrollDistance',
    'infinite-scroll-immediate-check': '=>immediateCheck'
})
class InfiniteScrollDirective implements NgDetachAware {

  final Scope _scope;
  final Element _element;
  final Window _window;

  String exp;
  int scrollDistance = 0;
  bool immediateCheck = true;

  bool _checkWhenEnabled = false;
  bool _scrollEnabled = true;

  StreamSubscription _sub;

  set scrollDisabled(disabled) {
    _scrollEnabled = !disabled;
    if (_scrollEnabled && _checkWhenEnabled) {
      _checkWhenEnabled = false;
      _checkScrolled();
    }
  }

  InfiniteScrollDirective(this._element, this._scope, this._window) {
    _sub = _window.onScroll.listen(_checkScrolled);

    scheduleMicrotask(() {
      if (immediateCheck)
        _checkScrolled();
    });
  }

  void _checkScrolled([e]) {
    int windowBottom = _window.innerHeight + _window.pageYOffset;
    int elementBottom = _element.offsetTop + _element.clientHeight;
    int remaining = elementBottom - windowBottom;
    bool shouldScroll = remaining <= _window.innerHeight * scrollDistance;

    if (shouldScroll) {
      if (_scrollEnabled) {
        _scope.$eval(exp);
      } else {
        _checkWhenEnabled = true;
      }
    }
  }

  void detach() {
    _sub.cancel();
  }
}

class InfiniteScrollModule extends Module {
  InfiniteScrollModule() {
    type(InfiniteScrollDirective);
  }
}
