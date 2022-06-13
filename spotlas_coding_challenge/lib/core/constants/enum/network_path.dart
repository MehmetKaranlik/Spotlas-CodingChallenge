enum NetworkPath {
  baseUrl("https://dev.api.spotlas.com/"),
  feedUrl("/interview/feed");

  const NetworkPath(this.value);
  final String value;
}
