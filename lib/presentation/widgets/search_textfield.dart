import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/ip_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
      child: TextField(
        onSubmitted: (value) {
          context.read<IpCubit>().fetchIpData(value);
        },
        decoration: const InputDecoration(
          hintText: 'Enter an IP address',
          border: OutlineInputBorder(),
        ),
        enableInteractiveSelection: true,
        autofocus: true,
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
