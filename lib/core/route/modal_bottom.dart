// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mbs;

class MaterialModalBottomSheet extends Page<void> {
  final Widget child;
  final bool enableDrag;
  final bool expand;

  const MaterialModalBottomSheet({
    required this.child,
    this.expand = false,
    this.enableDrag = true,
  });

  Route<void> createRoute(BuildContext context) {
    return mbs.ModalBottomSheetRoute(
      containerBuilder: (context, _, child) => _MaterialBottomSheetContainer(
        topRadius: const Radius.circular(20),
        child: child,
      ),
      settings: this,
      builder: (context) => child,
      expanded: expand,
    );
  }
}

const double _kPreviousPageVisibleOffset = 25;
const BoxShadow _kDefaultBoxShadow = BoxShadow(
  blurRadius: 10,
  color: Colors.black12,
  spreadRadius: 5,
);

class _MaterialBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final Radius topRadius;

  const _MaterialBottomSheetContainer({
    Key? key,
    required this.child,
    required this.topRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final topPadding = topSafeAreaPadding + _kPreviousPageVisibleOffset;
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding, bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.vertical(top: topRadius),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [_kDefaultBoxShadow],
            borderRadius: BorderRadius.vertical(top: topRadius),
          ),
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true, //Remove top Safe Area
            child: child,
          ),
        ),
      ),
    );
  }
}
