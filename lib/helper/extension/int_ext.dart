extension WordCountExt on int {
  String getWordCountText() {
    if (this > 1) {
      return '$this words';
    } else if (this == 1) {
      return '$this word';
    } else {
      return '0 word';
    }
  }
}

extension IntExt on int {
  String getSuffix() {
    String suffix;
    if (this % 100 >= 11 && this % 100 <= 13) {
      suffix = 'th';
    } else if (this % 10 == 1) {
      suffix = 'st';
    } else if (this % 10 == 2) {
      suffix = 'nd';
    } else if (this % 10 == 3) {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    return suffix;
  }
}
