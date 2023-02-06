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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              state.countryFlag,
              width: 85,
              height: 85,
              errorBuilder: (_, __, ___) {
                return const Icon(Icons.error, color: Colors.red);
              },
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Padding(padding: EdgeInsets.all(9), child: CircularProgressIndicator());
              },
            ),
            Text(
              'Country: ${state.countryName}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
