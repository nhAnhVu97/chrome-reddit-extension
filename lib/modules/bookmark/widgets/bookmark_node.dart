import 'package:chrome_ext/core/shared/utils/helper.dart';
import 'package:chrome_ext/core/shared/widgets/gap.dart';
import 'package:chrome_ext/core/shared/widgets/hovering.dart';
import 'package:chrome_ext/modules/bookmark/quick_access_controller.dart';
import 'package:chrome_extension/bookmarks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:signals/signals_flutter.dart';
import 'package:system_theme/system_theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BookMarkNode extends StatelessWidget {
  final BookmarkTreeNode bookmark;
  final double padding;
  final bool isFirst;
  final bool isQuickAccessTab;
  final int? color;

  final QuickAccessController controller;

  const BookMarkNode({
    required this.bookmark,
    this.padding = 0,
    this.isFirst = true,
    this.isQuickAccessTab = false,
    this.color,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (bookmark.children?.isEmpty ?? true) {
      return Padding(
        padding: EdgeInsets.only(left: padding, bottom: 4),
        child: Watch((context) {
          final savedFavorited = controller.savedFavoritedList.value;
          final favorited = savedFavorited.any((element) => element["title"] == bookmark.title);

          int? color;

          if (favorited) {
            color = savedFavorited.firstWhere((e) => e['title'] == bookmark.title)["color"] as int?;
          }

          return _buildListItem(
            context: context,
            title: bookmark.title,
            url: bookmark.url ?? "",
            favorited: favorited,
            color: color,
          );
        }),
      );
    }

    final children = sortNodes(bookmark.children ?? []);

    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: ExpansionTile(
        initiallyExpanded: isFirst,
        shape: const Border(),
        backgroundColor: isFirst ? null : Colors.white.withOpacity(.05),
        childrenPadding: EdgeInsets.zero,
        dense: true,
        title: Row(
          children: [
            const Icon(Icons.folder_zip_rounded),
            const Gap(8),
            Text(
              bookmark.title,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        children: children
            .map((child) => BookMarkNode(
                  controller: controller,
                  bookmark: child,
                  padding: padding + 8,
                  isFirst: false,
                ))
            .toList(),
      ),
    );
  }

  Hovering _buildListItem({
    required BuildContext context,
    required String title,
    required String url,
    bool favorited = false,
    int? color,
  }) {
    final colorTheme = Theme.of(context).colorScheme;

    return Hovering(
      builder: (_, isHover) {
        return Stack(
          children: [
            ListTile(
              tileColor: color == null ? null : Color(color).withOpacity(.1),
              title: Text(
                title,
                maxLines: 3,
                style: const TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                url,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  color: SystemTheme.accentColor.accent,
                ),
              ),
              leading: color == null
                  ? null
                  : Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(color: Color(color), borderRadius: BorderRadius.circular(99)),
                    ),
              trailing: isQuickAccessTab
                  ? IconButton(
                      icon: const Icon(Icons.color_lens_outlined),
                      onPressed: () {
                        Color? selectedColor;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: const Color(0xff443a49),
                                  hexInputBar: true,
                                  labelTypes: const [],
                                  portraitOnly: true,
                                  onColorChanged: (value) {
                                    selectedColor = value;
                                  },
                                  pickerAreaBorderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Done'),
                                  onPressed: () {
                                    if (selectedColor != null) {
                                      controller.updateColor(title, selectedColor!.value);
                                    }

                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        favorited ? Icons.star_rounded : Icons.star_border_rounded,
                        color: favorited ? SystemTheme.accentColor.accent : Colors.white,
                      ),
                      onPressed: () {
                        controller.setFavorite(title, isRemove: favorited);
                      },
                    ),
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                launchUrlString(url);
              },
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: VerticalDivider(
                color: isHover ? SystemTheme.accentColor.accent : colorTheme.surfaceContainer,
                thickness: 3,
                width: 1,
              ),
            )
          ],
        );
      },
    );
  }
}
