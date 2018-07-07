import 'dart:async';

import 'login_contract.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPresenter implements LoginContractPresenter {
  LoginContractView _view;

  final FacebookLogin _facebookSignIn = new FacebookLogin();
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  LoginPresenter(LoginContractView view) {
    this._view = view;
  }

  @override
  void performLoginFacebook() {
    _view.showFacebookButtonLoading();

    _handleFacebookSignIn().then((bool isSuccess) {
      _view.hideFacebookButtonLoading();
      if (!isSuccess) {
        _view.showErrorAlertToast();
      }
    }).catchError((e) {
      print(e);
      _view.hideFacebookButtonLoading();
    });
  }

  Future<bool> _handleFacebookSignIn() async {
    final FacebookLoginResult result =
        await _facebookSignIn.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        /**
       * Token: ${accessToken.token}
       * User id: ${accessToken.userId}
       * Expires: ${accessToken.expires}
       * Permissions: ${accessToken.permissions}
       * Declined permissions: ${accessToken.declinedPermissions}
       */
        return await _handleFireBaseSignIn(result.accessToken);
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        throw new Exception(result.errorMessage);
    }
    return false;
  }

  Future<bool> _handleFireBaseSignIn(FacebookAccessToken accessToken) async {
    /**
     * assert(user.email != null);
     * assert(user.displayName != null);
     * assert(!user.isAnonymous);
     * assert(await user.getIdToken() != null);
     */
    final FirebaseUser currentUser = await _fireBaseAuth.signInWithFacebook(accessToken: accessToken.token);

    /**
     * Now you can use await _auth.currentUser(); to access current user
     */
    return currentUser != null;
  }
}
