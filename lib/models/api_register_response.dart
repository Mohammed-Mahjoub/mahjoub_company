class ApiRegisterResponse {
  final String message;
  final bool success;
  final int? code;
  ApiRegisterResponse(this.message, this.success, {this.code});
}
