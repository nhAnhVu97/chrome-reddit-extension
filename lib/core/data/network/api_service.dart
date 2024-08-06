import 'package:chrome_ext/core/data/models/post/reddit_post_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET("https://api.reddit.com/r/{tag}.json")
  Future<RedditPostResponse> fetchHotPosts(@Path() String tag);
}
