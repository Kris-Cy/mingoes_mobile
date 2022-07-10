import 'dart:async';
import 'dart:ffi';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';



class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: FunctionsAndInfo().getScreenHeight() * 0.595,
      width: FunctionsAndInfo().getScreenWidth(),
      child: MapArea(),
      );
  }
}
class MapArea extends StatefulWidget {
  @override
  _MapAreaState createState() => _MapAreaState();
}

class _MapAreaState extends State<MapArea> {

  static LatLng cameraFocus = LatLng(25.061295,-77.354246);
  LatLng _initialCameraPosition = cameraFocus;
  late GoogleMapController _controller;
  Location _location = Location();
  static late LatLng _myLocation;
  static late LatLng _destinationLocation;
  static var activeSet;
  static var selectedMarkers;
  static late var _info = null;
  static late var currentList = null;
  static late var currentMarker = null;

  static Set<Marker> Blocks = {
    new Marker(
        markerId: MarkerId('G Block'),
        position: LatLng(25.0631078, -77.3531054),
        infoWindow: InfoWindow(
          title: 'G Block',
        ),
    ),
    new Marker(
      markerId: MarkerId('S Block'),
      position: LatLng(25.0629233, -77.3542316),
      infoWindow: InfoWindow(
        title: 'S Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('D Block'),
      position: LatLng(25.0629233, -77.3542316),
      infoWindow: InfoWindow(
        title: 'D Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('F Block'),
      position: LatLng(25.0630032, -77.3538487),
      infoWindow: InfoWindow(
        title: 'F Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('E Block'),
      position: LatLng(25.0630704, -77.353694),
      infoWindow: InfoWindow(
        title: 'E Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('C Block'),
      position: LatLng(25.0630704, -77.353694),
      infoWindow: InfoWindow(
        title: 'C Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('B Block'),
      position: LatLng(25.0614417, -77.354449),
      infoWindow: InfoWindow(
        title: 'B Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('T Block'),
      position: LatLng(25.0613152, -77.3537557),
      infoWindow: InfoWindow(
        title: 'T Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('M Block'),
      position: LatLng(25.062036, -77.355069),
      infoWindow: InfoWindow(
        title: 'M Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('CATS'),
      position: LatLng(25.060468, -77.355702),
      infoWindow: InfoWindow(
        title: 'CATS',
      ),
    ),
    new Marker(
      markerId: MarkerId('CATS Culinary Block'),
      position: LatLng(25.059983, -77.355815),
      infoWindow: InfoWindow(
        title: 'CATS Culinary Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('Michael Eldon Building'),
      position: LatLng(25.063471, -77.355856),
      infoWindow: InfoWindow(
        title: 'Michael Eldon Building',
      ),
    ),
    new Marker(
      markerId: MarkerId('University of the West Indies'),
      position: LatLng(25.059866, -77.356287),
      infoWindow: InfoWindow(
        title: 'University of the West Indies',
      ),
    ),
  };

  static Set<Marker> Offices = {
    new Marker(
      markerId: MarkerId('Portia Smith Student Services Block'),
      position: LatLng(25.062578, -77.352801),
      infoWindow: InfoWindow(
        title: 'Portia Smith Student Services Block',
      ),
    ),
    new Marker(
      markerId: MarkerId('OIT'),
      position: LatLng(25.0634603, -77.353723),
      infoWindow: InfoWindow(
        title: 'Office of IT',
      ),
    ),
    new Marker(
      markerId: MarkerId('English Office'),
      position: LatLng(25.0635014, -77.3541764),
      infoWindow: InfoWindow(
        title: 'English Office',
      ),
    ),
    new Marker(
      markerId: MarkerId('Campus Police'),
      position: LatLng(25.0635014, -77.3541764),
      infoWindow: InfoWindow(
        title: 'Campus Police',
      ),
    ),
    new Marker(
      markerId: MarkerId('Nurse'),
      position: LatLng(25.0632873, -77.354342),
      infoWindow: InfoWindow(
        title: 'Nurse',
      ),
    ),
    new Marker(
      markerId: MarkerId('Dean of Business'),
      position: LatLng(25.0632873, -77.354342),
      infoWindow: InfoWindow(
        title: 'Dean of Business',
      ),
    ),
  };

  static Set<Marker> Facilities= {
    new Marker(
      markerId: MarkerId('Harry C. Moore Library'),
      position: LatLng(25.061426, -77.355163),
      infoWindow: InfoWindow(
        title: 'Harry C. Moore Library',
      ),
    ),
    new Marker(
      markerId: MarkerId('Chapter One Bookstore'),
      position: LatLng(25.063317, -77.355295),
      infoWindow: InfoWindow(
        title: 'Chapter One Bookstore',
      ),
    ),
    new Marker(
      markerId: MarkerId('Graduate Center'),
      position: LatLng(25.0609467, -77.3543492),
      infoWindow: InfoWindow(
        title: 'Graduate Center',
      ),
    ),
    new Marker(
      markerId: MarkerId('SIS Complex'),
      position: LatLng(25.0609467, -77.3543492),
      infoWindow: InfoWindow(
        title: 'Small Island Sustainability Complex',
      ),
    ),
    new Marker(
      markerId: MarkerId('Cafe'),
      position: LatLng(25.0618158, -77.3544647),
      infoWindow: InfoWindow(
        title: 'Cafe',
      ),
    ),
    new Marker(
      markerId: MarkerId('SUB'),
      position: LatLng(25.0618158, -77.3544647),
      infoWindow: InfoWindow(
        title: 'Student Union Building',
      ),
    ),
    new Marker(
      markerId: MarkerId('Physical Plant'),
      position: LatLng(25.062449, -77.354887),
      infoWindow: InfoWindow(
        title: 'Physical Plant',
      ),
    ),
    new Marker(
      markerId: MarkerId('Independence Park'),
      position: LatLng(25.062421, -77.3539595),
      infoWindow: InfoWindow(
        title: 'Independence Park',
      ),
    ),
    new Marker(
      markerId: MarkerId('Wellness Center'),
      position: LatLng(25.0625046, -77.3534508),
      infoWindow: InfoWindow(
        title: 'Wellness Center',
      ),
    ),
    new Marker(
      markerId: MarkerId('Disabilities Centre'),
      position: LatLng(25.0630697, -77.3545158),
      infoWindow: InfoWindow(
        title: 'Disabilities Center',
      ),
    ),
    new Marker(
      markerId: MarkerId('Cheque Collection'),
      position: LatLng(25.0630697, -77.3545158),
      infoWindow: InfoWindow(
        title: 'Cheque Collection',
      ),
    ),
    new Marker(
      markerId: MarkerId('Performing Arts Center'),
      position: LatLng(25.0635014, -77.3541764),
      infoWindow: InfoWindow(
        title: 'Performing Arts Center',
      ),
    ),
    new Marker(
      markerId: MarkerId('Choices Diner'),
      position: LatLng(25.059589, -77.356019),
      infoWindow: InfoWindow(
        title: 'Choices Diner',
      ),
    ),
    new Marker(
      markerId: MarkerId('Security Checkpoint'),
      position: LatLng(25.060782, -77.355809),
      infoWindow: InfoWindow(
        title: 'Security Checkpoint',
      ),
    ),
  };

  static Set<Marker> ATMs = {
    new Marker(
      markerId: MarkerId('BOB ATM'),
      position: LatLng(25.061245, -77.355225),
      infoWindow: InfoWindow(
        title: 'BOB ATM',
      ),
    ),
    new Marker(
      markerId: MarkerId('RBC ATM'),
      position: LatLng(25.063240, -77.355301),
      infoWindow: InfoWindow(
        title: 'RBC ATM',
      ),
    ),
  };

  static Set<Marker> Labs = {
    new Marker(
      markerId: MarkerId('Internet Cafe'),
      position: LatLng(25.061301, -77.355152),
      infoWindow: InfoWindow(
        title: 'Internet Cafe',
      ),
    ),
    new Marker(
      markerId: MarkerId('A Block Lab'),
      position: LatLng(25.0634603, -77.353723),
      infoWindow: InfoWindow(
        title: 'A Block Computer Lab',
      ),
    ),
    new Marker(
      markerId: MarkerId('B Block Lab'),
      position: LatLng(25.061296, -77.354477),
      infoWindow: InfoWindow(
        title: 'B Block Computer Lab',
      ),
    ),
    new Marker(
      markerId: MarkerId('T Block Lab 1'),
      position: LatLng(25.061340, -77.353752),
      infoWindow: InfoWindow(
        title: 'T Block Computer Lab',
      ),
    ),
    new Marker(
      markerId: MarkerId('T Block Lab 2'),
      position: LatLng(25.061141, -77.353355),
      infoWindow: InfoWindow(
        title: 'T Block Computer Lab 2',
      ),
    ),
    new Marker(
      markerId: MarkerId('CATS Lab'),
      position: LatLng(25.060335, -77.355855),
      infoWindow: InfoWindow(
        title: 'CATS Computer Lab',
      ),
    ),
  };


  List mapList = [
    'Academic Units',
    'Offices',
    'Facilities',
    'Computer Labs',
    'ATMs',
  ];


  @override
  void initState() {
    super.initState();
    currentList = mapList;
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;

    _location.onLocationChanged.listen((l) async {
      _myLocation = LatLng(l.latitude!, l.longitude!);

      if(cameraFocus==LatLng(0, 0)){
        _info=null;
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(25.061295,-77.354246),
              zoom: 16.9,
              tilt: 00,),
          ),
        );
      }
      else{
        _controller.animateCamera(
            _info!=null
                ? CameraUpdate.newLatLngBounds(_info!.bounds, 50)
                : CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(25.061295,-77.354246),
                zoom: 16.99,
                tilt: 00,),
            )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(currentMarker!=null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              currentList = mapList;
              Navigator.pop(context);
            },
          ),
          title: Text("Map"),
        ),
        body: Container(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: _initialCameraPosition,
                    zoom: 17,
                    tilt: 00),
                mapType: MapType.satellite,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                markers: {currentMarker},
              ),
              Positioned(
                bottom: 30,
                left: 30,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.close
                  ),
                  onPressed: () {
                    setState(() {
                      currentMarker = null;
                    });
                  },
                ),
                // FloatingActionButton(
                //   child: Icon(
                //     Icons.search,
                //   ),
                //   onPressed: () {
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (context) {
                //         return Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(30),
                //                 topRight: Radius.circular(30),
                //             ),
                //           ),
                //           child: Column(
                //             children: [
                //               Container(
                //                 margin: EdgeInsets.all(20),
                //                 child: Text(
                //                   'What are you looking for?',
                //                   style: TextStyle(
                //                     fontSize: 25,
                //                   ),
                //                 ),
                //               ),
                //
                //               Expanded(
                //                 child: Expanded(
                //                   child: ListView.builder(
                //                     itemCount: currentList.length,
                //                     itemBuilder: (
                //                         BuildContext context, int index) {
                //                       return Container(
                //                         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //                         height: 80,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10),
                //                           boxShadow: [
                //                             BoxShadow(
                //                               color: Colors.grey.withOpacity(0.5),
                //                               spreadRadius: 5,
                //                               blurRadius: 7,
                //                               offset: Offset(0, 3), // changes position of shadow
                //                             ),
                //                           ],
                //                         ),
                //                         child: MaterialButton(
                //                           child: Text(currentList[index]),
                //                           onPressed: (){
                //                             switch(currentList[index]){
                //                               case 'Academic Units': {
                //                                 activeSet = Blocks;
                //                                 currentList = [];
                //                                 for(int i=0; i<Blocks.toList().length; i++){
                //                                   currentList.add(Blocks.toList()[i].markerId.value);
                //                                 }
                //                               }
                //                               break;
                //                               case 'Offices': {
                //                                 activeSet = Offices;
                //                                 currentList = [];
                //                                 for(int i=0; i<Offices.toList().length; i++){
                //                                   currentList.add(Offices.toList()[i].markerId.value);
                //                                 }
                //                               }
                //                               break;
                //                               case 'Facilities': {
                //                                 activeSet = Facilities;
                //                                 currentList = [];
                //                                 for(int i=0; i<Facilities.toList().length; i++){
                //                                   currentList.add(Facilities.toList()[i].markerId.value);
                //                                 }
                //                               }
                //                               break;
                //                               case 'Computer Labs': {
                //                                 activeSet = Labs;
                //                                 currentList = [];
                //                                 for(int i=0; i<Labs.toList().length; i++){
                //                                   currentList.add(Labs.toList()[i].markerId.value);
                //                                 }
                //                               }
                //                               break;
                //                               case 'ATMs': {
                //                                 activeSet = ATMs;
                //                                 currentList = [];
                //                                 for(int i=0; i<ATMs.toList().length; i++){
                //                                   currentList.add(ATMs.toList()[i].markerId.value);
                //                                 }
                //                               }
                //                               break;
                //                             }
                //
                //                             print(currentList);
                //                             Navigator.pop(context);
                //                             showModalBottomSheet(context: context, builder: (context){
                //                               return Container(
                //                                 child: Column(
                //                                   children: [
                //                                     Container(
                //                                       margin: EdgeInsets.all(20),
                //                                       child: Text('What are you looking for?',
                //                                         style: TextStyle(
                //                                           fontSize: 25,
                //                                         ),
                //                                       ),
                //                                     ),
                //                                     Expanded(
                //                                       child: ListView.builder(
                //                                           itemCount: currentList.length,
                //                                           itemBuilder: (BuildContext context,
                //                                               int index) {
                //                                             return Container(
                //                                               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //                                               height: 80,
                //                                               decoration: BoxDecoration(
                //                                                 color: Colors.white,
                //                                                 borderRadius: BorderRadius.circular(10),
                //                                                 boxShadow: [
                //                                                   BoxShadow(
                //                                                     color: Colors.grey.withOpacity(0.5),
                //                                                     spreadRadius: 5,
                //                                                     blurRadius: 7,
                //                                                     offset: Offset(0, 3), // changes position of shadow
                //                                                   ),
                //                                                 ],
                //                                               ),
                //                                               child: MaterialButton(
                //                                                   child: Text(currentList[index]),
                //                                                   onPressed: (){
                //                                                     for(int i=0; i<activeSet.length; i++){
                //                                                       if(currentList[index] == activeSet.toList()[index].markerId.value){
                //                                                         currentMarker = activeSet.toList()[index];
                //                                                         Navigator.pop(context);
                //                                                         currentList=mapList;
                //                                                         activeSet = null;
                //                                                         setState(() {
                //                                                         });
                //                                                       }
                //                                                     }
                //                                                   }
                //                                               ),
                //                                             );
                //                                           }),
                //                                     ),
                //                                   ],
                //                                 ),
                //                               );
                //                             }).whenComplete(() => currentList = mapList);
                //                           },
                //                         ),
                //                       );
                //                     },
                //
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     );
                //   },
                // ),
              ),
            ],
          ),
        ),
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              currentList = mapList;
              Navigator.pop(context);
            },
          ),
          title: Text("Map"),
        ),
        body: Container(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: _initialCameraPosition,
                    zoom: 17,
                    tilt: 00),
                mapType: MapType.satellite,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
              ),
              Positioned(
                bottom: 30,
                left: 30,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  'What are you looking for?',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: currentList.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: MaterialButton(
                                          child: Text(currentList[index]),
                                          onPressed: (){
                                            switch(currentList[index]){
                                              case 'Academic Units': {
                                                activeSet = Blocks;
                                                currentList = [];
                                                for(int i=0; i<Blocks.toList().length; i++){
                                                  currentList.add(Blocks.toList()[i].markerId.value);
                                                }
                                              }
                                              break;
                                              case 'Offices': {
                                                activeSet = Offices;
                                                currentList = [];
                                                for(int i=0; i<Offices.toList().length; i++){
                                                  currentList.add(Offices.toList()[i].markerId.value);
                                                }
                                              }
                                              break;
                                              case 'Facilities': {
                                                activeSet = Facilities;
                                                currentList = [];
                                                for(int i=0; i<Facilities.toList().length; i++){
                                                  currentList.add(Facilities.toList()[i].markerId.value);
                                                }
                                              }
                                              break;
                                              case 'Computer Labs': {
                                                activeSet = Labs;
                                                currentList = [];
                                                for(int i=0; i<Labs.toList().length; i++){
                                                  currentList.add(Labs.toList()[i].markerId.value);
                                                }
                                              }
                                              break;
                                              case 'ATMs': {
                                                activeSet = ATMs;
                                                currentList = [];
                                                for(int i=0; i<ATMs.toList().length; i++){
                                                  currentList.add(ATMs.toList()[i].markerId.value);
                                                }
                                              }
                                              break;
                                            }

                                            print(currentList);
                                            Navigator.pop(context);
                                            showModalBottomSheet(context: context, builder: (context){
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(20),
                                                      child: Text(
                                                        'What are you looking for?',
                                                        style: TextStyle(
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                          itemCount: currentList.length,
                                                          itemBuilder: (BuildContext context,
                                                              int index) {
                                                            return Container(
                                                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                              height: 80,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(10),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.grey.withOpacity(0.5),
                                                                    spreadRadius: 5,
                                                                    blurRadius: 7,
                                                                    offset: Offset(0, 3), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child: MaterialButton(
                                                                  child: Text(currentList[index]),
                                                                  onPressed: (){
                                                                    for(int i=0; i<activeSet.length; i++){
                                                                      if(currentList[index] == activeSet.toList()[index].markerId.value){
                                                                        currentMarker = activeSet.toList()[index];
                                                                        Navigator.pop(context);
                                                                        currentList=mapList;
                                                                        activeSet = null;
                                                                        setState(() {
                                                                        });
                                                                      }
                                                                    }
                                                                  }
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).whenComplete(() => currentList = mapList);
                                          },
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}




