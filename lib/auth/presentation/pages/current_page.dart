import 'package:flutter/material.dart';

import '../../domain/cubit/auth_state.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({required this.pages, required this.pageIndex, Key? key}) : super(key: key);

  final List<PageItem> pages;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        duration: const Duration(milliseconds: 600),
        child: pages[pageIndex].page
      ),
    );
  }
}
