import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/enums.dart';
import 'package:flutter_provider_architecture/core/view_models/login_model.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/views/base_view.dart';
import 'package:flutter_provider_architecture/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (_, model, __) => Scaffold(
              backgroundColor: backgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginHeader(validationMessage: model.errorMessage, controller: controller),
                  model.state == ViewState.Busy
                      ? CircularProgressIndicator()
                      : FlatButton(
                          onPressed: () async {
                            final loginSuccess = await model.login(controller.text);
                            if (loginSuccess) {
                              // Navigate to the home view
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          color: Colors.white,
                          child: Text('Login'))
                ],
              ),
            ));
  }
}
