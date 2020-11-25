import 'package:flutter_provider_architecture/core/enums.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/core/view_models/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  final Api _api = locator<Api>();
  List<Post> _posts;

  List<Post> get posts => _posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    _posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
