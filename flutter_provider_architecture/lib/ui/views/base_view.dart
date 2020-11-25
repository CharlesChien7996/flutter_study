import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/view_models/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  const BaseView({Key key, @required this.builder, this.onModelReady}) : super(key: key);

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  final T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(value: model, child: Consumer<T>(builder: widget.builder));
  }
}
