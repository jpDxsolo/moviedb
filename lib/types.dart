enum HttpMethod { get, post, put, delete }

class Endpoint {
  final String path;
  final HttpMethod verb;
  final String? name;

  const Endpoint({
    required this.path,
    required this.verb,
    this.name,
  });
}

class EndpointGroup {
  final String prefix;
  final List<Endpoint> endpoints;

  const EndpointGroup({
    required this.prefix,
    required this.endpoints,
  });
}

class Request {
  final dynamic id;
  final String? language;
  final String? requestToken;

  Request({
    this.id,
    this.language,
    this.requestToken,
  });
}

class Response {}

class AuthenticationToken extends Response {
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  AuthenticationToken({
    this.success,
    this.expiresAt,
    this.requestToken,
  });
}

class RequestParams {
  final dynamic id;
  final String? language;

  RequestParams({
    this.id,
    this.language,
  });
}

class SessionRequestParams extends RequestParams {
  final String requestToken;

  SessionRequestParams({
    dynamic id,
    String? language,
    required this.requestToken,
  }) : super(id: id, language: language);
}

class SessionResponse extends Response {
  final String? sessionId;

  SessionResponse({this.sessionId});
}

class RequestOptions {
  final String? appendToResponse;
  final int? timeout;

  RequestOptions({
    this.appendToResponse,
    this.timeout,
  });
}

class Genre {
  final int? id;
  final String? name;

  Genre({this.id, this.name});
}

class ProductionCompany {
  final String? name;
  final int? id;
  final String? logoPath;
  final String? originCountry;

  ProductionCompany({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });
}

class ProductionCountry {
  final String? name;
  final String? iso31661;

  ProductionCountry({
    this.name,
    this.iso31661,
  });
}

class SpokenLanguage {
  final String? iso6391;
  final String? name;

  SpokenLanguage({
    this.iso6391,
    this.name,
  });
}
