import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/location_details.dart';
import './models/location.dart';
import './location_details.dart';

class LocationList extends StatefulWidget{
  @override
  createState()=>_LocationListState();
}
class _LocationListState extends State<LocationList>{
   List<Location> locations=[];
 
  @override
  void initState(){
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      title: Text("location here"),
     
    ),
    body: ListView.builder(
      itemCount: this.locations.length,
      itemBuilder: (context,index){
        final location = this.locations[index];
          return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: _itemThumbnail(location),
            title: _itemTitle(location),
            onTap: () => _navigateToLocateDetails(context,location.id)
             
            
          );
      }
    ),
    );
  }
  loadData() async{
    final locations = await Location.fetchAll();
    setState(() {
      
    });
    this.locations = locations;
  }
  void _navigateToLocateDetails(BuildContext context,int locationId){
     Navigator.push(context, MaterialPageRoute(builder: (context) => LocationDetails(locationId)));
  }
  Widget _itemThumbnail(Location location){
    return Container(
      constraints: BoxConstraints.tightFor(width:100.0),
      child: Image.network(location.url,fit: BoxFit.fitWidth),
    );
  }
  Widget _itemTitle(Location location){
    return Text(location.name);
  }
}