class FunctionsAndInfo{
  static late double _screenHeight, _screenWidth;

  void setScreenSize(double height, double width){
    _screenHeight = height;
    _screenWidth = width;
  }

  double getScreenHeight(){
    return _screenHeight;
  }
  double getScreenWidth(){
    return _screenWidth;
  }
}
