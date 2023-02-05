import 'package:flutter/material.dart';
import 'package:ipgeofinder/logic/cubit/ip_cubit.dart';

class IpLoadedWidget extends StatelessWidget {
  final IpLoaded state;

  const IpLoadedWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'IP: ${state.ip}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Image.network(
          state.countryFlag,
          width: 120,
        ),
        const SizedBox(height: 20),
        Text(
          'Country: ${state.countryName}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'City: ${state.city}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Postition: ${state.latitude} ${state.longitude}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
