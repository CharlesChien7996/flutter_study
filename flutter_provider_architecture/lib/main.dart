import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        create: (_) => locator<AuthenticationService>().userController.stream,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: 'login',
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
