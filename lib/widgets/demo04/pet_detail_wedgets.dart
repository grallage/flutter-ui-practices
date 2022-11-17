import 'package:flutter/material.dart';

class TopBanner01 extends StatelessWidget {
  const TopBanner01({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      expandedHeight: 230.0,
      floating: false,
      pinned: true,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TopBanner02 extends StatelessWidget {
  const TopBanner02({
    Key? key,
    required this.image,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  final String image;
  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      // This widget takes the overlapping behavior of the SliverAppBar,
      // and redirects it to the SliverOverlapInjector below. If it is
      // missing, then it is possible for the nested "inner" scroll view
      // below to end up under the SliverAppBar even when the inner
      // scroll view thinks it has not been scrolled.
      // This is not necessary if the "headerSliverBuilder" only builds
      // widgets that do not overlap the next sliver.
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        title: const Text('Pet'), // This is the title in the app bar.
        pinned: true,
        expandedHeight: 150.0,
        // The "forceElevated" property causes the SliverAppBar to show
        // a shadow. The "innerBoxIsScrolled" parameter is true when the
        // inner scroll view is scrolled beyond its "zero" point, i.e.
        // when it appears to be scrolled below the SliverAppBar.
        // Without this, there are cases where the shadow would appear
        // or not appear inappropriately, because the SliverAppBar is
        // not actually aware of the precise position of the inner
        // scroll views.
        forceElevated: innerBoxIsScrolled,
        // bottom: TabBar(
        //   // These are the widgets to put in each tab in the tab bar.
        //   tabs: tabs.map((String name) => Tab(text: name)).toList(),
        // ),
      ),
    );
  }
}
