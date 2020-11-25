import 'package:flutter/foundation.dart';
import 'package:flutter_provider_architecture/core/enums.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/core/view_models/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userText) async {
    setState(ViewState.Busy);

    final userId = int.tryParse(userText);
    if (userId == null) {
      errorMessage = 'Value entered is not number';
      setState(ViewState.Idle);
      return false;
    }
    final success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
