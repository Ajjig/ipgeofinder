import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ipgeofinder/logic/cubit/ip_cubit.dart';
import 'package:ipgeofinder/presentation/theme/colors.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/index.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final MapController controller = MapController();

  void moveTo(double lat, double lng) {
    controller.move(LatLng(lat, lng), 13.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ipgeofinder', style: TextStyle(color: kSecondColor)),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.teal,
            height: double.infinity,
            width: double.infinity,
            child: FlutterMap(
              mapController: controller,
              options: MapOptions(
                center: LatLng(31.791702, -7.09262),
                zoom: 13.0,
                keepAlive: true,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
              ],
            ),
          ),
          BlocProvider<IpCubit>(
            create: (_) => IpCubit(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchTextField(),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(210, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  height: 250,
                  width: double.infinity,
                  child: BlocBuilder<IpCubit, IpState>(
                    builder: (_, state) {
                      if (state is IpInit) {
                        return const IpInitWidget();
                      } else if (state is IpLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is IpLoaded) {
                        // this to avoid calling moveTo() while building
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          moveTo(state.latitude, state.longitude);
                        });
                        return IpLoadedWidget(state: state);
                      } else if (state is IpInvalid) {
                        return const IpInvalidWidget();
                      } else {
                        return const IpErrorWidget();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
