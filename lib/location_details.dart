
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/location.dart';
import './models/location.dart';
import 'mocks/mock_location.dart';
import './styles.dart';

class LocationDetails extends StatelessWidget{
  final int  locationId;
  LocationDetails(this.locationId);
  @override
  Widget build(BuildContext context){
    var location = MockLocation.fetch(locationId);
    return Scaffold(
    appBar: AppBar(
      title: Text(location.name),
    ),
    body:SingleChildScrollView(
    child:Column( crossAxisAlignment: CrossAxisAlignment.stretch,
      children:_renderBody(context,location),
      ) ,
  ));
  }
  List<Widget> _renderBody(BuildContext context, Location location){
      var result = <Widget>[];
      result.add(_bannerimage(location.url, 170.0));
      result.addAll(_renderFacts(context,location));
      return result;
  }
  List<Widget> _renderFacts(BuildContext context ,Location location){
    var result = <Widget>[];
    for(int i=0;i<location.facts.length;i++){
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));

    }
    return result;
  }
  Widget _sectionTitle(String text){
    return Container( 
      padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,15.0),
    child:Text(text,
                textAlign:TextAlign.left,
                style:Styles.headerLarge,    
                  
              
    ));
  }
   Widget _sectionText(String text){
    return Container( 
      padding: EdgeInsets.fromLTRB(20.0,25.0,25.0,10.0),
    child:Text(text));
  }
  Widget _bannerimage(String url,double height){
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url,fit: BoxFit.fitWidth,),
    );
  }
}

