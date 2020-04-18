class Helper {

  static height(value, size) {
    final newHeight = size.height * (value / 812); //812 is reference iPhone X screen height
    // print("Height: " + value.toString() + " -> " + newHeight.toString());
    return newHeight;
  }

  static width(value, size) {
    final newWidth = size.width * (value / 375);//375 is reference iPhone X screen width
    // print("Width: " + value.toString() + " -> " + newWidth.toString());
    return newWidth;
  }

  static month(int monthNum) {
    switch (monthNum) {
      case 1:
        return "января";
      case 2:
        return "февраля";
      case 3:
        return "марта";
      case 4:
        return "апреля";
      case 5:
        return "мая";
      case 6:
        return "июня";
      case 7:
        return "июля";
      case 8:
        return "августа";
      case 9:
        return "сентября";
      case 10:
        return "октября";
      case 11:
        return "ноября";
      case 12:
        return "декабря";
    }
  }
}
