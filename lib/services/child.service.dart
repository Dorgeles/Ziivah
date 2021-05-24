class ChildService {
  //singleton
  static final ChildService _service = ChildService._internal();
  static final String _instanceRef = "Child";

  factory ChildService() {
    return _service;
  }

  ChildService._internal();
}
