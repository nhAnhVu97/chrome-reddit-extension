import 'package:json_annotation/json_annotation.dart';
part 'reddit_post_response.g.dart';

@JsonSerializable()
class RedditPostResponse {
  String? kind;
  Data? data;

  RedditPostResponse({
    this.kind,
    this.data,
  });

  factory RedditPostResponse.fromJson(Map<String, dynamic> json) => _$RedditPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RedditPostResponseToJson(this);
}

@JsonSerializable()
class Data {
  String? after;
  int? dist;
  String? modhash;
  List<Children>? children;

  Data({
    this.after,
    this.dist,
    this.modhash,
    this.children,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Children {
  String? kind;
  ChildData? data;

  Children({
    this.kind,
    this.data,
  });

  factory Children.fromJson(Map<String, dynamic> json) => _$ChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ChildData {
  String? subreddit;
  String? selftext;
  String? authorFullname;
  bool? saved;
  int? gilded;
  bool? clicked;
  String? title;
  String? subredditNamePrefixed;
  bool? hidden;
  int? pwls;
  String? linkFlairCssClass;
  int? downs;
  bool? hideScore;
  String? name;
  bool? quarantine;
  String? linkFlairTextColor;
  int? upvoteRatio;
  String? authorFlairBackgroundColor;
  String? subredditType;
  int? ups;
  int? totalAwardsReceived;
  bool? isOriginalContent;
  bool? isRedditMediaDomain;
  bool? isMeta;
  String? linkFlairText;
  bool? canModPost;
  int? score;
  bool? isCreatedFromAdsUi;
  bool? authorPremium;
  String? thumbnail;
  String? authorFlairCssClass;
  String? postHint;
  bool? isSelf;
  int? created;
  String? linkFlairType;
  int? wls;
  String? authorFlairType;
  String? domain;
  bool? allowLiveComments;
  String? selftextHtml;
  bool? archived;
  bool? noFollow;
  bool? isCrosspostable;
  bool? pinned;
  bool? over18;
  Preview? preview;
  bool? mediaOnly;
  String? linkFlairTemplateId;
  bool? canGild;
  bool? spoiler;
  bool? locked;
  String? authorFlairText;
  bool? visited;
  String? subredditId;
  bool? authorIsBlocked;
  String? linkFlairBackgroundColor;
  String? id;
  bool? isRobotIndexable;
  String? author;
  int? numComments;
  bool? sendReplies;
  String? whitelistStatus;
  bool? contestMode;
  bool? authorPatreonFlair;
  String? authorFlairTextColor;
  String? permalink;
  String? parentWhitelistStatus;
  bool? stickied;
  String? url;
  int? subredditSubscribers;
  int? createdUtc;
  int? numCrossposts;
  bool? isVideo;

  ChildData({
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.gilded,
    this.clicked,
    this.title,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.isOriginalContent,
    this.isRedditMediaDomain,
    this.isMeta,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.authorFlairCssClass,
    this.postHint,
    this.isSelf,
    this.created,
    this.linkFlairType,
    this.wls,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
    this.mediaOnly,
    this.linkFlairTemplateId,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.visited,
    this.subredditId,
    this.authorIsBlocked,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.author,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.isVideo,
  });

  factory ChildData.fromJson(Map<String, dynamic> json) => _$ChildDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChildDataToJson(this);
}

@JsonSerializable()
class Preview {
  List<Images>? images;
  bool? enabled;

  Preview({
    this.images,
    this.enabled,
  });

  factory Preview.fromJson(Map<String, dynamic> json) => _$PreviewFromJson(json);

  Map<String, dynamic> toJson() => _$PreviewToJson(this);
}

@JsonSerializable()
class Images {
  Source? source;
  List<Resolutions>? resolutions;
  String? id;

  Images({
    this.source,
    this.resolutions,
    this.id,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Source {
  String? url;
  int? width;
  int? height;

  Source({
    this.url,
    this.width,
    this.height,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class Resolutions {
  String? url;
  int? width;
  int? height;

  Resolutions({
    this.url,
    this.width,
    this.height,
  });

  factory Resolutions.fromJson(Map<String, dynamic> json) => _$ResolutionsFromJson(json);

  Map<String, dynamic> toJson() => _$ResolutionsToJson(this);
}
