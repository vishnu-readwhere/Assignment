import 'dart:core';

class Endpoint{
  static const apiSchema = 'https';
  static const apiHost = 'fluttercrashcourse.com';
  static const prefix =  '/api/v1';

  static Uri uri(String path,{required Map<String,dynamic> queryParameters}){
    final uri = new Uri(
      scheme: apiSchema,
      host: apiHost,
      path:'$prefix$path',
      queryParameters: queryParameters,
    );
    return uri;
  }
}