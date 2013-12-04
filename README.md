# Infinite Scrolling for AngularDart

[AngularDart](http://pub.dartlang.org/packages/angular)-port of Brandon Tilley's
[ngInfiniteScroll](http://binarymuse.github.io/ngInfiniteScroll).

## Usage

First, import the package and register the module:

    import 'package:ng_infinite_scroll/ng_infinite_scroll.dart';

    class MyModule extends Module {
        MyModule() {
            install(new InfiniteScrollModule());
        }
    }

Next, use the directive in your template:

    <div infinite-scroll="ctrl.loadMore()" infinite-scroll-disabled="ctrl.loading" infinite-scroll-distance="3"></div>

This directive supports the same options as the original version, so check the
[documentation of ngInfiniteScroll](http://binarymuse.github.io/ngInfiniteScroll/documentation.html)
for details.
