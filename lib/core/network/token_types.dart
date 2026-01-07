enum TokenType {
  /// JSON body + Authorization
  contentType,

  /// Authorization only (GET requests usually)
  authorization,

  /// Multipart form data (images, files)
  multipart,

  /// application/x-www-form-urlencoded
  urlencoded,

  /// Accept any response type
  acceptAll,

  /// No auth, no content type (public requests)
  none,
}
