import 'package:chrome_ext/core/data/local/shared_pref.dart';
import 'package:chrome_ext/core/data/models/post/reddit_post_response.dart';
import 'package:chrome_ext/core/data/network/api_service.dart';
import 'package:chrome_ext/core/shared/widgets/gap.dart';
import 'package:chrome_ext/core/shared/widgets/hovering.dart';
import 'package:chrome_ext/injector_setup.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:system_theme/system_theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _textCtrl = TextEditingController();

  final _isAdding = signal<bool>(false);
  final _pref = signal(injector<SharedPref>());

  late final _isReachedMax = computed(() => _pref().tags.value.length == 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Watch((context) {
              if (_isReachedMax.value) return const SizedBox();
              if (_isAdding.value) {
                return _buildTextField();
              }

              return _addBtn();
            }),
            _listChip(),
            Expanded(
              child: Watch((_) {
                final savedTags = _pref().tags.value;
                return Row(children: savedTags.map((tag) => Expanded(child: RedditPost(tag: tag))).toList());
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _listChip() {
    return Scrollbar(
      child: Watch((context) {
        final tags = _pref().tags.value;
        if (tags.isEmpty) return const SizedBox(height: 20);
        return SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildChip(tags[index]);
            },
            separatorBuilder: (context, index) => const Gap(12),
            itemCount: tags.length,
          ),
        );
      }),
    );
  }

  Widget _buildChip(String label) {
    final textTheme = Theme.of(context).textTheme;
    return Chip(
      shape: RoundedRectangleBorder(side: BorderSide(color: SystemTheme.accentColor.accent), borderRadius: BorderRadius.circular(24)),
      label: Text(
        label,
        style: textTheme.titleMedium,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      deleteIcon: const Icon(Icons.close, size: 18),
      deleteIconBoxConstraints: const BoxConstraints(maxHeight: 24),
      onDeleted: () {
        final list = List<String>.from(_pref().tags.value);
        list.removeWhere((e) => e == label);
        _pref().tags.value = list;
      },
    );
  }

  Widget _buildTextField() {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: _textCtrl,
            decoration: InputDecoration(
              hintText: 'Enter reddit tag',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: SystemTheme.accentColor.accent),
              ),
            ),
          ),
        ),
        const Gap(12),
        IconButton(
          onPressed: () {
            _pref().tags.value = [
              ..._pref().tags.value,
              _textCtrl.text,
            ];
            _isAdding.value = false;
            _textCtrl.clear();
          },
          icon: const Icon(Icons.check_rounded),
        ),
        const Gap(12),
        IconButton(
          onPressed: () => _isAdding.value = false,
          icon: const Icon(Icons.close_rounded),
        ),
      ],
    );
  }

  Widget _addBtn() {
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: () => _isAdding.value = true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.add_rounded),
          const Gap(8),
          Text(
            "Add",
            style: textTheme.titleMedium?.copyWith(color: Theme.of(context).buttonTheme.colorScheme?.primary),
          ),
        ],
      ),
    );
  }
}

class RedditPost extends StatefulWidget {
  final String tag;
  const RedditPost({
    super.key,
    required this.tag,
  });

  @override
  State<RedditPost> createState() => _RedditPostState();
}

class _RedditPostState extends State<RedditPost> {
  final _apiService = injector<ApiService>();
  final _pref = signal<SharedPref>(injector<SharedPref>());

  late FutureSignal<RedditPostResponse> posts;

  @override
  void initState() {
    posts = futureSignal(() => _apiService.fetchHotPosts(widget.tag), debugLabel: "fetchPosts");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Watch((context) {
      final postsAsync = posts.value;

      if (postsAsync.isLoading) {
        return const SizedBox(
          height: 52,
          width: 52,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (postsAsync is AsyncError) {
        return const Center(child: Text("Error"));
      }

      final list = postsAsync.value?.data?.children;

      if (list == null || list.isEmpty) {
        return const Center(child: Text("Empty"));
      }

      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${list.first.data?.subredditNamePrefixed}',
              style: textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final post = list[index];
                  final savedRead = _pref().readPost.value;
                  final isRead = savedRead.contains(post.data?.permalink);

                  return Hovering(
                    builder: (_, isHover) {
                      return Stack(
                        children: [
                          ListTile(
                            title: Text(
                              "${post.data?.title}",
                              maxLines: 2,
                              style: textTheme.titleMedium,
                            ),
                            isThreeLine: true,
                            subtitle: StyledText(
                              text: 'Author: <name>r/${post.data?.author}</name> Score: <score>${post.data?.score ?? 0}</score>',
                              tags: {
                                'name': StyledTextTag(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: SystemTheme.accentColor.accent,
                                  ),
                                ),
                                'score': StyledTextTag(
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              },
                            ),
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            onTap: () {
                              _pref().readPost.value = [
                                ..._pref().readPost.value,
                                post.data?.permalink ?? "",
                              ];
                              launchUrlString(
                                "https:/reddit.com${post.data?.permalink ?? ""}",
                                webOnlyWindowName: "_blank",
                              );
                            },
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            child: VerticalDivider(
                              color: isRead
                                  ? Colors.white.withOpacity(.5)
                                  : isHover
                                      ? SystemTheme.accentColor.accent
                                      : colorTheme.surfaceContainer,
                              thickness: 3,
                              width: 1,
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                itemCount: list.length,
                separatorBuilder: (context, index) => const Gap(4),
              ),
            ),
          ],
        ),
      );
    });
  }
}
