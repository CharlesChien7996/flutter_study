import 'package:flutter_provider_architecture/core/enums.dart';
import 'package:flutter_provider_architecture/core/models/comment.dart';
import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/core/view_models/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class CommentsModel extends BaseModel {
  final Api _api = locator<Api>();
  List<Comment> _comments;

  List<Comment> get comments => _comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    _comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
