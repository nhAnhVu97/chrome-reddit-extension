// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPostResponse _$RedditPostResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RedditPostResponse',
      json,
      ($checkedConvert) {
        final val = RedditPostResponse(
          kind: $checkedConvert('kind', (v) => v as String?),
          data: $checkedConvert(
              'data',
              (v) =>
                  v == null ? null : Data.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$RedditPostResponseToJson(RedditPostResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Data',
      json,
      ($checkedConvert) {
        final val = Data(
          after: $checkedConvert('after', (v) => v as String?),
          dist: $checkedConvert('dist', (v) => (v as num?)?.toInt()),
          modhash: $checkedConvert('modhash', (v) => v as String?),
          children: $checkedConvert(
              'children',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Children.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'after': instance.after,
      'dist': instance.dist,
      'modhash': instance.modhash,
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Children',
      json,
      ($checkedConvert) {
        final val = Children(
          kind: $checkedConvert('kind', (v) => v as String?),
          data: $checkedConvert(
              'data',
              (v) => v == null
                  ? null
                  : ChildData.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data?.toJson(),
    };

ChildData _$ChildDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ChildData',
      json,
      ($checkedConvert) {
        final val = ChildData(
          subreddit: $checkedConvert('subreddit', (v) => v as String?),
          selftext: $checkedConvert('selftext', (v) => v as String?),
          authorFullname:
              $checkedConvert('author_fullname', (v) => v as String?),
          saved: $checkedConvert('saved', (v) => v as bool?),
          gilded: $checkedConvert('gilded', (v) => (v as num?)?.toInt()),
          clicked: $checkedConvert('clicked', (v) => v as bool?),
          title: $checkedConvert('title', (v) => v as String?),
          subredditNamePrefixed:
              $checkedConvert('subreddit_name_prefixed', (v) => v as String?),
          hidden: $checkedConvert('hidden', (v) => v as bool?),
          pwls: $checkedConvert('pwls', (v) => (v as num?)?.toInt()),
          linkFlairCssClass:
              $checkedConvert('link_flair_css_class', (v) => v as String?),
          downs: $checkedConvert('downs', (v) => (v as num?)?.toInt()),
          hideScore: $checkedConvert('hide_score', (v) => v as bool?),
          name: $checkedConvert('name', (v) => v as String?),
          quarantine: $checkedConvert('quarantine', (v) => v as bool?),
          linkFlairTextColor:
              $checkedConvert('link_flair_text_color', (v) => v as String?),
          upvoteRatio:
              $checkedConvert('upvote_ratio', (v) => (v as num?)?.toInt()),
          authorFlairBackgroundColor: $checkedConvert(
              'author_flair_background_color', (v) => v as String?),
          subredditType: $checkedConvert('subreddit_type', (v) => v as String?),
          ups: $checkedConvert('ups', (v) => (v as num?)?.toInt()),
          totalAwardsReceived: $checkedConvert(
              'total_awards_received', (v) => (v as num?)?.toInt()),
          isOriginalContent:
              $checkedConvert('is_original_content', (v) => v as bool?),
          isRedditMediaDomain:
              $checkedConvert('is_reddit_media_domain', (v) => v as bool?),
          isMeta: $checkedConvert('is_meta', (v) => v as bool?),
          linkFlairText:
              $checkedConvert('link_flair_text', (v) => v as String?),
          canModPost: $checkedConvert('can_mod_post', (v) => v as bool?),
          score: $checkedConvert('score', (v) => (v as num?)?.toInt()),
          isCreatedFromAdsUi:
              $checkedConvert('is_created_from_ads_ui', (v) => v as bool?),
          authorPremium: $checkedConvert('author_premium', (v) => v as bool?),
          thumbnail: $checkedConvert('thumbnail', (v) => v as String?),
          authorFlairCssClass:
              $checkedConvert('author_flair_css_class', (v) => v as String?),
          postHint: $checkedConvert('post_hint', (v) => v as String?),
          isSelf: $checkedConvert('is_self', (v) => v as bool?),
          created: $checkedConvert('created', (v) => (v as num?)?.toInt()),
          linkFlairType:
              $checkedConvert('link_flair_type', (v) => v as String?),
          wls: $checkedConvert('wls', (v) => (v as num?)?.toInt()),
          authorFlairType:
              $checkedConvert('author_flair_type', (v) => v as String?),
          domain: $checkedConvert('domain', (v) => v as String?),
          allowLiveComments:
              $checkedConvert('allow_live_comments', (v) => v as bool?),
          selftextHtml: $checkedConvert('selftext_html', (v) => v as String?),
          archived: $checkedConvert('archived', (v) => v as bool?),
          noFollow: $checkedConvert('no_follow', (v) => v as bool?),
          isCrosspostable:
              $checkedConvert('is_crosspostable', (v) => v as bool?),
          pinned: $checkedConvert('pinned', (v) => v as bool?),
          over18: $checkedConvert('over18', (v) => v as bool?),
          preview: $checkedConvert(
              'preview',
              (v) => v == null
                  ? null
                  : Preview.fromJson(v as Map<String, dynamic>)),
          mediaOnly: $checkedConvert('media_only', (v) => v as bool?),
          linkFlairTemplateId:
              $checkedConvert('link_flair_template_id', (v) => v as String?),
          canGild: $checkedConvert('can_gild', (v) => v as bool?),
          spoiler: $checkedConvert('spoiler', (v) => v as bool?),
          locked: $checkedConvert('locked', (v) => v as bool?),
          authorFlairText:
              $checkedConvert('author_flair_text', (v) => v as String?),
          visited: $checkedConvert('visited', (v) => v as bool?),
          subredditId: $checkedConvert('subreddit_id', (v) => v as String?),
          authorIsBlocked:
              $checkedConvert('author_is_blocked', (v) => v as bool?),
          linkFlairBackgroundColor: $checkedConvert(
              'link_flair_background_color', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String?),
          isRobotIndexable:
              $checkedConvert('is_robot_indexable', (v) => v as bool?),
          author: $checkedConvert('author', (v) => v as String?),
          numComments:
              $checkedConvert('num_comments', (v) => (v as num?)?.toInt()),
          sendReplies: $checkedConvert('send_replies', (v) => v as bool?),
          whitelistStatus:
              $checkedConvert('whitelist_status', (v) => v as String?),
          contestMode: $checkedConvert('contest_mode', (v) => v as bool?),
          authorPatreonFlair:
              $checkedConvert('author_patreon_flair', (v) => v as bool?),
          authorFlairTextColor:
              $checkedConvert('author_flair_text_color', (v) => v as String?),
          permalink: $checkedConvert('permalink', (v) => v as String?),
          parentWhitelistStatus:
              $checkedConvert('parent_whitelist_status', (v) => v as String?),
          stickied: $checkedConvert('stickied', (v) => v as bool?),
          url: $checkedConvert('url', (v) => v as String?),
          subredditSubscribers: $checkedConvert(
              'subreddit_subscribers', (v) => (v as num?)?.toInt()),
          createdUtc:
              $checkedConvert('created_utc', (v) => (v as num?)?.toInt()),
          numCrossposts:
              $checkedConvert('num_crossposts', (v) => (v as num?)?.toInt()),
          isVideo: $checkedConvert('is_video', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'authorFullname': 'author_fullname',
        'subredditNamePrefixed': 'subreddit_name_prefixed',
        'linkFlairCssClass': 'link_flair_css_class',
        'hideScore': 'hide_score',
        'linkFlairTextColor': 'link_flair_text_color',
        'upvoteRatio': 'upvote_ratio',
        'authorFlairBackgroundColor': 'author_flair_background_color',
        'subredditType': 'subreddit_type',
        'totalAwardsReceived': 'total_awards_received',
        'isOriginalContent': 'is_original_content',
        'isRedditMediaDomain': 'is_reddit_media_domain',
        'isMeta': 'is_meta',
        'linkFlairText': 'link_flair_text',
        'canModPost': 'can_mod_post',
        'isCreatedFromAdsUi': 'is_created_from_ads_ui',
        'authorPremium': 'author_premium',
        'authorFlairCssClass': 'author_flair_css_class',
        'postHint': 'post_hint',
        'isSelf': 'is_self',
        'linkFlairType': 'link_flair_type',
        'authorFlairType': 'author_flair_type',
        'allowLiveComments': 'allow_live_comments',
        'selftextHtml': 'selftext_html',
        'noFollow': 'no_follow',
        'isCrosspostable': 'is_crosspostable',
        'mediaOnly': 'media_only',
        'linkFlairTemplateId': 'link_flair_template_id',
        'canGild': 'can_gild',
        'authorFlairText': 'author_flair_text',
        'subredditId': 'subreddit_id',
        'authorIsBlocked': 'author_is_blocked',
        'linkFlairBackgroundColor': 'link_flair_background_color',
        'isRobotIndexable': 'is_robot_indexable',
        'numComments': 'num_comments',
        'sendReplies': 'send_replies',
        'whitelistStatus': 'whitelist_status',
        'contestMode': 'contest_mode',
        'authorPatreonFlair': 'author_patreon_flair',
        'authorFlairTextColor': 'author_flair_text_color',
        'parentWhitelistStatus': 'parent_whitelist_status',
        'subredditSubscribers': 'subreddit_subscribers',
        'createdUtc': 'created_utc',
        'numCrossposts': 'num_crossposts',
        'isVideo': 'is_video'
      },
    );

Map<String, dynamic> _$ChildDataToJson(ChildData instance) => <String, dynamic>{
      'subreddit': instance.subreddit,
      'selftext': instance.selftext,
      'author_fullname': instance.authorFullname,
      'saved': instance.saved,
      'gilded': instance.gilded,
      'clicked': instance.clicked,
      'title': instance.title,
      'subreddit_name_prefixed': instance.subredditNamePrefixed,
      'hidden': instance.hidden,
      'pwls': instance.pwls,
      'link_flair_css_class': instance.linkFlairCssClass,
      'downs': instance.downs,
      'hide_score': instance.hideScore,
      'name': instance.name,
      'quarantine': instance.quarantine,
      'link_flair_text_color': instance.linkFlairTextColor,
      'upvote_ratio': instance.upvoteRatio,
      'author_flair_background_color': instance.authorFlairBackgroundColor,
      'subreddit_type': instance.subredditType,
      'ups': instance.ups,
      'total_awards_received': instance.totalAwardsReceived,
      'is_original_content': instance.isOriginalContent,
      'is_reddit_media_domain': instance.isRedditMediaDomain,
      'is_meta': instance.isMeta,
      'link_flair_text': instance.linkFlairText,
      'can_mod_post': instance.canModPost,
      'score': instance.score,
      'is_created_from_ads_ui': instance.isCreatedFromAdsUi,
      'author_premium': instance.authorPremium,
      'thumbnail': instance.thumbnail,
      'author_flair_css_class': instance.authorFlairCssClass,
      'post_hint': instance.postHint,
      'is_self': instance.isSelf,
      'created': instance.created,
      'link_flair_type': instance.linkFlairType,
      'wls': instance.wls,
      'author_flair_type': instance.authorFlairType,
      'domain': instance.domain,
      'allow_live_comments': instance.allowLiveComments,
      'selftext_html': instance.selftextHtml,
      'archived': instance.archived,
      'no_follow': instance.noFollow,
      'is_crosspostable': instance.isCrosspostable,
      'pinned': instance.pinned,
      'over18': instance.over18,
      'preview': instance.preview?.toJson(),
      'media_only': instance.mediaOnly,
      'link_flair_template_id': instance.linkFlairTemplateId,
      'can_gild': instance.canGild,
      'spoiler': instance.spoiler,
      'locked': instance.locked,
      'author_flair_text': instance.authorFlairText,
      'visited': instance.visited,
      'subreddit_id': instance.subredditId,
      'author_is_blocked': instance.authorIsBlocked,
      'link_flair_background_color': instance.linkFlairBackgroundColor,
      'id': instance.id,
      'is_robot_indexable': instance.isRobotIndexable,
      'author': instance.author,
      'num_comments': instance.numComments,
      'send_replies': instance.sendReplies,
      'whitelist_status': instance.whitelistStatus,
      'contest_mode': instance.contestMode,
      'author_patreon_flair': instance.authorPatreonFlair,
      'author_flair_text_color': instance.authorFlairTextColor,
      'permalink': instance.permalink,
      'parent_whitelist_status': instance.parentWhitelistStatus,
      'stickied': instance.stickied,
      'url': instance.url,
      'subreddit_subscribers': instance.subredditSubscribers,
      'created_utc': instance.createdUtc,
      'num_crossposts': instance.numCrossposts,
      'is_video': instance.isVideo,
    };

Preview _$PreviewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Preview',
      json,
      ($checkedConvert) {
        final val = Preview(
          images: $checkedConvert(
              'images',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
                  .toList()),
          enabled: $checkedConvert('enabled', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PreviewToJson(Preview instance) => <String, dynamic>{
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'enabled': instance.enabled,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Images',
      json,
      ($checkedConvert) {
        final val = Images(
          source: $checkedConvert(
              'source',
              (v) => v == null
                  ? null
                  : Source.fromJson(v as Map<String, dynamic>)),
          resolutions: $checkedConvert(
              'resolutions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Resolutions.fromJson(e as Map<String, dynamic>))
                  .toList()),
          id: $checkedConvert('id', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'source': instance.source?.toJson(),
      'resolutions': instance.resolutions?.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Source',
      json,
      ($checkedConvert) {
        final val = Source(
          url: $checkedConvert('url', (v) => v as String?),
          width: $checkedConvert('width', (v) => (v as num?)?.toInt()),
          height: $checkedConvert('height', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

Resolutions _$ResolutionsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Resolutions',
      json,
      ($checkedConvert) {
        final val = Resolutions(
          url: $checkedConvert('url', (v) => v as String?),
          width: $checkedConvert('width', (v) => (v as num?)?.toInt()),
          height: $checkedConvert('height', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ResolutionsToJson(Resolutions instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
