import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/view_models/like_button_model.dart';

import '../views/base_view.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({
     this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
        builder: (context, model, child) => Row(
              children: <Widget>[
                Text('Likes ${model.postLikes(postId)}'),
                MaterialButton(
                  color: Colors.white,
                  child: Icon(Icons.thumb_up),
                  onPressed: () {
                    model.increaseLikes(postId);
                  },
                )
              ],
            ));
  }
}
