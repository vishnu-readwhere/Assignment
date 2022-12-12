import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import './location_fact.dart';
import '../endpoint.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

part 'location.g.dart';
@JsonSerializable()
class Location{
  int id;
   String name;
   String url;
   List<dynamic> facts;
  Location({required this.id,required this.name,required this.url,required this.facts});


  Location.blank()
     : id=0,
       name='',
       url='',
       facts=[];

  factory Location.fromJson(Map<String,dynamic> json)=>
  _$LocationFromJson(json);

static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }

}



