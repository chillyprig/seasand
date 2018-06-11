abstract class LoginContractView {
  void showFacebookButtonLoading() {}

  void hideFacebookButtonLoading() {}

  void showErrorAlertToast() {}
}

abstract class LoginContractPresenter {
  void performLoginFacebook() {}
}