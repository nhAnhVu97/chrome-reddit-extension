import 'dart:convert';

import 'package:chrome_ext/core/constants/bookmarks_sample.dart';
import 'package:chrome_ext/core/data/local/shared_pref.dart';
import 'package:chrome_ext/core/shared/utils/helper.dart';
import 'package:chrome_ext/injector_setup.dart';
import 'package:chrome_extension/bookmarks.dart';
import 'package:flutter/foundation.dart';
import 'package:signals/signals_flutter.dart';

class QuickAccessController {
  QuickAccessController() {
    _getBookmarkTree();
  }

  final _sharedPref = injector.get<SharedPref>();

  final bookmark = AsyncSignal<List<BookmarkTreeNode>>(AsyncState.loading(), debugLabel: "bookmark");

  late final bookmarkTree = computed(() {
    return bookmark.value.maybeMap(
      data: (value) => value.first.children?.where((el) => el.title == "Bookmarks Bar").toList() ?? <BookmarkTreeNode>[],
      orElse: () => <BookmarkTreeNode>[],
    );
  }, debugLabel: 'bookmarkBar');

  late final savedFavoritedList = computed(() {
    return _sharedPref.favorite.value.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }, debugLabel: "savedFavoritedList");

  late final bookmarkFavorited = computed(() {
    final titles = savedFavoritedList.value.map((e) => e['title'] as String).toList();
    final values = searchByTitles(bookmarkTree.value, titles);
    return values;
  }, debugLabel: "bookmarkFavorited");

  Future<void> _getBookmarkTree() async {
    try {
      bookmark.value = const AsyncLoading();
      List<BookmarkTreeNode> data = [];
      if (kDebugMode) {
        data = bookmarks;
      } else {
        data = await chrome.bookmarks.getTree();
      }
      bookmark.value = AsyncData<List<BookmarkTreeNode>>(data);
    } catch (error) {
      bookmark.value = AsyncError(error, null);
    }
  }

  void setFavorite(String title, {bool isRemove = false}) {
    if (isRemove) {
      final list = List<String>.from(_sharedPref.favorite.value);
      list.removeWhere((el) => (jsonDecode(el) as Map<String, dynamic>)["title"] == title);
      _sharedPref.favorite.value = list;
      return;
    }

    _sharedPref.favorite.value = [
      ..._sharedPref.favorite.value,
      jsonEncode({"title": title, "color": null})
    ];
  }

  void updateColor(String title, int color) {
    final list = List<Map<String, dynamic>>.from(savedFavoritedList.value);
    list[list.indexWhere((e) => e["title"] == title)]["color"] = color;
    _sharedPref.favorite.value = list.map((e) => jsonEncode(e)).toList();
  }
}
