class ApiBase {
  static const _localUrl = 'http://192.168.0.154:8080/api';
  static const _defaultUrl =
      'https://asset-variation-api.azurewebsites.net/api';

  static const isLocal = false;

  static String get url => isLocal ? _localUrl : _defaultUrl;
}
