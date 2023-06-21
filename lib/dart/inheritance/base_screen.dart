abstract class BaseScreen{

  final String _screenName;

  BaseScreen(this._screenName){
    print('Current Screen => $screenName');
  }

  String get screenName => _screenName;

  void startLoading(){
    print('Circle loading');
  }

  void printData();

  void stopLoading(){}

  void showSuccess(){}

  void showError(){}

}