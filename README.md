# Infinite scroll for AngularDart

Port of Brandon Tilley's [ngInfiniteScroll](http://binarymuse.github.io/ngInfiniteScroll)
for [AngularDart](http://pub.dartlang.org/packages/angular).

## Usage

First, import the package and register the module:

    import 'package:yoke/ng_infinite_scroll/ng_infinite_scroll.dart';

    class MyModule extends Module {
        MyModule() {
            install(new InfiniteScrollModule());
        }
    }

Next, use the directive in your template:

    <div infinite-scroll="ctrl.loadMore()" infinite-scroll-disabled="ctrl.loading" infinite-scroll-distance="3"></div>

See the [documentation of ngInfiniteScroll](http://binarymuse.github.io/ngInfiniteScroll/documentation.html)
for details.
