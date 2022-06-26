import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(41.4317736, -79.9639187);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: MapViewPage,
      onPageBuilder: (context, widget) {
        return Scaffold(
          appBar: OrgAppBar(
            title: 'selected location',
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
        );
      },
    );
  }
}
