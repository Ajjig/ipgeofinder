import 'package:flutter/material.dart';


class IpInitWidget extends StatelessWidget {
  const IpInitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Enter an IP address above',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
