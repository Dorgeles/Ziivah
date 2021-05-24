class CoachService {
  //singleton
  static final CoachService _service = CoachService._internal();
  static final String _instanceRef = "Coach";

  factory CoachService() {
    return _service;
  }

  CoachService._internal();
}
