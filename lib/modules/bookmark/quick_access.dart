import 'package:chrome_ext/core/shared/widgets/gap.dart';
import 'package:chrome_ext/modules/bookmark/quick_access_controller.dart';
import 'package:chrome_ext/modules/bookmark/widgets/bookmark_node.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class QuickAccess extends StatefulWidget {
  const QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  final _ctrl = QuickAccessController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabBar.secondary(
              labelPadding: EdgeInsets.zero,
              tabs: [
                Tab(
                  icon: Icon(Icons.star_border_rounded),
                  text: "Quick access",
                ),
                Tab(
                  icon: Icon(Icons.bookmark_border_rounded),
                  text: "Bookmark",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                // -- Quick access
                Watch((context) {
                  if (_ctrl.bookmark.value.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (_ctrl.bookmark.value.hasError) {
                    return Text('${_ctrl.bookmark.value.error}');
                  }

                  final list = _ctrl.bookmarkFavorited.value;

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return BookMarkNode(
                        controller: _ctrl,
                        bookmark: item,
                        isQuickAccessTab: true,
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(8),
                    itemCount: list.length,
                  );
                }),

                // -- Bookmark
                Watch((context) {
                  if (_ctrl.bookmark.value.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (_ctrl.bookmark.value.hasError) {
                    return Text('${_ctrl.bookmark.value.error}');
                  }

                  final bookmarkBar = _ctrl.bookmarkTree.value;

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final item = bookmarkBar[index];
                      return BookMarkNode(
                        controller: _ctrl,
                        bookmark: item,
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(8),
                    itemCount: bookmarkBar.length,
                  );
                })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
