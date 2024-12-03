import 'package:get/get.dart';
import 'app_exceptions.dart';
import 'dialog_helper.dart';

class BaseGetxController extends GetxController {
  // #Region Dialogs
  void showGetXLoading() {
    DialogHelper.showGetXLoading();
  }

  void hideGetXLoading() {
    DialogHelper.hideGetXLoading();
  }

  // void genericDialog({
  //   required Widget child,
  //   required double height,
  // }) {
  //   DialogHelper.showGenericDialog(
  //     height: height,
  //     child: child,
  //   );
  // }
  // #EndRegion

  void handleError(dynamic error) {
    hideGetXLoading();
    if (error is BadRequestException) {
      DialogHelper.showErrorSnackbar(
        error.message,
        title: "BadRequestException",
      );
      return;
    }
    if (error is FetchDataException) {
      DialogHelper.showErrorSnackbar(
        error.message,
        title: "FetchDataException",
      );
      return;
    }
    if (error is InvalidAuthException) {
      DialogHelper.showErrorSnackbar(
        error.message,
        title: "InvalidAuthException",
      );
      return;
    }
    if (error is NotFoundException) {
      DialogHelper.showErrorSnackbar(
        error.message,
        title: "NotFoundException",
      );
      return;
    }
    if (error is ApiNotRespondingException) {
      DialogHelper.showErrorSnackbar(
        error.message,
        title: "ApiNotRespondingException",
      );
      return;
    }
    // if (error is SignInWithAppleAuthorizationException) {
    //   DialogHelper.showErrorSnackbar(error.message);
    //   return;
    // }

    // print("handleError:Exception");
    // print(error.toString());
    DialogHelper.showErrorSnackbar(error.toString());
  }
}
