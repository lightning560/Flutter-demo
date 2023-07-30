import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class StaggeredGridContainer extends StatefulHookConsumerWidget {
  List<Widget> cards;
  StaggeredGridContainer({super.key, required this.cards});
  @override
  ConsumerState<StaggeredGridContainer> createState() =>
      _StaggeredGridContainerState();
}

class _StaggeredGridContainerState
    extends ConsumerState<StaggeredGridContainer> {
  ///流式布局
  Widget waterFall() {
    double spacing = 6;

    ///自由排布的gridview
    return MasonryGridView.count(
      shrinkWrap: true, //key
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      itemCount: widget.cards.length,
      itemBuilder: (BuildContext context, int index) => widget.cards[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return waterFall();
  }
}
