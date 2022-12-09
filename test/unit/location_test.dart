import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/location.dart';

 void main() {
 test('test location deserilization', (){
  const locationJSON = 
  '{"name":"Arashiyama Bamboo Grove","url":"https://cdn-images-1.medium.com/max/2000/1*vdJuSUKWl_SA9Lp-32ebnA.jpeg","facts":[{"title":"summary","text":"this bamboo grave is on the outskirt of kyoto"}]}';
  final locationMap = json.decode(locationJSON) as Map<String,dynamic>;

  expect("Arashiyama Bamboo Grove", equals(locationMap['name']));

  final location = Location.fromJson(locationMap);
  expect(location.name, equals(locationMap['name']));
  //expect(location.name, equals(locationMap['url']));
 }); 
}
