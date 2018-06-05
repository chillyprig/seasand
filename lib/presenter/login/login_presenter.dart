import 'login_contract.dart';

class LoginPresenter implements LoginContractPresenter {

  LoginContractView view;

  LoginPresenter(LoginContractView view) {
    this.view = view;
  }

  @override
  void performLoginFacebook() {
    view.showFacebookButtonLoading();

    // TODO do login
    view.hideFacebookButtonLoading();
  }
}