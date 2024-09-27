class CommaString {
  List<String> data;

  CommaString() : data = []; // Initialize data

  String concatenateCommaStrings() {
    return data.join(', '); // Concatenate strings with comma
  }

  void addCommaString(String? strings) {
    if (strings != null) { // Correctly check if strings is not null
      data.add(strings);
    }
  }
}

class HyphenString {
  List<String> data;

  HyphenString() : data = []; // Initialize data

  String concatenateHyphenStrings() {
    return data.join('- '); // Concatenate strings with comma
  }

  void addHyphenString(String? strings) {
    if (strings != null) { // Correctly check if strings is not null
      data.add(strings);
    }
  }
}