import 'package:flutter/material.dart';
import 'package:flutter_application_1/location_details.dart';
import './models/location.dart';
import './location_details.dart';

class LocationList extends StatelessWidget{
  final List<Location> locations;
  LocationList(this.locations);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      title: Text("location here"),
     
    ),
    body: ListView.builder(
      itemCount: this.locations.length,
      itemBuilder: (context,index){
          return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: _itemThumbnail(this.locations[index]),
            title: _itemTitle(this.locations[index]),
            onTap: () => _navigateToLocateDetails(context,index)
             
            
          );
      }
    ),
    );
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