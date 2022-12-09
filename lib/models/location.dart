import 'package:json_annotation/json_annotation.dart';
import './location_fact.dart';

part 'location.g.dart';
@JsonSerializable()
class Location{
  int id;
   String name;
   String url;
   List<LocationFact> facts;
  Location({required this.id,required this.name,required this.url,required this.facts});
  factory Location.fromJson(Map<String,dynamic> json)=>
  _$LocationFromJson(json);


}



