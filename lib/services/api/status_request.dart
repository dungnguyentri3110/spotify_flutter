class StatusRequest {
  StatusRequest.createInstance();
  static final instance = StatusRequest.createInstance();
  factory StatusRequest() {
    return instance;
  }

  int success = 200,
      badRequest = 400,
      networkError = 999,
      internalServer = 500,
      notFound = 404;
}
