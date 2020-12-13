import 'package:flutter_provider_architecture/core/enums.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/core/services/post_service.dart';
import 'package:flutter_provider_architecture/core/view_models/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
