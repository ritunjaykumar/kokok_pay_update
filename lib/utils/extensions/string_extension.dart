extension OnString on String? {
  String notNull() {
    return this == null ? '' : this!;
  }

  bool empty() {
    return this == null || this!.isEmpty;
  }

  int getLength() {
    return this == null ? 0 : this!.length;
  }

  bool isEmailId() {
    if (empty()) {
      return false;
    }
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!);
  }

  String noResponse() {
    return this == null ? 'Something went wrong, try again' : this!;
  }
}
