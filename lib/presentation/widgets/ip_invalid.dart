import 'package:flutter/material.dart';
import 'package:ipgeofinder/logic/cubit/ip_cubit.dart';

class IpInvalidWidget extends StatelessWidget {
  const IpInvalidWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Invalid IP address',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
