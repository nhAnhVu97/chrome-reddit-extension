import 'package:chrome_extension/bookmarks.dart';

List<BookmarkTreeNode> sortNodes(List<BookmarkTreeNode> nodes) {
  // Define a comparator to sort nodes based on whether they have children
  int compareNodes(BookmarkTreeNode a, BookmarkTreeNode b) {
    if ((a.children ?? []).isNotEmpty && (b.children ?? []).isEmpty) {
      return -1; // a should come before b
    } else if ((a.children ?? []).isEmpty && (b.children ?? []).isNotEmpty) {
      return 1; // b should come before a
    } else {
      return 0; // maintain original order
    }
  }

  // Sort nodes based on the comparator
  nodes.sort(compareNodes);

  return nodes;
}

List<BookmarkTreeNode> searchByTitles(List<BookmarkTreeNode> nodes, List<String> titles) {
  final List<BookmarkTreeNode> results = [];
  final titleSet = titles.toSet(); // Convert list to set for faster lookup

  void searchNode(BookmarkTreeNode node) {
    if (titleSet.contains(node.title)) {
      results.add(node);
    }
    for (final child in node.children ?? <BookmarkTreeNode>[]) {
      searchNode(child);
    }
  }

  for (final node in nodes) {
    searchNode(node);
  }

  return results;
}
